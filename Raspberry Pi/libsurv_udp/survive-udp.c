#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <survive_api.h>
#include <os_generic.h>

static volatile int keepRunning = 1;
volatile int count = 0;

#ifdef __linux__

#include <assert.h>
#include <signal.h>
#include <stdlib.h>

void intHandler(int dummy) {
	if (keepRunning == 0)
		exit(-1);
	keepRunning = 0;
}

#endif

#define SERVERPORT "4950"
#define SENDTOIP "192.168.137.1"

static void log_fn(SurviveSimpleContext *actx, SurviveLogLevel logLevel, const char *msg) {
	fprintf(stderr, "(%7.3f) SimpleApi: %s\n", survive_simple_run_time(actx), msg);
}

int main(int argc, char **argv) {
#ifdef __linux__
	signal(SIGINT, intHandler);
	signal(SIGTERM, intHandler);
	signal(SIGKILL, intHandler);
#endif

	int sockfd;
	struct addrinfo hints, *servinfo, *p;
	int rv;
	char msg[200];

	memset(&hints, 0, sizeof hints);
	hints.ai_family = AF_INET;
	hints.ai_socktype = SOCK_DGRAM;

	getaddrinfo(SENDTOIP, SERVERPORT, &hints, &servinfo);

	for(p = servinfo; p != NULL; p = p->ai_next) {
        if ((sockfd = socket(p->ai_family, p->ai_socktype,
                p->ai_protocol)) == -1) {
            perror("talker: socket");
            continue;
        }
        break;
    }

	SurviveSimpleContext *actx = survive_simple_init_with_logger(argc, argv, log_fn);
	if (actx == 0)
		return 0;

	double start_time = OGGetAbsoluteTime();
	survive_simple_start_thread(actx);

	for (const SurviveSimpleObject *it = survive_simple_get_first_object(actx); it != 0;
		 it = survive_simple_get_next_object(actx, it)) {
		printf("Found '%s'\n", survive_simple_object_name(it));
	}

    struct SurviveSimpleEvent event;
	while (keepRunning && survive_simple_wait_for_event(actx, &event) != SurviveSimpleEventType_Shutdown) {
		switch (event.event_type) {
		case SurviveSimpleEventType_PoseUpdateEvent: {
			const struct SurviveSimplePoseUpdatedEvent *pose_event = survive_simple_get_pose_updated_event(&event);
			SurvivePose pose = pose_event->pose;
			FLT timecode = pose_event->time;
			SurviveVelocity vel = pose_event->velocity;

			int n = sprintf(msg, "%7.3f,%4.3f,%4.3f,%4.3f,%4.3f,%4.3f,%4.3f,%4.3f\n",
				timecode,
				pose.Pos[0], pose.Pos[1], pose.Pos[2],
				pose.Rot[0], pose.Rot[1], pose.Rot[2], pose.Rot[3]);

			sendto(sockfd, msg, n, 0, p->ai_addr, p->ai_addrlen);
			if (count == 5) {
				printf("(%7.3f) %4.3f %4.3f %4.3f\n", timecode, pose.Pos[0], pose.Pos[1], pose.Pos[2]);
				count = 0;
			}
			count++;
			break;
		}
		case SurviveSimpleEventType_ButtonEvent: {
			break;
		}
		case SurviveSimpleEventType_ConfigEvent: {
			const struct SurviveSimpleConfigEvent *cfg_event = survive_simple_get_config_event(&event);
			printf("(%f) %s received configuration of length %u type %d-%d\n", cfg_event->time,
				   survive_simple_object_name(cfg_event->object), (unsigned)strlen(cfg_event->cfg),
				   survive_simple_object_get_type(cfg_event->object),
				   survive_simple_object_get_subtype(cfg_event->object));
			break;
		}
		case SurviveSimpleEventType_DeviceAdded: {
			const struct SurviveSimpleObjectEvent *obj_event = survive_simple_get_object_event(&event);
			printf("(%f) Found '%s'\n", obj_event->time, survive_simple_object_name(obj_event->object));
			break;
		}
		case SurviveSimpleEventType_None:
			break;
		}
	}

	printf("Cleaning up\n");
	freeaddrinfo(servinfo);
	close(sockfd);
	survive_simple_close(actx);
	return 0;
}

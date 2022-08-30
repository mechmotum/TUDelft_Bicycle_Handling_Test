// Copyright 2013,2016 <>< C. N. Lohr.  This file licensed under the terms of the MIT/x11 license.

#ifndef _LINMATH_H
#define _LINMATH_H

#if !defined(__FreeBSD__) && !defined(__APPLE__)
#include <malloc.h>
#endif
#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#include <cnmatrix/cn_matrix.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef LINMATH_EXPORT
#if defined(_WIN32) && !defined(TCC)
#define LINMATH_EXPORT __declspec(dllimport)
#else
#define LINMATH_EXPORT __attribute__((visibility("default")))
#endif
#endif

// Yes, I know it's kind of arbitrary.
#define DEFAULT_EPSILON 0.0000000001

// For printf
#define PFTHREE(x) (x)[0], (x)[1], (x)[2]
#define PFFOUR(x) (x)[0], (x)[1], (x)[2], (x)[3]

#define LINMATHPI ((FLT)3.14159265358979323846)	  /* pi */
#define LINMATHPI_2 ((FLT)1.57079632679489661923) /* pi/2 */
#define LINMATHPI_4 ((FLT)0.78539816339744830962) /* pi/4 */

#ifndef M_PI
#define M_PI LINMATHPI
#endif

#ifdef TCC
#define FLT_FABS(x) (((x) < 0) ? (-(x)) : (x))
#else
#define FLT_FABS FLT_FABS__
#endif

typedef FLT LinmathQuat[4]; // This is the [wxyz] quaternion, in wxyz format.
typedef FLT LinmathPoint2d[2];
typedef FLT LinmathPoint3d[3];
typedef FLT LinmathVec3d[3];
typedef FLT LinmathEulerAngle[3];
typedef FLT LinmathAxisAngle[3];
typedef FLT LinmathAxisAngleMag[3];

typedef struct LinmathEulerPose {
	LinmathPoint3d Pos;
	LinmathEulerAngle EulerRot;
} LinmathEulerPose;

typedef struct LinmathPose {
	LinmathPoint3d Pos;
	LinmathQuat Rot;
} LinmathPose;

typedef struct LinmathAxisAnglePose {
	LinmathPoint3d Pos;
	LinmathAxisAngle AxisAngleRot;
} LinmathAxisAnglePose;

typedef LinmathAxisAnglePose LinmathAxisAngleVelocity;

struct LinmathLine3d {
	LinmathVec3d a, b;
};

struct LinmathPlane {
	LinmathVec3d origin;
	LinmathVec3d normal;
};

LINMATH_EXPORT extern LinmathQuat LinmathQuat_Identity;
LINMATH_EXPORT extern LinmathPose LinmathPose_Identity;

// NOTE: Inputs may never be output with cross product.
LINMATH_EXPORT void cross3d(FLT *out, const FLT *a, const FLT *b);

LINMATH_EXPORT void sub3d(FLT *out, const FLT *a, const FLT *b);
LINMATH_EXPORT void subnd(FLT *out, const FLT *a, const FLT *b, size_t size);
LINMATH_EXPORT void mulnd(FLT *out, const FLT *a, const FLT *b, size_t size);
LINMATH_EXPORT void addnd(FLT *out, const FLT *a, const FLT *b, size_t size);
// out = a + b * s
LINMATH_EXPORT void addscalednd(FLT *out, const FLT *a, const FLT *b, FLT s, size_t size);

LINMATH_EXPORT void add3d(FLT *out, const FLT *a, const FLT *b);

LINMATH_EXPORT void scalend(FLT *out, const FLT *a, FLT scalar, size_t size);
LINMATH_EXPORT void scale3d(FLT *out, const FLT *a, FLT scalar);
LINMATH_EXPORT void invert3d(FLT *out, const FLT *a);

LINMATH_EXPORT FLT norm3d(const FLT *in);
LINMATH_EXPORT FLT normnd(const FLT *in, size_t n);
LINMATH_EXPORT FLT normnd2(const FLT *in, size_t n);
LINMATH_EXPORT void normalize3d(FLT *out, const FLT *in);

LINMATH_EXPORT void linmath_interpolate(FLT *out, int n, const FLT *A, const FLT *B, FLT t);

// out_pts needs to be preallocated with 3 * num_pts FLT's; it doesn't need to be zeroed.
// out_mean can be null if you don't need the mean
LINMATH_EXPORT void center3d(FLT *out_pts, FLT *out_mean, const FLT *pts, int num_pts);
LINMATH_EXPORT void mean3d(LinmathVec3d out, const FLT *pts, int num_pts);

LINMATH_EXPORT FLT dot3d(const FLT *a, const FLT *b);
LINMATH_EXPORT FLT dotnd(const FLT *a, const FLT *b, size_t n);
LINMATH_EXPORT FLT dotnd_strided(const FLT *a, const FLT *b, size_t n, int a_stride, int b_stride);

// Returns 0 if equal.  If either argument is null, 0 will ALWAYS be returned.
LINMATH_EXPORT int compare3d(const FLT *a, const FLT *b, FLT epsilon);

LINMATH_EXPORT void copy3d(FLT *out, const FLT *in);
LINMATH_EXPORT void copynd(FLT *out, const FLT *in, size_t n);

LINMATH_EXPORT FLT magnitude3d(const FLT *a);
LINMATH_EXPORT FLT dist3d(const FLT *a, const FLT *b);
LINMATH_EXPORT FLT distnd(const FLT *a, const FLT *b, size_t len);
LINMATH_EXPORT FLT anglebetween3d(FLT *a, FLT *b);

LINMATH_EXPORT void rotatearoundaxis(FLT *outvec3, const FLT *invec3, const FLT *axis, FLT angle);
LINMATH_EXPORT void angleaxisfrom2vect(FLT *angle, FLT *axis, FLT *src, FLT *dest);
LINMATH_EXPORT void axisanglefromquat(FLT *angle, FLT *axis, const LinmathQuat quat);
// Quaternion things...

LINMATH_EXPORT FLT quatdist(const LinmathQuat q1, const LinmathQuat q2);
LINMATH_EXPORT FLT quatdifference(const LinmathQuat q1, const LinmathQuat q2);
LINMATH_EXPORT void quatset(LinmathQuat q, FLT w, FLT x, FLT y, FLT z);
LINMATH_EXPORT bool quatiszero(const LinmathQuat q);
LINMATH_EXPORT void quatsetnone(LinmathQuat q);
LINMATH_EXPORT void quatcopy(LinmathQuat q, const LinmathQuat qin);
LINMATH_EXPORT void quatfromeuler(LinmathQuat q, const LinmathEulerAngle euler);
LINMATH_EXPORT void quattoeuler(LinmathEulerAngle euler, const LinmathQuat q);
LINMATH_EXPORT void quatfromaxisangle(LinmathQuat q, const FLT *axis, FLT radians);
LINMATH_EXPORT void quatfromaxisanglemag(LinmathQuat q, const LinmathAxisAngle axisangle);
LINMATH_EXPORT void quattoaxisanglemag(LinmathAxisAngleMag ang, const LinmathQuat q);
LINMATH_EXPORT FLT quatmagnitude(const LinmathQuat q);
LINMATH_EXPORT FLT quatinvsqmagnitude(const LinmathQuat q);
LINMATH_EXPORT void quatnormalize(LinmathQuat qout, const LinmathQuat qin); // Safe for in to be same as out.
LINMATH_EXPORT void quattomatrix(FLT *matrix44, const LinmathQuat q);
LINMATH_EXPORT void quattomatrix33(FLT *matrix33, const LinmathQuat qin);
LINMATH_EXPORT void quatfrommatrix(LinmathQuat q, const FLT *matrix44);
LINMATH_EXPORT void quatfrommatrix33(LinmathQuat q, const FLT *matrix33);

struct CnMat;
LINMATH_EXPORT void quatfromcnMatrix(LinmathQuat q, const struct CnMat *matrix33);
LINMATH_EXPORT void quatgetconjugate(LinmathQuat qout, const LinmathQuat qin);

/***
 * Finds the nearest modulo 2*pi of a given axis angle representation that most neatly matches
 * another axis angle vector.
 *
 * @param out Output vector
 * @param inc Axis angle to find modulo answer for
 * @param match Comparison axis angle meant to match up to. Pass in null to match [0, 0, 0].
 */
LINMATH_EXPORT void findnearestaxisanglemag(LinmathAxisAngleMag out, const LinmathAxisAngleMag inc,
											const LinmathAxisAngleMag match);
/***
 * Performs conjugation operation wherein we find
 *
 * q = r * v * r^-1
 *
 * This operation is useful to find equivalent rotations between different reference frames.
 * For instance, if 'v' is a particular rotation in frame A, and 'r' represents the translation
 * from frame 'A' to 'B', q represents that same rotation in frame B
 */
LINMATH_EXPORT void quatconjugateby(LinmathQuat q, const LinmathQuat r, const LinmathQuat v);
LINMATH_EXPORT void quatgetreciprocal(LinmathQuat qout, const LinmathQuat qin);
/***
 * Find q such that q * q0 = q1; where q0, q1, q are unit quaternions
 */
LINMATH_EXPORT void quatfind(LinmathQuat q, const LinmathQuat q0, const LinmathQuat q1);
/***
 * Find q such that q * p0 = p1; where p0, p1, are vectors
 */
LINMATH_EXPORT void quatfind_between_vectors(LinmathQuat q, const LinmathPoint3d p0, const LinmathPoint3d p1);
/***
 * Find q such that q0 * q1 = q; where q0, q1, q are unit quaternions
 *
 * same as quat multiply, not piecewise multiply.
 */
LINMATH_EXPORT void quatrotateabout(LinmathQuat q, const LinmathQuat q0, const LinmathQuat q1);
LINMATH_EXPORT void axisanglerotateabout(LinmathAxisAngle q, const LinmathAxisAngle q0, const LinmathAxisAngle q1);

/***
 * Finds q = qv*t. If 'qv' is thought of an angular velocity, and t is the scalar time span of rotation, q is the
 * arrived at rotation.
 */
LINMATH_EXPORT void quatmultiplyrotation(LinmathQuat q, const LinmathQuat qv, FLT t);

/***
 * Peicewise scaling
 */
LINMATH_EXPORT void quatscale(LinmathQuat qout, const LinmathQuat qin, FLT s);
/***
 * Peicewise division by scalar
 */
LINMATH_EXPORT void quatdivs(LinmathQuat qout, const LinmathQuat qin, FLT s);
/***
 * Peicewise subtraction
 */
LINMATH_EXPORT void quatsub(LinmathQuat qout, const LinmathQuat a, const LinmathQuat b);
/***
 * Peicewise addition
 */
LINMATH_EXPORT void quatadd(LinmathQuat qout, const LinmathQuat a, const LinmathQuat b);
LINMATH_EXPORT FLT quatinnerproduct(const LinmathQuat qa, const LinmathQuat qb);
LINMATH_EXPORT void quatouterproduct(FLT *outvec3, LinmathQuat qa, LinmathQuat qb);
LINMATH_EXPORT void quatevenproduct(LinmathQuat q, LinmathQuat qa, LinmathQuat qb);
LINMATH_EXPORT void quatoddproduct(FLT *outvec3, LinmathQuat qa, LinmathQuat qb);
LINMATH_EXPORT void quatslerp(LinmathQuat q, const LinmathQuat qa, const LinmathQuat qb, FLT t);
LINMATH_EXPORT void quatrotatevector(FLT *vec3out, const LinmathQuat quat, const FLT *vec3in);
LINMATH_EXPORT void eulerrotatevector(FLT *vec3out, const LinmathEulerAngle quat, const FLT *vec3in);
LINMATH_EXPORT void quatfrom2vectors(LinmathQuat q, const FLT *src, const FLT *dest);
LINMATH_EXPORT void eulerfrom2vectors(LinmathEulerAngle q, const FLT *src, const FLT *dest);

LINMATH_EXPORT void axisanglerotatevector(FLT *vec3out, const LinmathAxisAngle axisAngle, const FLT *vec3in);

// This is the quat equivalent of 'pout = pose * pin' if pose were a 4x4 matrix in homogenous space
LINMATH_EXPORT void ApplyPoseToPoint(LinmathPoint3d pout, const LinmathPose *pose, const LinmathPoint3d pin);

// This is the quat equivalent of 'pout = lhs_pose * rhs_pose' if poses were a 4x4 matrix in homogenous space
LINMATH_EXPORT void ApplyPoseToPose(LinmathPose *pout, const LinmathPose *lhs_pose, const LinmathPose *rhs_pose);

LINMATH_EXPORT void PoseSlerp(LinmathPose *out, const LinmathPose *start, const LinmathPose *end, FLT t);

LINMATH_EXPORT void ApplyAxisAngleVelocity(LinmathAxisAnglePose *p_1, FLT t, const LinmathAxisAnglePose *p_0,
										   const LinmathAxisAngleVelocity *vel);
LINMATH_EXPORT void ApplyAxisAnglePoseToPoint(LinmathPoint3d pout, const LinmathAxisAnglePose *pose,
											  const LinmathPoint3d pin);
LINMATH_EXPORT void ApplyAxisAnglePoseToPose(LinmathAxisAnglePose *pout, const LinmathAxisAnglePose *lhs_pose,
											 const LinmathAxisAnglePose *rhs_pose);

// This is the quat equivlant of 'pose_in^-1'; so that ApplyPoseToPose(..., InvertPose(..., pose_in), pose_in) ==
// Identity ( [0, 0, 0], [1, 0, 0, 0] )
// by definition.
LINMATH_EXPORT void InvertPose(LinmathPose *poseout, const LinmathPose *pose_in);

static inline LinmathPose InvertPoseRtn(const LinmathPose *pose_in) {
	LinmathPose rtn;

	InvertPose(&rtn, pose_in);
	return rtn;
}

LINMATH_EXPORT void InvertAAPose(LinmathAxisAnglePose *poseout, const LinmathAxisAnglePose *pose_in);
static inline LinmathAxisAnglePose InvertAAPoseRtn(const LinmathAxisAnglePose *pose_in) {
	LinmathAxisAnglePose rtn;

	InvertAAPose(&rtn, pose_in);
	return rtn;
}

LINMATH_EXPORT void PoseToMatrix(FLT *mat44, const LinmathPose *pose_in);

// Given num_pts in coordinate system B, and in coordinate system A, find the optimal RHS rotation
// which transforms from B to A.
//
// This assumes that the space A and B share an origin.
LINMATH_EXPORT void KabschCentered(LinmathQuat A2Btx, const FLT *ptsA, const FLT *ptsB, int num_pts);
LINMATH_EXPORT void KabschCenteredScaled(LinmathQuat A2Btx, FLT *scale, const FLT *ptsA, const FLT *ptsB, int num_pts);

LINMATH_EXPORT void KabschPoses(LinmathPose *A2Btx, const LinmathPose *ptsA, const LinmathPose *ptsB, int num_poses);
// Same as above except it solves for the center for you
LINMATH_EXPORT void Kabsch(LinmathPose *A2Btx, const FLT *ptsA, const FLT *ptsB, int num_pts);
LINMATH_EXPORT void KabschScaled(LinmathPose *A2Btx, FLT *scale, const FLT *ptsA, const FLT *ptsB, int num_pts);
// Matrix Stuff

typedef struct {
	FLT val[3][3]; // row, column
} Matrix3x3;

LINMATH_EXPORT void rotate_vec(FLT *out, const FLT *in, Matrix3x3 rot);
LINMATH_EXPORT void rotation_between_vecs_to_m3(Matrix3x3 *m, const FLT v1[3], const FLT v2[3]);
Matrix3x3 inverseM33(const Matrix3x3 mat);

LINMATH_EXPORT void matrix44copy(FLT *mout, const FLT *minm);
LINMATH_EXPORT void matrix44transpose(FLT *mout, const FLT *minm);

static inline FLT linmath_enforce_range(FLT v, FLT mn, FLT mx) {
	if (v < mn)
		return mn;
	if (v > mx)
		return mx;
	return v;
}

static inline FLT linmath_max(FLT x, FLT y) { return x > y ? x : y; }
static inline int linmath_imax(int x, int y) { return x > y ? x : y; }

static inline FLT linmath_min(FLT x, FLT y) { return x < y ? x : y; }
static inline int linmath_imin(int x, int y) { return x < y ? x : y; }

static inline LinmathEulerPose Pose2EulerPose(const LinmathPose *pose) {
	LinmathEulerPose p;
	copy3d(p.Pos, pose->Pos);
	quattoeuler(p.EulerRot, pose->Rot);
	return p;
}

static inline LinmathPose EulerPose2Pose(const LinmathEulerPose *pose) {
	LinmathPose p;
	copy3d(p.Pos, pose->Pos);
	quatfromeuler(p.Rot, pose->EulerRot);
	return p;
}

static inline LinmathAxisAnglePose Pose2AAPose(const LinmathPose *pose) {
	LinmathAxisAnglePose p;
	copy3d(p.Pos, pose->Pos);
	quattoaxisanglemag(p.AxisAngleRot, pose->Rot);
	return p;
}
static inline LinmathPose AAPose2Pose(const LinmathAxisAnglePose *pose) {
	LinmathPose p;
	copy3d(p.Pos, pose->Pos);
	quatfromaxisanglemag(p.Rot, pose->AxisAngleRot);
	return p;
}

LINMATH_EXPORT FLT linmath_rand(FLT min, FLT max);
LINMATH_EXPORT FLT linmath_normrand(FLT mu, FLT sigma);
LINMATH_EXPORT FLT linmath_norm_pdf(FLT v, FLT mu, FLT sigma);
LINMATH_EXPORT FLT linmath_chauvenet_criterion(FLT v, FLT mu, FLT sigma, int n);

LINMATH_EXPORT void linmath_find_best_intersection(LinmathPoint3d pt, const struct LinmathLine3d *lines, size_t num);
LINMATH_EXPORT void linmath_get_line_dir(LinmathPoint3d dir, const struct LinmathLine3d *ray);
LINMATH_EXPORT void linmath_pt_along_line(LinmathPoint3d pt, const struct LinmathLine3d *ray, FLT t);
LINMATH_EXPORT FLT linmath_point_distance_from_line(struct LinmathLine3d *ray, LinmathVec3d pt, FLT *t);
struct sparse_matrix {
	size_t rows, cols;
	int16_t *col_index;
	int16_t *row_index;
	FLT *data;
};

#define ALLOC_SPARSE_MATRIX(n, N_ROWS, N_COLS)                                                                         \
	struct sparse_matrix n = {                                                                                         \
		.rows = N_ROWS,                                                                                                \
		.cols = N_COLS,                                                                                                \
		.col_index = alloca(sizeof(uint16_t) * N_ROWS * N_COLS),                                                       \
		.row_index = alloca(sizeof(uint16_t) * (N_ROWS + 1)),                                                          \
		.data = alloca(sizeof(FLT) * N_ROWS * N_COLS),                                                                 \
	};


/**
 * This is a very specialized matrix function to calculate out = A * B * A^t + C
 * which assumes:
 * - A is sparse (If not at least 50% zeros; slower than gemm_ABAt_add)
 * - B is symmetric
 *
 * At about 20% 0's; this is twice as fast as gemm_ABAt_add
 */
LINMATH_EXPORT void matrix_ABAt_add(struct CnMat *out, const struct CnMat *A, const struct CnMat *B,
									const struct CnMat *C);
/**
 *  Standard implementation of out = A * B * A^t + C for testing; just uses svGEMM
 */
LINMATH_EXPORT void gemm_ABAt_add(struct CnMat *out, const struct CnMat *A, const struct CnMat *B,
								  const struct CnMat *C);
/**
 *  Standard implementation of out = A * (B*s) * A^t + C for testing; just uses svGEMM
 */
LINMATH_EXPORT void gemm_ABAt_add_scaled(struct CnMat *out, const struct CnMat *A, const struct CnMat *B,
										 const struct CnMat *C, FLT scale_A, FLT scale_B, FLT scale_C);

#ifdef __cplusplus
}
#endif

#endif

using UnityEngine;
using System.Collections;
using System;
using System.Text;
using System.Net;
using System.Net.Sockets;
using System.Threading;

public class UDPReceive : MonoBehaviour
{

  [Header("UDP settings")]
  [Tooltip("Localhost")]
  [SerializeField] public string IP = "127.0.0.1";
  [Tooltip("Localport")]
  [SerializeField] public int portLocal = 8006;
  [Tooltip("Remote port")]
  [SerializeField] public int portRemote = 8005; // Set to the same as Simulink UDP output

  [Header("Position")]
  [SerializeField] public float vivePos; // Store the bicycle position here
  
  [Header("Current Line")]
  [SerializeField] public int currLine; // Store the current time along the reference here
  // Rather than sending the whole reference over UDP,
  // I am only sending the current time, which I then
  // use to read a corresponding line from the .txt file
  // containing the reference.

  [Header("End of Trial flag")]
  [SerializeField] public int endTrial; // Store the end indicator here

  // Create necessary UdpClient objects
  UdpClient client;
  IPEndPoint remoteEndPoint;

  // Receiving Thread
  Thread receiveThread;

  // info strings
  private string lastReceivedUDPPacket = "";
  private string allReceivedUDPPackets = "";
  // clear this from time to time!

  public void Start ()
  {
    // Initialize UDP
    init();
  }

  public void Update ()
  {
    string newUdpData = getLatestUDPPacket(); // Read the UDP packet 
    string[] splitData = newUdpData.Trim().Split(','); // i am using commas to separate data
    if (newUdpData != "") {
      currLine = int.Parse(splitData[0]); // First field is the time along the reference
      vivePos = float.Parse(splitData[1]); // Second field is the bicycle location
      endTrial = int.Parse(splitData[2]); // Third field indicates whether the trial ended
    }
  }

  // Initialization code
  private void init()
  {
    // Initialize (seen in comments window)
    print("UDP Object init()");

    // Create remote endpoint (to Matlab) 
    remoteEndPoint = new IPEndPoint (IPAddress.Parse (IP), portRemote);

    // Create local client
    client = new UdpClient (portLocal);

    // local endpoint define (where messages are received)
    // Create a new thread for reception of incoming messages
    receiveThread = new Thread (new ThreadStart (ReceiveData));
    receiveThread.IsBackground = true;
    receiveThread.Start ();
  }

  // Receive data, update packets received
  private void ReceiveData()
  {
    while (true) {
      try {
        IPEndPoint anyIP = new IPEndPoint (IPAddress.Any, 0);
        byte[] data = client.Receive (ref anyIP);
        string text = Encoding.UTF8.GetString (data);
        //Debug.Log(text);
        lastReceivedUDPPacket = text;
        allReceivedUDPPackets = allReceivedUDPPackets + text;
      }
      catch (Exception err) {
        print (err.ToString ());
      }
    }
  }

  // getLatestUDPPacket, clears all previous packets
  public string getLatestUDPPacket ()
  {
    allReceivedUDPPackets = "";
    return lastReceivedUDPPacket;
  }

  //Prevent crashes - close clients and threads properly!
  void OnDisable ()
  { 
    if (receiveThread != null) receiveThread.Abort (); 
    client.Close ();
  }
}

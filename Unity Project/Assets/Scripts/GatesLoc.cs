using UnityEngine;
using System.Collections;
using System.IO;

public class GatesLoc : MonoBehaviour
{	
	static int numOfPoints = 375; // Number of points along the horizon (75 Hz sample rate * 5 sec)
	static int numOfLines = 4501; // Number of lines in the reference file
	string[] allGates = new string[numOfLines];
	public int gateZloc; // Z is the axis towards the horizon
	public bool gateFound = false;
	public float gateXloc; // X is the axis from side to side
   			       
	void Start() 
	{
		// Store the file in StreamingAssets
		string fileLocation = Path.Combine(Application.streamingAssetsPath, "gate_locations.txt");
		StreamReader reader = new StreamReader(fileLocation);
		// Read the file and save all lines into one array
	    	for (int i = 0; i < numOfLines; i++) 
	    	{
		       	string gateString = reader.ReadLine();
			allGates[i] = gateString;
	    	}
		// Extract the reference at t=0
		string[] allGateX = allGates[0].Trim().Split(',');
		Vector3 gateLoc = new Vector3();
		// Search if there are gates at this point in time
		gateFound = false;
		float x = 0f;
		float gateZ = 0f;
		for (int i = 0; i < numOfPoints; i++)
		{
			if (allGateX[i] != "99.000")
			{
				// Gate found, save its X position and Z index
				gateXloc = float.Parse(allGateX[i]);
				x = gateXloc / 1.5f; // Divide by 1.5 since the Scale of the ground is set to 1.5
				gateZ = i;
				gateZloc = i;
				gateFound = true;
				break; // Stop looking for other gates 
				// TODO: make this work with multiple gates
			}
		}
		// Display the gate
		if (gateFound) 
		{
			float z = (1f / (float)(numOfPoints-1)) * gateZ - 0.5f; // Calculate Z position
			gateLoc.Set(x, 1.35f, z); // Set the location
		}
		else 
		{
			gateLoc.Set(0.0f, 1.35f, -0.6f); // If no gate, place it behind the bicycle
		}
		transform.localPosition = gateLoc; // Render
	}
    
    	void Update()
    	{
		int currentLine = GameObject.Find("UDPComms").GetComponent<UDPReceive>().currLine;
    		// Extract the reference at current time
		string[] allGateX = allGates[currentLine].Trim().Split(',');
    		Vector3 gateLoc = new Vector3();
    		// Search if there are gates at this point in time
		gateFound = false;
		float x = 0f;
		float gateZ = 0f;
    		for (int i = 0; i < numOfPoints; i++)
		{
			if (allGateX[i] != "99.000")
			{
				// Gate found, save its X position and Z index
				gateXloc = float.Parse(allGateX[i]);
				x = gateXloc / 1.5f; // Divide by 1.5 since the Scale of the ground is set to 1.5
				gateZ = i;
				gateZloc = i;
				gateFound = true;
				break; // Stop looking for other gates
				// TODO: make this work with multiple gates
			}
		}
		// Display the gare
		if (gateFound) 
		{
			float z = (1f / (float)(numOfPoints-1)) * gateZ - 0.5f; // Calculate Z position
			gateLoc.Set(x, 1.35f, z); // Set the location
		}
		else 
		{
			gateLoc.Set(0.0f, 1.35f, -0.6f); // If no gate, place it behind the bicycle
		}
    		transform.localPosition = gateLoc; // Render
    	}
}

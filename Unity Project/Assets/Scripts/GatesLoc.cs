using UnityEngine;
using System.Collections;
using System.IO;

public class GatesLoc : MonoBehaviour
{	
	static int numOfPoints = 375;
	static int numOfLines = 4501; //3201
	string[] allGates = new string[numOfLines];
	public int gateZloc;
	public bool gateFound = false;
	public float gateXloc;
	
	//int DebugCount = 0;
   			       
	void Start() 
	{
		string fileLocation = Path.Combine(Application.streamingAssetsPath, "gate_locations.txt");
		StreamReader reader = new StreamReader(fileLocation);
		// Read the file and save all gate locations
	    	for (int i = 0; i < numOfLines; i++) 
	    	{
		       	string gateString = reader.ReadLine();
			allGates[i] = gateString;
	    	}
		// Extract the gates at t=0
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
				x = gateXloc / 1.5f;
				gateZ = i;
				gateZloc = i;
				gateFound = true;
				break; // Stop looking for other gates
			}
		}
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
    		// Extract and render the reference at current time
		string[] allGateX = allGates[currentLine].Trim().Split(',');
		//string[] allGateX = allGates[DebugCount].Trim().Split(',');
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
				x = gateXloc / 1.5f;
				gateZ = i;
				gateZloc = i;
				gateFound = true;
				break; // Stop looking for other gates
			}
		}
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
		//DebugCount = (DebugCount + 1) % numOfLines;
    	}
}

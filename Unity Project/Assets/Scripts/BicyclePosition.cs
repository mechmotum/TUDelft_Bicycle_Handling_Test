using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class BicyclePosition : MonoBehaviour
{	
	       
    void Start() 
    {
    	float bicyclePos = GameObject.Find("UDPComms").GetComponent<UDPReceive>().vivePos;
    	transform.position = new Vector3(bicyclePos, 0.12f, -0.15f);
    }
    
    void Update()
    {
    	float bicyclePos = GameObject.Find("UDPComms").GetComponent<UDPReceive>().vivePos;
    	transform.position = new Vector3(bicyclePos, 0.12f, -0.15f);
    }
}

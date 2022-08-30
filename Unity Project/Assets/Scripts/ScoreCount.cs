using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class ScoreCount : MonoBehaviour
{
	private int score;
	public TextMeshProUGUI scoreText;

    	void Start()
    	{
        	score = 0;
		scoreText.text = "Score: " + score;
    	}

    	void Update()
    	{
        	float bikePos = GameObject.Find("UDPComms").GetComponent<UDPReceive>().vivePos;
        	float gatePos = GameObject.Find("Ground/SoftStar").GetComponent<GatesLoc>().gateXloc;
        	bool gateFound = GameObject.Find("Ground/SoftStar").GetComponent<GatesLoc>().gateFound;
        	int gateIndex = GameObject.Find("Ground/SoftStar").GetComponent<GatesLoc>().gateZloc;
		int endTrial = GameObject.Find("UDPComms").GetComponent<UDPReceive>().endTrial;
		
		if (endTrial == 0) {
			// Checking when index == 0 might not work reliably due to lost UDP packet
			if (gateFound && gateIndex < 2) 
        		{
            			FindScore(bikePos, gatePos);
        		}
		}
        	else {
			scoreText.text = "END"; 
		}
    	}

	private void FindScore(float bikePos, float gatePos)
	{
		float posError = Mathf.Abs(bikePos - gatePos);
        
        	if (posError <= 0.02)
        	{
            		score = 100;
            		scoreText.text = "Score: " + score;
        	}
        	else if (posError <= 0.22)
        	{
			score = (int)(500f * (0.22f - posError));
            		scoreText.text = "Score: " + score;
        	}
        	else
        	{
            		score = 0;
            		scoreText.text = "Score: " + score;
        	}
	}
}

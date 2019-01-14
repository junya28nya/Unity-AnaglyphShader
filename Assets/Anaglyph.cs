using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Anaglyph : MonoBehaviour {

    public Material mt_anaglyph;
	// Use this for initialization
	void Start () {
		
	}
	// Update is called once per frame
	void Update () {
    	
	}

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, mt_anaglyph);
    }
}

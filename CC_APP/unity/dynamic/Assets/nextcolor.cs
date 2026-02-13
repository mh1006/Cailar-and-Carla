using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class nextcolor : MonoBehaviour
{
    public Color color;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        GetComponent<Renderer>().material.color = nowColor();
    }
   Color nowColor(){
        float r =  unityflutter.input_R/255f;
        float g =  unityflutter.input_G/255f;
        float b =  unityflutter.input_B/255f;
        Color color = new Color(r,g,b);
        return color;
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class magiccolor : MonoBehaviour
{
    // Start is called before the first frame update
   public Color color;
        static public float input_R;
    static public float input_G;
    static public float input_B;
 
    void OnDestroy()
    {
    GameObject.Destroy(GetComponent<Renderer>().material);
    }
 
    // Use this for initialization
    void Start ()
    {
    GetComponent<Renderer>().material.color = getColor();
    }
 
    // Update is called once per frame
    void Update()
    {
        
    }
    Color getColor(){
        float r =  unityflutter.input_R/255f;
        float g =  unityflutter.input_G/255f;
        float b =  unityflutter.input_B/255f;
        Color color = new Color(r,g,b);
        return color;
    }
}

using System;
using UnityEngine.EventSystems;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class unityflutter : MonoBehaviour
{
    static public int input_R;
    static public int input_G;
    static public int input_B;
    public GameObject Magic;


   [SerializeField]
    Color32 Sent;

    // Start is called before the first frame update
    void Start()
    {
        Sent = new Color32(255,255,255,255);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
    // This method is called from Flutter
    public void SetColor(String message)
    {
        if(mybutton.isPause==false&&function.gameover==false){
        byte r = (byte)Convert.ToInt32(message.Substring(10,2), 16);
        byte g = (byte)Convert.ToInt32(message.Substring(12,2), 16);
        byte b = (byte)Convert.ToInt32(message.Substring(14,2), 16);
        Sent = new Color32(255,r, g, b);
        input_R = (int)r;
        input_G = (int)g;
        input_B = (int)b;
        Vector3 pos = new Vector3(0f,-3.5f,0); //宣告位置pos
        Instantiate(Magic,pos,transform.rotation);//產生魔法}
        }
        else{
            message="";
        }
    }
}

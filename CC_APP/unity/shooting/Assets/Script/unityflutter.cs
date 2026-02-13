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
    static public int s;
    static bool isPause;
    public Canvas Canvas_Pause;
    //public Canvas Playing;

    [SerializeField]
    Color32 Sent;

    // Start is called before the first frame update
    void Start()
    {
        Sent = new Color32(255, 255, 255, 255);
    }

    // Update is called once per frame
    void Update()
    {

    }
    // This method is called from Flutter
    public void SetColor(String message)
    {
        if (isPause == false && Health.gameoverr == false)
        {
            byte r = (byte)Convert.ToInt32(message.Substring(10, 2), 16);
            byte g = (byte)Convert.ToInt32(message.Substring(12, 2), 16);
            byte b = (byte)Convert.ToInt32(message.Substring(14, 2), 16);
            Sent = new Color32(255, r, g, b);
            input_R = (int)r;
            input_G = (int)g;
            input_B = (int)b;
            
        }
        else
        {
            message = "";
        }
    }
    public void Pause(String stop)
    {
        Time.timeScale = Convert.ToInt32(stop);
        isPause = true;
        Canvas_Pause.enabled = true;
    }
    public void Resume(String start)
    {
        Time.timeScale = Convert.ToInt32(start);
        isPause = false;
        Canvas_Pause.enabled = false;
    }
    public void Shoot(String message2)
    {
        byte s = (byte)Convert.ToInt32(message2);
        
    }
}
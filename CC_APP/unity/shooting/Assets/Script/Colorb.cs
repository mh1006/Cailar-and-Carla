using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Networking;

public class Colorb : NetworkBehaviour
{
    //static public float[] iR = new float[]{ 255 / 255f, 64 / 255f, 0 / 255f, 255 / 255f, 0 / 255f, 0 / 255f, 204 / 255f, 255 / 255f };
    //static public float[] iG = new float[] { 255 / 255f, 130 / 255f, 49 / 255f, 0 / 255f, 0 / 255f, 71 / 255f,119 / 255f, 167 / 255f };
    //static public float[] iB = new float[] { 255 / 255f, 109 / 255f, 83 / 255f, 0 / 255f, 0 / 255f, 171 / 255f, 34 / 255f, 0 / 255f };
    //static public float[] iR = new float[]{ 255 / 255f, 0 / 255f, 77 / 255f, 255 / 255f, 255 / 255f, 0 / 255f, 77 / 255f,};
    //static public float[] iG = new float[] { 26 / 255f, 77 / 255f, 136 / 255f, 133 / 255f, 204 / 255f, 77 / 255f,136 / 255f };
    //static public float[] iB = new float[] { 26 / 255f, 0 / 255f, 255 / 255f, 51 / 255f, 0 / 255f, 0 / 255f, 255/ 255f};
    static public float[] iR = new float[15];
    static public float[] iG = new float[15];
    static public float[] iB = new float[15];
    public Button button;
    
    static public int testr = 0;
    static public int testg = 0;
    static public int testb = 0;
    static public int j=0;
    public int i = 0;
    public int kr = 0;
    public int kg = 0;
    public int kb = 0;

    internal static UnityEngine.Color blue;

    // Start is called before the first frame update
    void Start()
    {
         for ( i = 0; i < 15; i++)
         {
            kr=Random.Range(0, 255);
            iR[i] = (kr / 255f);
            kg = Random.Range(0, 255);
            iG[i] = (kg / 255f);
            kb = Random.Range(0, 255);
            iB[i] = (kb / 255f);
        }
         
        j = 0;
           
         
    }

    // Update is called once per frame
    void Update()
    {
        testr = (int)(iR[j] * 255);
        testg = (int)(iG[j] * 255);
        testb = (int)(iB[j] * 255);

        button.GetComponent<Image>().color = new Color(iR[j], iG[j], iB[j]);
        
    }
   /* public void Click()
    {
        if(i<7)i++;
        j = k[i];
           
    }
    public void colorblock(int amount)
    {
        if (!isServer)
        {
            return;
        }
        button.GetComponent<Image>().color = new Color(iR[j], iG[j], iB[j]);
       
    } */
}

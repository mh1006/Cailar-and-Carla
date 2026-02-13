using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class match : MonoBehaviour
{
    static public int rr;
    static public int gg;
    static public int bb;
    static public bool matchmatch;
    // Start is called before the first frame update
    void Start()
    {
        matchmatch = false;
    }

    // Update is called once per frame
    void Update()
    {
        rr = Math.Abs(colormatch.sr - Colorb.testr);
        gg = Math.Abs(colormatch.sg - Colorb.testg);
        bb = Math.Abs(colormatch.sb - Colorb.testb);
        Debug.Log("rr:" + rr + " gg:" + gg + " bb:" + bb);
        if (rr < 30 && gg < 30 && bb < 30 && Health.gameoverr==false)//shoot
        {
            matchmatch = true;
        }
        else
        {
            matchmatch = false;
        }
      
    }

}

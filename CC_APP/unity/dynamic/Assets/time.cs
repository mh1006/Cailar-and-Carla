using System.Collections;
using System.Collections.Generic;
using UnityEngine;

using UnityEngine.UI;

public class time : MonoBehaviour
{
     public Text ShowTime;
     public int LeftTime;

    void Update()

    {
        LeftTime = 60 - (int)function.time;
        //讓UI文字與分數同步

        ShowTime.text = LeftTime.ToString();
        
        if(LeftTime==0){
            changepage.Page();
        }
    }
}

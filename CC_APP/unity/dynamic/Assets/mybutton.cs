using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class mybutton : MonoBehaviour
{
    public static bool isPause;
    public Canvas Canvas_Pause;
    public Canvas Playing;

   public void Pause(){
        Time.timeScale = 0;
        isPause = true;
        Canvas_Pause.enabled = true;
    }

    public void Resume(){
        Time.timeScale = 1;
        isPause = false;
        Canvas_Pause.enabled = false;
    }

    public void GG()
    { 
       changepage.Page();    
    }

    public void Retry()
    {
        lives.currentHealth=100f;
        SceneManager.LoadScene(0);
    }
}

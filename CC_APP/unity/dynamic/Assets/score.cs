using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class score : MonoBehaviour
{
    public static int Score;
    public Text ShowScore;

        // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

        ShowScore.text = Score.ToString();
    }
    
    
}

    

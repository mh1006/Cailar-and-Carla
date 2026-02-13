using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class gameover : MonoBehaviour
{
    public static GameObject txt;
    public static GameObject txt1;
    // Start is called before the first frame update
    void Start()
    {
        txt = GameObject.Find("youwin");
        txt1 = GameObject.Find("youlose");
        txt.SetActive(false);
        txt1.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        if (Health.gameoverr)
        {
            txt1.SetActive(true);
        }
    }
}

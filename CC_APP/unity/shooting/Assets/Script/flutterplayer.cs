using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class flutterplayer : MonoBehaviour
{
    public GameObject btn;
    public int a;
    
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {

        btn.GetComponentInChildren<Text>().text = "" + unityflutter.input_R;
       // GameObject.Find("buttonName").GetComponentInChildren<Text>().text = ""+ a;
        //text.text = ""+ unityflutter.input_R;
       
    }
    public void Click()
    {
        a++;
    }
}

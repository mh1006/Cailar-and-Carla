using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class enemycolor : MonoBehaviour
{
public Color color;
 
void OnDestroy()
{
GameObject.Destroy(GetComponent<Renderer>().material);
}
 
// Use this for initialization
void Start ()
{
GetComponent<Renderer>().material.color = RandomColor();
}
 
// Update is called once per frame
void Update () {
 
}
Color RandomColor()
    {
//随机颜色的RGB值。即刻得到一个随机的颜色
        float r = Random.Range(0f, 1f);
        float g = Random.Range(0f, 1f);
        float b = Random.Range(0f, 1f);
        Color color = new Color(r,g,b);
        return color;
    }
}


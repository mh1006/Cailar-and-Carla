using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class colormatch : MonoBehaviour
{


    public Slider redSlider;
    public Slider greenSlider;
    public Slider blueSlider;
    private Image r_handle;
    private Image g_handle;
    private Image b_handle;
    private Material hypMaterial;
    static public int sr = 0;
    static public int sg = 0;
    static public int sb = 0;

    // Use this for initialization
    void Start()
    {
        // Here you need to get Cube's components
        hypMaterial = GetComponent<MeshRenderer>().material;
        r_handle = redSlider.handleRect.GetComponent<Image>();
        g_handle = greenSlider.handleRect.GetComponent<Image>();
        b_handle = blueSlider.handleRect.GetComponent<Image>();
        r_handle.color = Color.red;
        g_handle.color = Color.black;
        b_handle.color = Color.black;
       
    }
    // Update is called once per frame
    void Update()
    {
        sr = (int)(redSlider.value * 255);
        sg = (int)(greenSlider.value * 255);
        sb = (int)(blueSlider.value * 255);
        hypMaterial.color = new Color(redSlider.value, greenSlider.value, blueSlider.value);
        //Debug.Log("r:"+sr + " g:" + sg+" b:"+sb);
    }
}
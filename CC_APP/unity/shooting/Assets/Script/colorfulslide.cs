using UnityEngine;
using UnityEngine.UI;

public class colorfulslide : MonoBehaviour
{
    Color[] colors = new Color[]{
      new Color(1, 0, 0),
      new Color(1, 1, 0),
      new Color(0, 1, 0),
      new Color(0, 1, 1),
      new Color(0, 0, 1),
      new Color(1, 0, 1),
      new Color(1, 0, 0)};

    private Slider slider_color;
    private Image img_handle;

    private void Awake()
    {
        slider_color = transform.GetComponent<Slider>();
        slider_color.onValueChanged.AddListener(OnColorSliderValueChanged);
        // handle
        img_handle = slider_color.handleRect.GetComponent<Image>();
        img_handle.color = Color.red;
        // bg
        var hueTex = new Texture2D(colors.Length, 1);
        hueTex.SetPixels(colors);
        hueTex.Apply();
        slider_color.transform.Find("Background").GetComponent<Image>().sprite =
            Sprite.Create(hueTex, new Rect(Vector2.zero, new Vector2(colors.Length, 1)), Vector2.one * 0.5f);
        // fill
        slider_color.fillRect.GetComponent<Image>().enabled = false;
    }
    private void OnColorSliderValueChanged(float _value)
    {
        img_handle.color = Color.HSVToRGB(_value, 1, 1);
    }
}

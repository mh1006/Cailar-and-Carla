using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Target : MonoBehaviour
{
    public bool cankill;
    void Start(){
}

    // Update is called once per frame
    void Update()
    {
        if(Time.timeScale==1){
            gameObject.transform.position += new Vector3(0,-0.005f,0);
            }
        
    }
    void OnTriggerEnter2D(Collider2D col) //名為col的觸發事件
    {
        if (col.tag == "magic" ) 
        {        
            Color32 acolor = col.GetComponent<Renderer>().material.color;
            cankill = Kill(acolor);
            print(cankill);
            if(cankill == true){     
                Destroy(col.gameObject); //消滅碰撞的物件
                Destroy(gameObject); //消滅物件本身
                score.Score+=100;
                function.count--;
            }
        }
    }
    bool Kill(Color32 a){
        Color32 b = gameObject.GetComponent<Renderer>().material.color;
        System.Drawing.Color Acolor = System.Drawing.Color.FromArgb(1,(int) a.r,(int) a.g,(int) a.b);
        float ah = Acolor.GetHue();
        float asa = Acolor.GetSaturation();
        float al = Acolor.GetBrightness();
        System.Drawing.Color Bcolor = System.Drawing.Color.FromArgb(1,(int) b.r,(int) b.g,(int) b.b);
        float bh = Bcolor.GetHue();
        float bs = Bcolor.GetSaturation();
        float bl = Bcolor.GetBrightness();
        float hs = Mathf.Abs(ah - bh);
        if (hs > 180) {
         hs = 360 - hs;
        }
        if (hs > 90) {
         hs = 200;
        }
        float ss = Mathf.Abs(asa - bs);
        float ls = Mathf.Abs(al - bl);
        int score =(int)(100-(hs/2+ss*20+ls*20));
        if(score<85){
            return false;
        }
        else{
            return true;
        }
    }

}

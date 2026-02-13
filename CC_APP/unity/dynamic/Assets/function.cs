using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class function : MonoBehaviour
{
    public GameObject Enemy;
    public float etime;
    public static float time;
    static public int count;
    public static bool gameover;
    static public int lives;
    
    // Start is called before the first frame update
    void Start()
    {
         score.Score = 0;
         Time.timeScale = 1;
         time=0;
         etime=0;
         count=0;
    }

    // Update is called once per frame
    void Update()
    {
        etime += Time.deltaTime; //時間增加
        time += Time.deltaTime; //時間增加
         
        if(etime>2f&&count<3) //如果時間大於3(秒)
        {
            Vector3 pos = new Vector3(Random.Range(-2.25f,2.25f),3.5f,0); //宣告位置pos，Random.Range(-2.5f,2.5f)代表X是2.5到-2.5之間隨機
            Instantiate(Enemy,pos,transform.rotation);//產生敵人
            etime = 0f; //時間歸零
            count++;
        }
    }
}

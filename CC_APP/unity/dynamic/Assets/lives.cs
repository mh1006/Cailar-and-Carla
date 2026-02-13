using System.Collections;

using System.Collections.Generic;

using UnityEngine;


public class lives : MonoBehaviour {

    //血量設定

    public const int maxHealth = 100;

    public static float currentHealth = maxHealth;

    //血量條

    public RectTransform HealthBar;

    void Update()

    {

        HealthBar.sizeDelta = new Vector2(currentHealth, HealthBar.sizeDelta.y);
        if(currentHealth==0){
            changepage.Page();
        }

    }

}
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Networking;

public class Player : NetworkBehaviour
{
    // Start is called before the first frame update
    public GameObject bulletPrefab;
    public Transform bulletSpawn;
    
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (!isLocalPlayer)
        {
            return;
        }
        if (match.matchmatch)
        {
            CmdFire();
            Colorb.j++;
 
        }
        /*if (Input.GetButtonDown("Fire1"))
        {
            CmdFire();
            
        }*/
       
        if (Input.GetKeyDown(("left")))
        {
            CmdFire();
            Colorb.j++;

        }

    }
    [Command]
    public void CmdFire()
    {
        GameObject bullet = (GameObject)Instantiate(bulletPrefab, bulletSpawn.position, bulletSpawn.rotation);
        
        bullet.GetComponent<Rigidbody>().velocity = bullet.transform.right * 6.0f;

        NetworkServer.Spawn(bullet);
       
        Destroy(bullet, 1.5f);
       
    }
    public override void OnStartLocalPlayer()
    {
        GetComponent<MeshRenderer>().material.color = Color.blue;
    }
   
}

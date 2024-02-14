using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Item : MonoBehaviour
{
    public int ID = 0;

    public void OnPickup()
    {
        Debug.Log("You got an item");
        Inventory.SaveItem(this);
        LevelManager.SendToPool(this.gameObject);
        gameObject.SetActive(false);
    }
}
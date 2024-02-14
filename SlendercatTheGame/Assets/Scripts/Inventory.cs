using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Inventory : MonoBehaviour
{
    private static List<Item> inventory;

    private void Start()
    {
        inventory = new List<Item>();
    }

    public static void SaveItem(Item item)
    {
        inventory.Add(item);
        Debug.Log("Saving item");
    }

    public static bool HasKey(int index)
    {
        foreach (var item in inventory)
        {
            Item items = item as Item;
            if (items != null)
            {
                if (items.ID == index)
                    return true;
            }
        }
        return false;
    }
}

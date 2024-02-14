using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Picker : MonoBehaviour
{
    private void OnTriggerEnter(Collider other)
    {
        var item = other.GetComponent<Item>();

        if (item == null) return;

        item.OnPickup();
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Script con referencia a tutorial de youtube https://www.youtube.com/watch?v=LYNIO91dPdA

public class CameraController : MonoBehaviour
{
    private new Transform camera; 
    public Vector2 sens;

    // Start is called before the first frame update
    void Start()
    {
        camera = transform.Find("Camera");
        Cursor.lockState = CursorLockMode.Locked;
    }

    // Update is called once per frame
    void Update()
    {
        //rotar horizontal
        float rotH = Input.GetAxis("Mouse X"); 
        float rotV = Input.GetAxis("Mouse Y");
        if (rotH != 0)
        {
            transform.Rotate(Vector3.up * rotH * sens.x);
        }
        //rotar vertical
        if (rotV != 0)
        {
            float angle = (camera.localEulerAngles.x + rotV * sens.y + 360) % 360;
            if(angle > 180) 
            { 
                angle -= 360; 
            }
            angle = Mathf.Clamp(angle, -80, 80);
            camera.localEulerAngles = Vector3.right * angle;
        }
    }
}

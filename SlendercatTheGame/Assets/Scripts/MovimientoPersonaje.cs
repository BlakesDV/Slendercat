using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//Script basado en el proyecto trabajado en clase de Programación IV(?

public class MovimientoPersonaje : MonoBehaviour
{
    public float vel = 5.0f;

    // Update is called once per frame
    void Update()
    {
        // Obtener la entrada del teclado para el movimiento
        float movH = Input.GetAxis("Horizontal");
        float movV = Input.GetAxis("Vertical");

        // Calcular el vector de movimiento
        Vector3 movimiento = new Vector3(movH, 0.0f, movV) * vel * Time.deltaTime;

        // Aplicar el movimiento al personaje
        transform.Translate(movimiento);
    }
}

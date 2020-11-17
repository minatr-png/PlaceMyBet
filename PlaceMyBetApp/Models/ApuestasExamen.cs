using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PlaceMyBetApp.Models
{
    /***Ejercicio 1***/
    public class ApuestasExamen
    {
        public ApuestasExamen(string equipoRival, float cantidad)
        {
            this.equipoRival = equipoRival;
            this.cantidad    = cantidad;
        }

        public ApuestasExamen(string equipoRival)
        {
            this.equipoRival = equipoRival;
        }

        public string equipoRival { get; set; }
        public float  cantidad { get; set; }
    }
    /***Final Ejercicio 1(solo de la clase hay más en controller y en repository)***/
}
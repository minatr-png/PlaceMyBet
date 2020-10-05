using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AE2.Models
{
    public class Apuestas
    {
        public Apuestas(int idApuesta, int mercadoApu, string tipo, float cuota, float dinero, DateTime fecha, string emailUsu)
        {
            this.idApuesta  = idApuesta;
            this.mercadoApu = mercadoApu;
            this.tipo       = tipo;
            this.cuota      = cuota;
            this.dinero     = dinero;
            this.fecha      = fecha;
            this.emailUsu   = emailUsu;
        }

        public int      idApuesta  { get; set; }
        public int      mercadoApu { get; set; }
        public string   tipo       { get; set; }
        public float    cuota      { get; set; }
        public float    dinero     { get; set; }
        public DateTime fecha      { get; set; }
        public string   emailUsu   { get; set; }
    }
}
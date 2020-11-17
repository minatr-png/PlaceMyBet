using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AE2.Models
{
    public class Eventos
    {
        public Eventos(int idEvento, string nomLocal, string nomVisitante, DateTime fecha)
        {
            this.idEvento     = idEvento;
            this.nomLocal     = nomLocal;
            this.nomVisitante = nomVisitante;
            this.fecha        = fecha;
        }

        public int      idEvento     { get; set; }
        public string   nomLocal     { get; set; }
        public string   nomVisitante { get; set; }
        public DateTime fecha        { get; set; }
    }

    public class EventosDTO
    {
        public EventosDTO(string nomLocal, string nomVisitante, DateTime fecha)
        {
            this.nomLocal     = nomLocal;
            this.nomVisitante = nomVisitante;
            this.fecha        = fecha;
        }

        public string nomLocal     { get; set; }
        public string nomVisitante { get; set; }
        public DateTime fecha      { get; set; }
    }

    /***Ejercicio 2***/
    public class EventosExamen
    {
        public EventosExamen(string local, string visitante, float mercado)
        {
            this.local     = local;
            this.visitante = visitante;
            this.mercado   = mercado;
        }

        public string  local    { get; set; }
        public string visitante { get; set; }
        public float  mercado   { get; set; }
    }
    /***Final Ejercicio 2(solo de la clase hay más en repository y en controller)***/
}
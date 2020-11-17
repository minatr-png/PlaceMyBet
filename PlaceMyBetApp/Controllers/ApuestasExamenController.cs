using PlaceMyBetApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace PlaceMyBetApp.Controllers
{
    /***Ejercicio 1***/
    public class ApuestasExamenController : ApiController
    {
        // GET: api/ApuestasExamen
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET: api/ApuestasExamen?equipo=value1
        public IEnumerable<ApuestasExamen> Get(string equipo)
        {
            var repo = new ApuestasExamenRepository();
            List<ApuestasExamen> apus = repo.Retrieve(equipo);

            if (apus.Count == 0) apus.Add(new ApuestasExamen("No existe ninguna apuesta"));
            return apus;
        }

        // POST: api/ApuestasExamen
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/ApuestasExamen/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/ApuestasExamen/5
        public void Delete(int id)
        {
        }
    }
    /***Final Ejercicio 1(solo del controller hay más en repository y en la clase)***/
}

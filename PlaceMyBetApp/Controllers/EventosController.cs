using AE2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace AE2.Controllers
{
    public class EventosController : ApiController
    {
        // GET: api/Eventos
        public IEnumerable<EventosDTO> Get()
        {
            var repo = new EventosRepository();

            List<EventosDTO> eves = repo.RetrieveDTO();

            return eves;
        }

        // GET: api/Eventos/5
        public Eventos Get(int id)
        {
            /*var repo = new EventosRepository();

            Eventos eve = repo.Retrieve();*/

            return null;
        }

        /***Ejercicio 2***/
        // POST: api/Eventos
        public void Post([FromBody]EventosExamen evento)
        {
            var repo = new EventosRepository();
            repo.Save(evento);
        }
        /***Final Ejercicio 1(solo del controller hay más en repository y en la clase)***/

        // PUT: api/Eventos/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Eventos/5
        public void Delete(int id)
        {
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ZooAzureApp.Controllers
{
    public class TiposController : ApiController
    {
        // GET: api/Tipos
        public RespuestaApi Get()
        {
            RespuestaApi resultado = new RespuestaApi();
            List<TiposAnimal> listaAnimales = new List<TiposAnimal>();
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    listaAnimales = Db.GetTiposAnimales();
                }
                resultado.error = "";
                Db.Desconectar();
            }
            catch
            {
                resultado.error = "Se produjo un error";
            }

            resultado.totalElementos = listaAnimales.Count;
            resultado.dataAnimal = listaAnimales;
            return resultado;
        }

        // GET: api/Tipos/5
        public RespuestaApi Get(long id)
        {
            RespuestaApi resultado = new RespuestaApi();
            List<TiposAnimal> listaAnimales = new List<TiposAnimal>();
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    listaAnimales = Db.GetTiposAnimalesPorId(id);
                }
                resultado.error = "";
                Db.Desconectar();
            }
            catch
            {
                resultado.error = "Se produjo un error";
            }

            resultado.totalElementos = listaAnimales.Count;
            resultado.dataAnimal = listaAnimales;
            return resultado;
        }

        // POST: api/Tipos
        // Agrego decorador
        [HttpPost]
        public IHttpActionResult Post([FromBody]TiposAnimal claseDeAnimal)
        {
            RespuestaApi resultado = new RespuestaApi();
            resultado.error = "";
            int filasAfectadas = 0;
            try
            {
                Db.Conectar();
                if (Db.EstaLaConexionAbierta())
                {
                    filasAfectadas = Db.AgregarTiposAnimales(claseDeAnimal);
                }
                resultado.totalElementos = filasAfectadas;
                Db.Desconectar();
            }
            catch (Exception)
            {
                resultado.totalElementos = 0;
                resultado.error = "Se produjo un error";
            }
            return Ok(resultado);
        }

        // PUT: api/Tipos/5
        [HttpPut]
        public IHttpActionResult Put(int id, [FromBody]TiposAnimal claseDeAnimal)
        {
            RespuestaApi resultado = new RespuestaApi();
            resultado.error = "";
            int filasAfectadas = 0;
            try
            {
                Db.Conectar();
                if (Db.EstaLaConexionAbierta())
                {
                    filasAfectadas = Db.ActualizarTiposAnimales(id, claseDeAnimal);
                }
                resultado.totalElementos = filasAfectadas;
                Db.Desconectar();
            }
            catch (Exception)
            {
                resultado.totalElementos = 0;
                resultado.error = "Error al actualizar el TipoAnimal";
            }
            return Ok(resultado);
        }

        // DELETE: api/Tipos/5
        [HttpDelete]
        public IHttpActionResult Delete(int id)
        {
            RespuestaApi resultado = new RespuestaApi();
            resultado.error = "";
            int filasAfectadas = 0;
            try
            {
                Db.Conectar();
                if (Db.EstaLaConexionAbierta())
                {
                    filasAfectadas = Db.EliminarTipoAnimal(id);
                }
                resultado.totalElementos = filasAfectadas;
                Db.Desconectar();
            }
            catch (Exception)
            {
                resultado.totalElementos = 0;
                resultado.error = "Error al eliminar el Tipo de Animal";
            }
            return Ok(resultado);
        }
    }
}

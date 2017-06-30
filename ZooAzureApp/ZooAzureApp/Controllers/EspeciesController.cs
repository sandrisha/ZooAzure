using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ZooAzureApp.Controllers
{
    public class EspecieController : ApiController
    {
        // GET: api/Especie
        public RespuestaApi Get()
        {
            RespuestaApi resultado = new RespuestaApi();
            List<Especie> listaEspecie = new List<Especie>();
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    listaEspecie = Db.GetEspecies();
                }
                resultado.error = "";
                Db.Desconectar();
            }
            catch
            {
                resultado.error = "Se produjo un error";
            }

            resultado.totalElementos = listaEspecie.Count;
            resultado.dataEspecie = listaEspecie;
            return resultado;
        }

        // GET: api/Especie/5
        public RespuestaApi Get(long id)
        {
            RespuestaApi resultado = new RespuestaApi();
            List<Especie> listaEspecie = new List<Especie>();
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    listaEspecie = Db.GetEspeciesPorId(id);
                }
                resultado.error = "";
                Db.Desconectar();
            }
            catch
            {
                resultado.error = "Se produjo un error";
            }

            resultado.totalElementos = listaEspecie.Count;
            resultado.dataEspecie = listaEspecie;
            return resultado;
        }

        // POST: api/Especie
        [HttpPost]
        public IHttpActionResult Post([FromBody]Especie especie)
        {
            RespuestaApi resultado = new RespuestaApi();
            resultado.error = "";
            int filasAfectadas = 0;
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    filasAfectadas = Db.AgregarEspecie(especie);
                }
                resultado.totalElementos = filasAfectadas;
                Db.Desconectar();
            }
            catch (Exception)
            {
                resultado.totalElementos = 0;
                resultado.error = "Error al agregar la Especie";
            }

            return Ok(resultado);

        }

        // PUT: api/Especie/5
        [HttpPut]
        public IHttpActionResult Put(int id, [FromBody]Especie especie)
        {
            RespuestaApi resultado = new RespuestaApi();
            resultado.error = "";
            int filasAfectadas = 0;
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    filasAfectadas = Db.ActualizarEspecie(id, especie);
                }
                resultado.totalElementos = filasAfectadas;
                Db.Desconectar();
            }
            catch (Exception)
            {
                resultado.totalElementos = 0;
                resultado.error = "Error al actualizar la Especie";
            }

            return Ok(resultado);

        }

        // DELETE: api/Especie/5
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
                    filasAfectadas = Db.EliminarEspecie(id);
                }
                resultado.totalElementos = filasAfectadas;
                Db.Desconectar();
            }
            catch (Exception)
            {
                resultado.totalElementos = 0;
                resultado.error = "Error al eliminar la Especie";
            }

            return Ok(resultado);

        }
    }
}

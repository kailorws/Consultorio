using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Interfaces;
using DATA;
using ServiceStack.OrmLite;
using System.Data;


namespace DAL.Metodos
{
    public class MCita : MBase, ICita
    {
        public void ActualizarCita(Cita cita)
        {
            _db = _conexion.Open();
            _db.Update(cita);
            _db.Close();
        }

        public Cita BuscarCita(int id)
        {
            _db = _conexion.Open();
            Cita cita = _db.Select<Cita>(x => x.IdCita == id).FirstOrDefault();
            _db.Close();
            return cita;
        }

        public void EliminarCita(int id)
        {
            _db = _conexion.Open();
            _db.Delete<Cita>(x => x.IdCita == id);
            _db.Close();
        }

        public void InsertarCita(Cita cita)
        {
            _db = _conexion.Open();
            _db.Insert(cita);
            _db.Close();
        }

        public List<Cita> ListarCita()
        {
            _db = _conexion.Open();
            List<Cita> lista = _db.Select<Cita>();
            _db.Close();
            return lista;
        }       
    }
}

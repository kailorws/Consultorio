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
    public class MPaciente : MBase, IPaciente
    {
        public void ActualizarPaciente(Paciente paciente)
        {
            _db = _conexion.Open();
            _db.Update(paciente);
            _db.Close();
        }

        public Paciente BuscarPaciente(int id)
        {
            _db = _conexion.Open();
            Paciente paciente = _db.Select<Paciente>(x => x.IdPaciente == id).FirstOrDefault();
            _db.Close();
            return paciente;
        }

        public void EliminarPaciente(int id)
        {
            _db = _conexion.Open();
            _db.Delete<Paciente>(x => x.IdPaciente == id);
            _db.Close();
        }

        public void InsertarPaciente(Paciente paciente)
        {
            _db = _conexion.Open();
            _db.Insert(paciente);
            _db.Close();
        }

        public List<Paciente> ListarPacientes()
        {
            _db = _conexion.Open();
            List<Paciente> lista = _db.Select<Paciente>();
            _db.Close();
            return lista;
        }
    }
}

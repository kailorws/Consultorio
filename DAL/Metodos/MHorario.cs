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
    public class MHorario : MBase, IHorario
    {
        public void ActualizarHorario(Horario horario)
        {
            _db = _conexion.Open();
            _db.Update(horario);
            _db.Close();
        }

        public Horario BuscarHorario(int id)
        {
            _db = _conexion.Open();
            Horario horario = _db.Select<Horario>(x => x.IdHorario == id).FirstOrDefault();
            _db.Close();
            return horario;
        }

        public void EliminarHorario(int id)
        {
            _db = _conexion.Open();
            _db.Delete<Horario>(x => x.IdHorario == id);
            _db.Close();
        }

        public void InsertarHorario(Horario horario)
        {
            _db = _conexion.Open();
            _db.Insert(horario);
            _db.Close();
        }

        public List<Horario> ListarHorarios()
        {
            _db = _conexion.Open();
            List<Horario> lista = _db.Select<Horario>();
            _db.Close();
            return lista;
        }
    }
}

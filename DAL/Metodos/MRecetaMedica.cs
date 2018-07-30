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
    public class MRecetaMedica : MBase, IRecetaMedica
    {
        public void ActualizarRecetaMedica(RecetaMedica recetaMedica)
        {
            _db = _conexion.Open();
            _db.Update(recetaMedica);
            _db.Close();
        }

        public RecetaMedica BuscarRecetaMedica(int idR, int idM)
        {
            _db = _conexion.Open();
            RecetaMedica recetaMedica = _db.Select<RecetaMedica>(x => x.IdReceta == idR && x.IdMedicamento == idM).FirstOrDefault();
            _db.Close();
            return recetaMedica;
        }

        public void EliminarRecetaMedica(int idR, int idM)
        {
            _db = _conexion.Open();
            _db.Delete<RecetaMedica>(x => x.IdReceta == idR && x.IdMedicamento == idM);
            _db.Close();
        }

        public void InsertarRecetaMedica(RecetaMedica recetaMedica)
        {
            _db = _conexion.Open();
            _db.Insert(recetaMedica);
            _db.Close();
        }

        public List<RecetaMedica> ListarRecetaMedica()
        {
            _db = _conexion.Open();
            List<RecetaMedica> lista = _db.Select<RecetaMedica>();
            _db.Close();
            return lista;
        }
    }
}

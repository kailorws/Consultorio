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
    public class MDatosMedicos : MBase, IDatosMedicos
    {
        public void ActualizarDatosMedicos(DatosMedicos datosMedicos)
        {
            _db = _conexion.Open();
            _db.Update(datosMedicos);
            _db.Close();
        }

        public DatosMedicos BuscarDatosMedicos(int id)
        {
            _db = _conexion.Open();
            DatosMedicos datosMedicos = _db.Select<DatosMedicos>(x => x.Id_DM == id).FirstOrDefault();
            _db.Close();
            return datosMedicos;
        }

        public void EliminarDatosMedicos(int id)
        {
            _db = _conexion.Open();
            _db.Delete<DatosMedicos>(x => x.Id_DM == id);
            _db.Close();
        }

        public void InsertarDatosMedicos(DatosMedicos datosMedicos)
        {
            _db = _conexion.Open();
            _db.Insert(datosMedicos);
            _db.Close();
        }

        public List<DatosMedicos> ListarDireccion()
        {
            _db = _conexion.Open();
            List<DatosMedicos> lista = _db.Select<DatosMedicos>();
            _db.Close();
            return lista;
        }
    }
}

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
    public class MMedicamento : MBase, IMedicamento
    {
        public void ActualizarMedicamento(Medicamento medicamento)
        {
            _db = _conexion.Open();
            _db.Update(medicamento);
            _db.Close();
        }

        public Medicamento BuscarMedicamento(int id)
        {
            _db = _conexion.Open();
            Medicamento medicamento = _db.Select<Medicamento>(x => x.IdMedicamento == id).FirstOrDefault();
            _db.Close();
            return medicamento;
        }

        public void EliminarMedicamento(int id)
        {
            _db = _conexion.Open();
            _db.Delete<Medicamento>(x => x.IdMedicamento == id);
            _db.Close();
        }

        public void InsertarMedicamento(Medicamento medicamento)
        {
            _db = _conexion.Open();
            _db.Insert(medicamento);
            _db.Close();
        }

        public List<Medicamento> ListarMedicamento()
        {
            _db = _conexion.Open();
            List<Medicamento> lista = _db.Select<Medicamento>();
            _db.Close();
            return lista;
        }
    }
}

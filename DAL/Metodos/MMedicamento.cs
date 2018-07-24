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
            _db.Update(medicamento);
        }

        public Medicamento BuscarMedicamento(int Id)
        {
            return _db.Select<Medicamento>(x => x.Id == Id).FirstOrDefault();
        }

        public void EliminarMedicamento(int Id)
        {
            _db.Delete<Medicamento>(x => x.Id == Id);
        }

        public void InsertarMedicamento(Medicamento medicamento)
        {
            _db.Insert(medicamento);
        }

        public List<Medicamento> ListarMedicamentos()
        {
            return _db.Select<Medicamento>();
        }
    }
}

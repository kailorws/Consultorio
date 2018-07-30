using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Consultorio.BLL.Interfaces;
using DATA;

namespace Consultorio.BLL.Metodos
{
    public class MMedicamento : MBase, IMedicamento
    {
        public void ActualizarMedicamento(Medicamento medicamento)
        {
            mMedicamento.ActualizarMedicamento(medicamento);
        }

        public Medicamento BuscarMedicamento(int id)
        {
            return mMedicamento.BuscarMedicamento(id);
        }

        public void EliminarMedicamento(int id)
        {
            mMedicamento.EliminarMedicamento(id);
        }

        public void InsertarMedicamento(Medicamento medicamento)
        {
            mMedicamento.InsertarMedicamento(medicamento);
        }

        public List<Medicamento> ListarMedicamento()
        {
            return mMedicamento.ListarMedicamento();
        }
    }
}

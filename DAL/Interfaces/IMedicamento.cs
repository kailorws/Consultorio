using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATA;
namespace DAL.Interfaces
{
    public interface IMedicamento
    {
        List<Medicamento> ListarMedicamentos();

        Medicamento BuscarMedicamento(int Id);

        void InsertarMedicamento(Medicamento medicamento);

        void ActualizarMedicamento(Medicamento medicamento);

        void EliminarMedicamento(int Id);
    }
}

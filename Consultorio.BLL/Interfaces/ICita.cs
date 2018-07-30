using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATA;

namespace Consultorio.BLL.Interfaces
{
    public interface ICita
    {
        List<Cita> ListarCita();
        Cita BuscarCita(int id);
        void InsertarCita(Cita cita);
        void ActualizarCita(Cita cita);
        void EliminarCita(int id);
    }
}

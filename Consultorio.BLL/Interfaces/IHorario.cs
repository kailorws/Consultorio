using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATA;

namespace Consultorio.BLL.Interfaces
{
    public interface IHorario
    {
        List<Horario> ListarHorarios();
        Horario BuscarHorario(int id);
        void InsertarHorario(Horario horario);
        void ActualizarHorario(Horario horario);
        void EliminarHorario(int id);
    }
}

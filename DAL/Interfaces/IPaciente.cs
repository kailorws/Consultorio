using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATA;

namespace DAL.Interfaces
{
    public interface IPaciente
    {
        List<Paciente> ListarPacientes();

        Paciente BuscarPaciente(int id);

        void InsertarPaciente(Paciente paciente);

        void ActualizarPaciente(Paciente paciente);

        void EliminarPaciente(int id);

    }
}

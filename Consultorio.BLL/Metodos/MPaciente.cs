using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Consultorio.BLL.Interfaces;
using DATA;

namespace Consultorio.BLL.Metodos
{
    public class MPaciente : MBase, IPaciente
    {
        public void ActualizarPaciente(Paciente paciente)
        {
            mPaciente.ActualizarPaciente(paciente);
        }

        public Paciente BuscarPaciente(int id)
        {
            return mPaciente.BuscarPaciente(id);
        }

        public void EliminarPaciente(int id)
        {
            mPaciente.EliminarPaciente(id);
        }

        public void InsertarPaciente(Paciente paciente)
        {
            mPaciente.InsertarPaciente(paciente);
        }

        public List<Paciente> ListarPacientes()
        {
            return mPaciente.ListarPacientes();
        }
    }
}

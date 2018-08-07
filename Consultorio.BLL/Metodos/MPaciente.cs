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

        public void ActualizarPaciente(Paciente paciente, Datos_Medicos datosMedicos, Direccion datosContacto)
        {
            mPaciente.ActualizarPaciente(paciente, datosMedicos, datosContacto);
        }

        public Direccion buscarContactoPaciente(int cedulaPaciente)
        {
            return mPaciente.buscarContactoPaciente(cedulaPaciente);
                    }

        public Datos_Medicos buscarDatosMedicosPaciente(int cedulaPaciente)
        {
            return mPaciente.buscarDatosMedicosPaciente(cedulaPaciente);
        }

        public Paciente BuscarPaciente(int id)
        {
            return mPaciente.BuscarPaciente(id);
        }

        public void EliminarPaciente(int id)
        {
            mPaciente.EliminarPaciente(id);
        }

        public void InsertarPaciente(Paciente paciente, Datos_Medicos datosMedicos, Direccion datosContacto)
        {
            mPaciente.InsertarPaciente(paciente, datosMedicos, datosContacto);
        }

        public List<Paciente> ListarPacientes()
        {
            return mPaciente.ListarPacientes();
        }
    }
}

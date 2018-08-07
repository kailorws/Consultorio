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
        
        Datos_Medicos buscarDatosMedicosPaciente(int cedulaPaciente);

        Direccion buscarContactoPaciente(int cedulaPaciente);

        void InsertarPaciente(Paciente paciente,Datos_Medicos datosMedicos,Direccion datosContacto);

        void ActualizarPaciente(Paciente paciente, Datos_Medicos datosMedicos, Direccion datosContacto);

        void EliminarPaciente(int id);


    }
}

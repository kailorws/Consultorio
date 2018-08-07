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
    public class MPaciente : MBase, IPaciente
    {
       
        public void ActualizarPaciente(Paciente paciente, Datos_Medicos datosMedicos, Direccion datosContacto)
        {
            _db = _conexion.Open();
            _db.Update(paciente);
            _db.Update(datosMedicos);
            _db.Update(datosContacto);
            _db.Close();
        }

        public Direccion buscarContactoPaciente(int cedulaPaciente)
        {
            _db = _conexion.Open();
            Direccion direccion = _db.Select<Direccion>(x => x.Cedula == cedulaPaciente).FirstOrDefault();
            _db.Close();
            return direccion;
        }

        public Datos_Medicos buscarDatosMedicosPaciente(int cedulaPaciente)
        {
            _db = _conexion.Open();
            Datos_Medicos datos_Medicos = _db.Select<Datos_Medicos>(x => x.Cedula == cedulaPaciente).FirstOrDefault();
            _db.Close();
            return datos_Medicos;
        }

        public Paciente BuscarPaciente(int id)
        {
            _db = _conexion.Open();
            Paciente paciente = _db.Select<Paciente>(x => x.IdPaciente == id).FirstOrDefault();
            _db.Close();
            return paciente;
        }

        public void EliminarPaciente(int id)
        {
            _db = _conexion.Open();
            _db.Delete<Datos_Medicos>(x => x.Cedula == id);
            _db.Delete<Direccion>(x => x.Cedula == id);
            _db.Delete<Paciente>(x => x.IdPaciente == id);
            _db.Close();
        }
        
        public void InsertarPaciente(Paciente paciente, Datos_Medicos datosMedicos, Direccion datosContacto)
        {
            _db = _conexion.Open();
            _db.Insert(paciente);
            _db.Insert(datosContacto);
            _db.Insert(datosMedicos);
            _db.Close();
        }

        public List<Paciente> ListarPacientes()
        {
            _db = _conexion.Open();
            List<Paciente> lista = _db.Select<Paciente>();
            _db.Close();
            return lista;
        }
    }
}

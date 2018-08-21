using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Consultorio.BLL;
using Consultorio.BLL.Metodos;
using Consultorio.Models;
using DATA;
using Newtonsoft.Json;

namespace Consultorio
{
    public partial class Principal : System.Web.UI.Page
    {
        private String variableServidor;

        public string VariableServidor { get => variableServidor; set => variableServidor = value; }

        protected void Page_Load(object sender, EventArgs e)
        {
            MCita mCita = new MCita();
            MHorario mHorario = new MHorario();
            MPaciente mPaciente = new MPaciente();
            List<Cita> citas = mCita.ListarCita();
            List<Horario> horarios = mHorario.ListarHorarios();
            List<Paciente> pacientes = mPaciente.ListarPacientes();
            List<Calendario> calendarios = new List<Calendario>();
            citas.ForEach(c => {
                String nombre = string.Empty;
                TimeSpan time = TimeSpan.MinValue;
                pacientes.ForEach(p => { if (p.IdPaciente == c.IdPaciente) nombre = p.Nombre; });
                horarios.ForEach(p => { if (p.IdHorario == c.IdHorario) time = p.Hora; });
                calendarios.Add(new Calendario(time, c.Fecha, nombre, c.Descripcion));
            });
            VariableServidor = JsonConvert.SerializeObject(calendarios);
        }
    }
}
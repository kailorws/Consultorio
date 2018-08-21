using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Consultorio.BLL.Interfaces;
using Consultorio.BLL.Metodos;
using DATA;

namespace Consultorio
{
    public partial class AgregarCita : System.Web.UI.Page
    {
        public IHorario hor;
        public ICita cit;
        public AgregarCita()
        {
            cit = new MCita();
            hor = new MHorario();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<Horario> listaHorarios = hor.ListarHorarios();
                List<String> listaFiltrada = new List<string>();
                     foreach (var item in listaHorarios)
                     {
                         if (ModelState.IsValid)
                         {
                        listaFiltrada.Add(Convert.ToString(item.Hora));
                    }
                    ddlHorario.DataSource = listaFiltrada;
                    ddlHorario.DataBind();
                     }
               
            }
            }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MantenimientoPaciente.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string horaSelec = ddlHorario.SelectedItem.Text;
                Int32 idHora = Convert.ToInt32(hor.BuscarIdHorario(horaSelec));

                Cita c = new Cita
                {
                    IdHorario = idHora,
                    IdUsuario = Convert.ToInt32(Session["Id"]),
                    IdPaciente = Convert.ToInt32(txtCedula.Text),
                    Descripcion = txtDescripción.Text,
                    Fecha = CFecha.SelectedDate
                };
                cit.InsertarCita(c);
                Response.Redirect("Principal.aspx");
            }catch(SqlException ee)
            {
                mensaje.Visible = false;
                mensajeError.Visible = true;
                textoMensajeError.InnerHtml = "Debe ingresar la cédula de un paciente registrado";
            }
            
        }
    }
}
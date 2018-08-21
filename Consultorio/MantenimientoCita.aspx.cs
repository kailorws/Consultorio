using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Consultorio.BLL.Interfaces;
using Consultorio.BLL.Metodos;
using DATA;
namespace Consultorio
{
    
    public partial class MantenimientoCita : System.Web.UI.Page
    {
        ICita cit;
        IHorario hor;
        public MantenimientoCita()
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

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                var cita = cit.BuscarCita(Convert.ToInt32(txtIdCita.Text));
                var horario = cita.IdHorario;
                var hora = hor.BuscarHorario(horario);
                if (cita != null)
                {
                    txtIdCita.Enabled = false;
                    ddlHorario.SelectedValue = Convert.ToString(hora.Hora);
                    txtDescripcion.Text = cita.Descripcion;
                    CFecha.SelectedDate = cita.Fecha;
                    formMantenimiento.Visible = true;
                    txtIdCita.ReadOnly = true;
                    mensaje.Visible = false;
                    mensajeError.Visible = false;
                }
                else
                {
                    txtIdCita.Text = string.Empty;
                    txtIdCita.Focus();
                    mensaje.Visible = false;
                    mensajeError.Visible = true;
                    textoMensajeError.InnerHtml = "El id digitado no existe";
                }
            }
            catch (Exception)
            {
                mensaje.Visible = false;
                mensajeError.Visible = true;
                textoMensajeError.InnerHtml = "Ocurrió un error";
                txtIdCita.Text = string.Empty;
                txtIdCita.Focus();

            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            try
            {
                string horaSelec = ddlHorario.SelectedItem.Text;
                Int32 idHora = Convert.ToInt32(hor.BuscarIdHorario(horaSelec));
                var cita = cit.BuscarCita(Convert.ToInt32(txtIdCita.Text));
                Cita c = new Cita
                {
                    IdCita = cita.IdCita,
                    IdHorario = idHora,
                    IdUsuario = Convert.ToInt32(Session["Id"]),
                    IdPaciente = cita.IdPaciente,
                    Descripcion = txtDescripcion.Text,
                    Fecha = CFecha.SelectedDate
                };
                cit.ActualizarCita(c);
                formMantenimiento.Visible = false;
                txtIdCita.ReadOnly = false;
                txtIdCita.Text = string.Empty;
                mensaje.Visible = true;
                textoMensaje.InnerHtml = "Se guardaron los cambiós correctamente";
                txtIdCita.Enabled = true;
            }
            catch (Exception)
            {
                mensaje.Visible = false;
                mensajeError.Visible = true;
                textoMensajeError.InnerHtml = "Hubo un error al modificar la cita. Intente de nuevo";
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                cit.EliminarCita(Convert.ToInt32(txtIdCita.Text));
                formMantenimiento.Visible = false;
                txtIdCita.ReadOnly = false;
                txtIdCita.Text = string.Empty;
                mensaje.Visible = true;
                textoMensaje.InnerHtml = "Se eliminó la cita.";
                txtIdCita.Enabled = true;
            }
            catch (Exception)
            {
                mensaje.Visible = false;
                mensajeError.Visible = true;
                textoMensajeError.InnerHtml = "Error al eliminar la cita";
            }
        }
    }
}
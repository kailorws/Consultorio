using Consultorio.BLL.Interfaces;
using Consultorio.BLL.Metodos;
using DATA;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Consultorio
{
    public partial class DetallesPaciente : System.Web.UI.Page
    {
        static int cedula;
        public IPaciente pac;
        public DetallesPaciente()
        {
            pac = new MPaciente();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                List<string> estado = new List<string>(){
                    "Soltero/a",
                    "Comprometido/a",
                    "Casado/a",
                    "Divorciado/a",
                    "Viudo/a"
                 };
                List<string> sangre = new List<string>(){
                    "O-",
                    "O+",
                    "A-",
                    "A+",
                    "B-",
                    "B+",
                    "AB-",
                    "AB+"
                 };
                ddlTipoSangre.DataSource = sangre;
                ddlTipoSangre.DataBind();
                ddlEstadoCivil.DataSource = estado;
                ddlEstadoCivil.DataBind();
                cedula = Convert.ToInt32(Request.QueryString["Cedula"].ToString());
                Paciente paciente = pac.BuscarPaciente(cedula);
                Datos_Medicos datos_Medicos = pac.buscarDatosMedicosPaciente(cedula);
                Direccion direccion = pac.buscarContactoPaciente(cedula);

                txtNombre.Text = paciente.Nombre;
                txtApellido1.Text = paciente.Apellido1;
                txtApellido2.Text = paciente.Apellido2;
                txtSexo.Text = paciente.Sexo;
                txtFechaNacimiento.Text = paciente.FechaNacimiento.ToShortDateString();
                txtLugarNacimiento.Text = paciente.LugarNacimiento;
                ddlEstadoCivil.SelectedValue = paciente.EstadoCivil;
                txtOcupacion.Text = paciente.Ocupacion;
                txtCiudad.Text = direccion.Ciudad;
                txtProvincia.Text = direccion.Provincia;
                txtDireccion.Text = direccion.DireccionExacta;
                txtTelefono.Text = direccion.Telefono;
                txtCorreo.Text = direccion.Correo;
                ddlTipoSangre.SelectedValue = datos_Medicos.Tipo_Sangre;
                cbxAlergia.Checked = datos_Medicos.Alergia;
                txtTipoAlergia.Text = datos_Medicos.Tipo_Alergia;
            }
          

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MantenimientoPaciente.aspx");
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Datos_Medicos dm = new Datos_Medicos
            {
                Alergia = cbxAlergia.Checked,
                Cedula = cedula,
                Tipo_Alergia = txtTipoAlergia.Text,
                Tipo_Sangre = ddlTipoSangre.SelectedValue
            };
            Direccion d = new Direccion
            {
                DireccionExacta=txtDireccion.Text,
                Cedula = cedula,
                Ciudad = txtCiudad.Text,
                Provincia = txtProvincia.Text,
                Telefono = txtTelefono.Text,
                Correo = txtCorreo.Text
            };
            Paciente p = new Paciente
            {
                Nombre = txtNombre.Text,
                Apellido1 = txtApellido1.Text,
                Apellido2 = txtApellido2.Text,
                EstadoCivil = ddlEstadoCivil.SelectedValue,
                FechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text),
                IdPaciente = cedula,
                LugarNacimiento = txtLugarNacimiento.Text,
                Ocupacion = txtOcupacion.Text,
                Sexo = txtSexo.Text
            };
            pac.ActualizarPaciente(p, dm, d);
            Response.Redirect("MantenimientoPaciente.aspx");
        }

        protected void btnEliminarPaciente_Click(object sender, EventArgs e)
        {
            pac.EliminarPaciente(cedula);
            Response.Redirect("MantenimientoPaciente.aspx");
        }
    }
}
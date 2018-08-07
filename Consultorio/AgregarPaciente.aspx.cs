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
    public partial class AgregarPaciente : System.Web.UI.Page
    {
      
        public IPaciente pac;
        public AgregarPaciente()
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
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Datos_Medicos dm = new Datos_Medicos
            { 
                Alergia = cbxAlergia.Checked,
                Cedula = Convert.ToInt32(txtCedula.Text),
                Tipo_Alergia = txtTipoAlergia.Text,
                Tipo_Sangre = ddlTipoSangre.SelectedValue
            };
            Direccion d = new Direccion
            {
                
                DireccionExacta = txtDireccion.Text,
                Cedula = Convert.ToInt32(txtCedula.Text),
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
                IdPaciente = Convert.ToInt32(txtCedula.Text),
                LugarNacimiento = txtLugarNacimiento.Text,
                Ocupacion = txtOcupacion.Text,
                Sexo = txtSexo.Text
            };
            pac.InsertarPaciente(p,dm,d);
            Response.Redirect("MantenimientoPaciente.aspx");
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MantenimientoPaciente.aspx");
        }
    }
}
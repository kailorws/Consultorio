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
    public partial class ModificarUsuario : System.Web.UI.Page
    {

        static int idUsuario;
        public IUsuario usr;
        Usuario miUsuario = new Usuario();
        public ModificarUsuario()
        {
            usr = new MUsuario();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                idUsuario = Convert.ToInt32(Session["Id"].ToString());
                miUsuario = usr.BuscarUsuario(idUsuario);
                txtNombre.Text = miUsuario.NombreCompleto;
                txtCorreo.Text = miUsuario.Correo;

            }

        }



        protected void btnActualizarContra_Click(object sender, EventArgs e)
        {

            String ContraNueva = txtNueva.Text.ToString();
            String ContraVieja = txtAntigua.Text.ToString();
            Usuario contra = usr.BuscarUsuario(idUsuario);

            if (ContraVieja == contra.Contraseña.ToString())
            {
                contra.Contraseña = ContraNueva;
                usr.ActualizarUsuario(contra);
                lbContraseñaError.Text = "Contraseña modificada con exito";
                lbContraseñaError.Visible = true;
            }
            else
            {
                lbContraseñaError.Text = "Contraseña antigua incorrecta";
                lbContraseñaError.Visible = true;
            }


        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("DetallesUsuario.aspx");
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            miUsuario.NombreCompleto = txtNombre.Text.ToString();
            miUsuario.Correo = txtCorreo.Text.ToString();
            usr.ActualizarUsuario(miUsuario);
            Response.Redirect("DetallesUsuario.aspx");
        }

    }

}
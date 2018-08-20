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
    public partial class DetallesUsuario : System.Web.UI.Page
    {

        static int idUsuario;
        public IUsuario usr;
        public IRol rl;
        public DetallesUsuario()
        {
            usr = new MUsuario();
            rl = new MRol();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                idUsuario = Convert.ToInt32(Session["Id"].ToString());
                Usuario miUsuario = usr.BuscarUsuario(idUsuario);
                Rol miRol = rl.BuscarRol(miUsuario.IdRol);

                txtNombre.Text = miUsuario.NombreCompleto;
                txtCorreo.Text = miUsuario.Correo;
                txtRol.Text = miRol.Nombre;

            }

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Principal.aspx");
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarUsuario.aspx");
        }

    }
}
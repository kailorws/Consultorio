using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DATA;
using Consultorio.BLL.Interfaces;
using Consultorio.BLL.Metodos;

namespace Consultorio
{
    public partial class Login : System.Web.UI.Page
    {
        public IUsuario user;
        public Login()
        {
            user = new MUsuario();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            lbMensajeError.Visible = false;
        }


        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                string correo = txtUsuario.Text;
                string contraseña = txtContrasena.Text;
                var usuario = user.BuscarUsuarioCorreo(correo);
                if(usuario.Correo == correo && usuario.Contraseña == contraseña)
                {
                    Response.Redirect("Principal.aspx");
                }
                else
                {
                    lbMensajeError.Visible = true;
                }
            }catch(Exception ee)
            {
                lbMensajeError.Visible = true;
            }
        }
    }
}
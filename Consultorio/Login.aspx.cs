using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DATA;
using DAL.Interfaces;
using DAL.Metodos;
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
                int idUsuario = Convert.ToInt32(txtUsuario.Text);
                var usuario = user.BuscarUsuario(idUsuario);
                if(usuario.IdUsuario == Convert.ToInt32(txtUsuario.Text) && usuario.Contraseña == txtContrasena.Text)
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
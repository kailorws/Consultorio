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
    public partial class MantenimientoPaciente : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void dgvPacientes_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = dgvPacientes.SelectedRow;
            Response.Redirect("DetallesPaciente.aspx?Cedula=" + row.Cells[0].Text);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarPaciente.aspx");
        }
    }
}
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
    public partial class MantenimientoMedicamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dgvMedicamentos_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = dgvMedicamentos.SelectedRow;
            Response.Redirect("DetallesMedicamento.aspx?CodigoProducto=" + row.Cells[0].Text);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarMedicamento.aspx");
        }

    }
}
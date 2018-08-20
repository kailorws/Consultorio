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
    public partial class AgregarMedicamento : System.Web.UI.Page
    {
        public IMedicamento mdc;
        public AgregarMedicamento()
        {
            mdc = new MMedicamento();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            Medicamento med = new Medicamento()
            {
                IdMedicamento = Convert.ToInt32(txtCodigo.Text),
                NombreGenerico = txtNombre.Text
            };
            mdc.InsertarMedicamento(med);
            Response.Redirect("MantenimientoMedicamento.aspx");
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MantenimientoMedicamento.aspx");
        }
    }
}
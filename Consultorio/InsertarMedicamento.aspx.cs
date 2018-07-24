using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL.Interfaces;
using DAL.Metodos;
using DATA;

namespace Consultorio
{
    public partial class InsertarMedicamento : System.Web.UI.Page
    {
        public IMedicamento med;
        public InsertarMedicamento()
        {
            med = new MMedicamento();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInsertar_Click(object sender, EventArgs e)
        {
            try
            {
                Medicamento medicamento = new Medicamento
                {
                    Id = Convert.ToInt32(txtId.Text),
                    NombreComercial = txtNComercial.Text,
                    NombreGenerico = txtNGenerico.Text,
                    Precio = Convert.ToDouble(txtPrecio.Text),
                    Cantidad = Convert.ToInt32(txtCantidad.Text)                    
                };
                med.InsertarMedicamento(medicamento);
                Response.Redirect("Principal.aspx");
            }
            catch (Exception)
            {

            }
        }
    }
}
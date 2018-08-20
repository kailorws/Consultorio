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
    public partial class DetallesMedicamento : System.Web.UI.Page
    {
        static int codigo;
        public IMedicamento mdc;
        public DetallesMedicamento()
        {
            mdc = new MMedicamento();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                codigo = Convert.ToInt32(Request.QueryString["CodigoProducto"].ToString());
                Medicamento med = mdc.BuscarMedicamento(codigo);

                txtCodigo.Text = med.IdMedicamento.ToString();
                txtNombre.Text = med.NombreGenerico.ToString();
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("MantenimientoMedicamento.aspx");
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            int cm = Convert.ToInt32(txtCodigo.Text.ToString());
            Medicamento nulo = mdc.BuscarMedicamento(cm);
            if (nulo == null)
            {
                Medicamento m = new Medicamento()
                {
                    IdMedicamento = cm,
                    NombreGenerico = txtNombre.Text.ToString()
                };
                mdc.ActualizarMedicamento(m);
            }
            else
            {
                nulo.IdMedicamento = codigo;
                nulo.NombreGenerico = txtNombre.Text.ToString();
                mdc.ActualizarMedicamento(nulo);
            }
            Response.Redirect("MantenimientoMedicamento.aspx");
        }

        protected void btnEliminarPaciente_Click(object sender, EventArgs e)
        {
            mdc.EliminarMedicamento(codigo);
            Response.Redirect("MantenimientoMedicamento.aspx");
        }


    }
}
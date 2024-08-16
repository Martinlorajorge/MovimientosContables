using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenFinal1
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CalcularSumas();
            }
        }
        private void CalcularSumas()
        {
            // Obtener los datos del SqlDataSource
            DataView dv = (DataView)DSMovimientos.Select(DataSourceSelectArguments.Empty);

            decimal sumaDebe = 0;
            decimal sumaHaber = 0;

            // Recorrer los registros y sumar los montos según el tipo
            foreach (DataRowView row in dv)
            {
                string tipo = row["tipo"].ToString();
                decimal monto = Convert.ToDecimal(row["monto"]);

                if (tipo == "D")  // "Debe"
                {
                    sumaDebe += monto;
                }
                else if (tipo == "H")  // "Haber"
                {
                    sumaHaber += monto;
                }
            }

            // Asignar los resultados a los Labels
            LabelDebe.Text = "Total Debe: " + sumaDebe.ToString("C2");
            LabelHaber.Text = "Total Haber: " + sumaHaber.ToString("C2");
        }
    }
}
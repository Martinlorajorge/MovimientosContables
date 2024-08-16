using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExamenFinal1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            DSMovimientos.InsertParameters["idcuenta"].DefaultValue = DropDownList1.SelectedValue;
            DSMovimientos.InsertParameters["monto"].DefaultValue = Convert.ToDecimal(TextBox1.Text).ToString("F2", CultureInfo.InvariantCulture);
            DSMovimientos.InsertParameters["tipo"].DefaultValue = TextBox2.Text;
            // Convertimos la fecha ingresada a un objeto DateTime y lo formateamos sin horas
            DateTime fecha = DateTime.Parse(TextBox3.Text);
            DSMovimientos.InsertParameters["fecha"].DefaultValue = fecha.ToString("yyyy-MM-dd");
            DSMovimientos.Insert();

            Label1.Text = "Datos agregados correctamente";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = GridView1.SelectedIndex;           //Declaro el nombre de la fila seleccionada
            GridViewRow row = GridView1.Rows[index];       //Selecciono la Fila

            TextBox1.Text = row.Cells[3].Text; //Monto
            TextBox2.Text = row.Cells[4].Text; //Tipo
            TextBox3.Text = row.Cells[2].Text.Substring(0,10); //Fecha y con el substring extraigo los 10 primeros caracteres
            DropDownList1.SelectedValue = row.Cells[5].Text; //Cuenta

            TextBox4.Text = row.Cells[1].Text;
            TextBox5.Text = row.Cells[1].Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DSMovimientos.DeleteParameters["id"].DefaultValue = TextBox4.Text;
            DSMovimientos.Delete();

            Label1.Text = "Movimiento BORRADO Correctamente!!!";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(TextBox1.Text) && !string.IsNullOrEmpty(TextBox2.Text) && !string.IsNullOrEmpty(TextBox3.Text) && !string.IsNullOrEmpty(DropDownList1.SelectedValue) && !string.IsNullOrEmpty(TextBox5.Text))
            {
                DSMovimientos.UpdateParameters["idcuenta"].DefaultValue = Convert.ToInt32( DropDownList1.SelectedValue).ToString();
                DSMovimientos.UpdateParameters["monto"].DefaultValue = Convert.ToDecimal(TextBox1.Text).ToString("F2", CultureInfo.InvariantCulture);
                DSMovimientos.UpdateParameters["tipo"].DefaultValue = TextBox2.Text;
                DSMovimientos.UpdateParameters["fecha"].DefaultValue =DateTime.Parse( TextBox3.Text).ToString("yyyy-MM-dd");
                DSMovimientos.UpdateParameters["id"].DefaultValue = TextBox5.Text;

                DSMovimientos.Update();

                Label1.Text = "Movimiento MODIFICADO Correctamente!!!";
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
            }
            else
            {
                Label1.Text = "Por favor, complete todos los campos.";
            }

        }
    }
}
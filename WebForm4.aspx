<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="ExamenFinal1.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center">
         <h1 >Resumen</h1>
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="DSMovimientos" ForeColor="#333333" GridLines="None">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                 <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                 <asp:BoundField DataField="fecha" DataFormatString="{0:dd-MM-yyyy}" HeaderText="fecha" HtmlEncode="False" SortExpression="fecha" />
                 <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
                 <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                 <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                 <asp:BoundField DataField="idcuenta" HeaderText="idcuenta" SortExpression="idcuenta" Visible="False" />
             </Columns>
             <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
             <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
             <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
             <SortedAscendingCellStyle BackColor="#FDF5AC" />
             <SortedAscendingHeaderStyle BackColor="#4D0000" />
             <SortedDescendingCellStyle BackColor="#FCF6C0" />
             <SortedDescendingHeaderStyle BackColor="#820000" />
         </asp:GridView>

          <!-- Etiquetas para mostrar el total de Debe y Haber -->
         <br />
        <p>
         <span style="padding-right:5px"><asp:Label ID="LabelDebe" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Green" /></span>      <span>
         <asp:Label ID="LabelHaber" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red" /></span></p>
    </div>

    <asp:SqlDataSource runat="server" ID="DSMovimientos" ConnectionString="<%$ ConnectionStrings:ExamenFinalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ExamenFinalConnectionString1.ProviderName %>" SelectCommand="select mc.id, fecha,monto,tipo,idcuenta,cu.descripcion
from movimientoscontables as mc 
inner join cuentas as cu on cu.id = mc.idcuenta"></asp:SqlDataSource>
</asp:Content>

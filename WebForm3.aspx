<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="ExamenFinal1.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    Cuentas:&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="DSCuentas" DataTextField="descripcion" DataValueField="id">
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ver Movimientos" />
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="DSMovimientos" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="fecha" DataFormatString="{0:dd-MM-yyyy}" HeaderText="fecha" HtmlEncode="False" SortExpression="fecha" />
            <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
            <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
            <asp:BoundField DataField="idcuenta" HeaderText="idcuenta" SortExpression="idcuenta" />
            <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#FBFBF2" />
        <SortedAscendingHeaderStyle BackColor="#848384" />
        <SortedDescendingCellStyle BackColor="#EAEAD3" />
        <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="DSMovimientos" runat="server" ConnectionString="<%$ ConnectionStrings:ExamenFinalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ExamenFinalConnectionString1.ProviderName %>" SelectCommand="select mc.id,fecha,monto,tipo,idcuenta,cu.descripcion
from movimientoscontables as mc 
inner join cuentas as cu on cu.id = mc.idcuenta
where cu.id =@id">
        <SelectParameters>
            <asp:Parameter Name="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSCuentas" runat="server" ConnectionString="<%$ ConnectionStrings:ExamenFinalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ExamenFinalConnectionString1.ProviderName %>" SelectCommand="select id,descripcion from cuentas"></asp:SqlDataSource>
    <br />
</asp:Content>

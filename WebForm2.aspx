<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ExamenFinal1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        Seleccione la cuenta:
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="DSCuentas" DataTextField="descripcion" DataValueField="id">
        </asp:DropDownList>
    </p>
    <p>
        Monto:&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" Width="119px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="El campo MONTO  se encuentra vacio" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="El monto debe ser un número con hasta 8 dígitos enteros y hasta 2 decimales, utilizando una coma (,) como separador decimal." ForeColor="Red" ValidationExpression="^\d{1,8}(?:,\d{1,2})?$"></asp:RegularExpressionValidator>
    </p>
    <p>
        Tipo:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 5px" Width="119px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="None" ErrorMessage="El campo TIPO se encuentra vacio" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" Display="None" ErrorMessage="Solo se permite D (debe) o H (haber)." ForeColor="Red" ValidationExpression="^[DH]$"></asp:RegularExpressionValidator>
    </p>
    <p>
        Fecha:&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="None" ErrorMessage="El campo FECHA se encuentra vacio" ForeColor="#FF3300"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3" Display="None" ErrorMessage="El formato para la fecha es dd-MM-yyyy (dia-mes-año)." ForeColor="Red" ValidationExpression="^\d{2}-\d{2}-\d{4}$"></asp:RegularExpressionValidator>
    </p>
    
    <p>
    </p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Agregar" />
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="DSMovimientos" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="fecha" HeaderText="fecha" SortExpression="fecha" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False" />
                <asp:BoundField DataField="monto" HeaderText="monto" SortExpression="monto" />
                <asp:BoundField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                <asp:BoundField DataField="idCuenta" HeaderText="idCuenta" SortExpression="idCuenta" />
                <asp:BoundField DataField="descripcion" HeaderText="descripcion" SortExpression="descripcion" />
            </Columns>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    &nbsp;&nbsp;&nbsp;
    </p>
    <p>
        Ingrese Codigo de Movimiento Contable
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Borrar movimiento contable" />
    </p>
    <p>
        Ingrese Codigo de Movimiento Contable a Modificar
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Modificar movimiento contable" />
    </p>
    <p>
        <asp:SqlDataSource ID="DSCuentas" runat="server" ConnectionString="<%$ ConnectionStrings:ExamenFinalConnectionString1 %>" ProviderName="<%$ ConnectionStrings:ExamenFinalConnectionString1.ProviderName %>" SelectCommand="select descripcion,id from cuentas"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSMovimientos" runat="server" ConnectionString="<%$ ConnectionStrings:ExamenFinalConnectionString1 %>" InsertCommand="INSERT INTO MovimientosContables (fecha, monto, tipo, idCuenta) 
VALUES (@fecha, @monto, @tipo, @idcuenta);" ProviderName="<%$ ConnectionStrings:ExamenFinalConnectionString1.ProviderName %>" SelectCommand="SELECT 
    mc.id,       -- Selecciona el campo 'id' de la tabla 'movimientoscontables'
    fecha,       -- Selecciona el campo 'fecha' de la tabla 'movimientoscontables'
    monto,       -- Selecciona el campo 'monto' de la tabla 'movimientoscontables'
    tipo,        -- Selecciona el campo 'tipo' de la tabla 'movimientoscontables'
    idCuenta,    -- Selecciona el campo 'idCuenta' de la tabla 'movimientoscontables'
    cu.descripcion -- Selecciona el campo 'descripcion' de la tabla 'cuentas'
FROM 
    movimientoscontables AS mc
INNER JOIN 
    cuentas AS cu 
ON 
    cu.id = mc.idCuenta;
" DeleteCommand="delete from movimientoscontables where  id=@id" UpdateCommand="update movimientoscontables
set fecha=@fecha,
      monto=@monto,
      tipo=@tipo,
      idcuenta=@idcuenta
where id=@id">
            <DeleteParameters>
                <asp:Parameter Name="id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="fecha" />
                <asp:Parameter Name="monto" />
                <asp:Parameter Name="tipo" />
                <asp:Parameter Name="idcuenta" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="fecha" />
                <asp:Parameter Name="monto" />
                <asp:Parameter Name="tipo" />
                <asp:Parameter Name="idcuenta" />
                <asp:Parameter Name="id" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

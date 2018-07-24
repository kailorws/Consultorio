<%@ Page Title="Medicamentos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InsertarMedicamento.aspx.cs" Inherits="Consultorio.InsertarMedicamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="box-center">
        <asp:Label ID="lbId" runat="server" Text="ID: "></asp:Label>
        <asp:TextBox ID="txtId" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Label ID="lbNComercial" runat="server" Text="Nombre comercial: "></asp:Label>
        <asp:TextBox ID="txtNComercial" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Label ID="lbNGenerico" runat="server" Text="Nombre generico: "></asp:Label>
        <asp:TextBox ID="txtNGenerico" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Label ID="lbPrecio" runat="server" Text="Precio: "></asp:Label>
        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Label ID="lbCantidad" runat="server" Text="Cantidad: "></asp:Label>
        <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control"></asp:TextBox>
        <br />
        <asp:Button ID="btnInsertar" runat="server" Text="Insertar" CssClass="btn btn-primary" OnClick="btnInsertar_Click" />
    </div>

</asp:Content>

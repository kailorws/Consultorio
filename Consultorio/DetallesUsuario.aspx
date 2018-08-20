<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallesUsuario.aspx.cs" Inherits="Consultorio.DetallesUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <% if (Session["Id"] != null)
        {%>

    <h1>Detalles del usuario </h1>
    <hr />
    <div class="panel panel-default">

        <div class="panel-heading">
            <h3 class="panel-title">Mis Datos Personales </h3>
        </div>

        <div class="panel-body">

            <div class="form-group form-inline">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblCorreo" runat="server" Text="Correo: "></asp:Label>
                <asp:TextBox ID="txtCorreo" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblRol" runat="server" Text="Puesto: "></asp:Label>
                <asp:TextBox ID="txtRol" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
    </div>

    <div>

        <asp:Button ID="btnRegresar" OnClick="btnRegresar_Click" CssClass="btn btn-default" runat="server" Text="Regresar a la pagina principal" />

        <div style="float: right">
            <asp:Button ID="btnActualizar" OnClick="btnActualizar_Click" CssClass="btn btn-default" runat="server" Text="Cambiar datos de mi cuenta" />
        </div>

    </div>


    <%  }
        else { Response.Redirect("Login.aspx"); } %>
</asp:Content>

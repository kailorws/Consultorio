<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModificarUsuario.aspx.cs" Inherits="Consultorio.ModificarUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <% if (Session["Id"] != null)
        {%>

    <h1 id="tituloModificar"></h1>
    <hr />
    <div class="panel panel-default">

        <div class="panel-heading">
            <h3 class="panel-title">Mis Datos Personales </h3>
        </div>

        <div class="panel-body">

            <div class="form-group form-inline">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblCorreo" runat="server" Text="Correo: "></asp:Label>
                <asp:TextBox ID="txtCorreo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="panel panel-default">

        <div class="panel-heading">
            <h3 class="panel-title">Cambiar Contraseña </h3>
        </div>

        <div class="panel-body">

            <div class="form-group form-inline">
                <asp:Label ID="lblPassAntiguo" runat="server" Text="Constraseña Antigua: "></asp:Label>
                <asp:TextBox ID="txtAntigua" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblPassNuevo" runat="server" Text="Contraseña Nueva: "></asp:Label>
                <asp:TextBox ID="txtNueva" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
            </div>

            <asp:Label ID="lbContraseñaError" Visible="false" runat="server"></asp:Label>

            <br />

            <div style="float: right">
                <asp:Button ID="btnContraseña" OnClick="btnActualizarContra_Click" CssClass="btn btn-primary" runat="server" Text="Cambiar mi contraseña" />
            </div>

        </div>

    </div>

    <div>

        <asp:Button ID="btnRegresar" OnClick="btnRegresar_Click" CssClass="btn btn-default" runat="server" Text="Volver a mi perfil" />

        <div style="float: right">
            <asp:Button ID="btnActualizar" OnClick="btnActualizar_Click" CssClass="btn btn-default" runat="server" Text="Actualizar mis datos" />
        </div>

    </div>


    <%  }
        else { Response.Redirect("Login.aspx"); } %>
</asp:Content>

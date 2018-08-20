<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallesMedicamento.aspx.cs" Inherits="Consultorio.DetallesMedicamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <% if (Session["Id"] != null)
        {%>

    <h1>Detalles del Medicamento</h1>

    <hr />
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Especificaciones</h3>
        </div>
        <div class="panel-body">

            <div class="form-group form-inline">
                <asp:Label ID="lblCodigo" runat="server" Text="Codigo del producto: "></asp:Label>
                <asp:TextBox ID="txtCodigo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group form-inline">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>
        
    <hr />

     <div>

        <asp:Button ID="btnRegresar" OnClick="btnRegresar_Click" CssClass="btn btn-default" runat="server" Text="Regresar" />

        <div style="float: right">
            <asp:Button ID="btnEliminarPaciente" OnClick="btnEliminarPaciente_Click" CssClass="btn btn-default" runat="server" Text="Eliminar" />
            <asp:Button ID="btnActualizar" OnClick="btnActualizar_Click" CssClass="btn btn-default" runat="server" Text="Actualizar" />
        </div>

    </div>

    <%  }
        else { Response.Redirect("Login.aspx"); } %>


</asp:Content>

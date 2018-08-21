<%@ Page Title="Agregar Cita" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AgregarCita.aspx.cs" Inherits="Consultorio.AgregarCita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <% if (Session["Id"] != null)
        {%>

     <h1>Agregar Cita</h1>
    <div class="alert alert-success" visible="false" id="mensaje" runat="server">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong id="textoMensaje" runat="server"></strong>
    </div>
    <div class="alert alert-danger" visible="false" id="mensajeError" runat="server">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong id="textoMensajeError" runat="server"></strong>
    </div>
    <hr />
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Datos</h3>
        </div>
        <div class="panel-body">          
            <div class="form-group form-inline">
                <asp:Label ID="lbHorario" runat="server" Text="Horario: "></asp:Label>
                <asp:DropDownList ID="ddlHorario" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lbCedula" runat="server" Text="Cédula:"></asp:Label>
                <asp:TextBox ID="txtCedula" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lbDescripcion" runat="server" Text="Descripción:"></asp:Label>                
                <asp:TextBox ID="txtDescripción" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="Fecha" runat="server" Text="Fecha: "></asp:Label>
                <asp:Calendar ID="CFecha" runat="server"></asp:Calendar>               
            </div>
        </div>
    </div>
    <hr />

    <div>

         <asp:Button ID="btnRegresar" OnClick="btnRegresar_Click" CssClass="btn btn-default" runat="server" Text="Regresar" />

        <div style="float: right">
            <asp:Button ID="btnGuardar" OnClick="btnGuardar_Click" CssClass="btn btn-default" runat="server" Text="Guardar" />
        </div>
    </div>

    <%  }
        else { Response.Redirect("Login.aspx"); } %>

</asp:Content>

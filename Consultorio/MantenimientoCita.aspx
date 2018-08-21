<%@ Page Title="Mantenimiento de Citas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenimientoCita.aspx.cs" Inherits="Consultorio.MantenimientoCita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <% if(Session["Id"] != null) {%>

     <h1>Gestión de citas</h1>
    <div class="alert alert-success" visible="false" id="mensaje" runat="server">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong id="textoMensaje" runat="server"></strong>
    </div>
    <div class="alert alert-danger" visible="false" id="mensajeError" runat="server">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong id="textoMensajeError" runat="server"></strong>
    </div>

    <div class="form-inline">
        <asp:Label ID="lbIdCita" runat="server" Text="Id de Cita: " ></asp:Label>
        <asp:TextBox ID="txtIdCita" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click" />
    </div>
     <div class="form-group" id="formMantenimiento" runat="server" visible="false">
         <div class="form-group form-inline">
                <asp:Label ID="lbHorario" runat="server" Text="Horario: "></asp:Label>
                <asp:DropDownList ID="ddlHorario" CssClass="form-control" runat="server"></asp:DropDownList>
         </div>
        <asp:Label ID="lbDescripcion" runat="server" Text="Descripción"></asp:Label>
        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Label ID="lbFecha" runat="server" Text="Fecha: "></asp:Label>
        <asp:Calendar ID="CFecha" runat="server"></asp:Calendar>  
        <div class="form-horizontal">
        <br />
        <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" CssClass="btn btn-warning" OnClick="btnActualizar_Click" />
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="btnEliminar_Click" />
      </div>
  </div>
    

    
       

    <%  }else{ Response.Redirect("Login.aspx"); } %>

</asp:Content>

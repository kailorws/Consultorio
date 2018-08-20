<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenimientoCita.aspx.cs" Inherits="Consultorio.MantenimientoCita" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <% if(Session["Id"] != null) {%>

     <h1>Mantenimiento de citas</h1>
    <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" CssClass="btn btn-default" runat="server" Text="Agregar" />
    <hr />
    

    
       

    <%  }else{ Response.Redirect("Login.aspx"); } %>

</asp:Content>

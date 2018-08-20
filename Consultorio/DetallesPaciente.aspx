<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetallesPaciente.aspx.cs" Inherits="Consultorio.DetallesPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <% if (Session["Id"] != null)
        {%>

    <h1>Control Paciente</h1>

    <hr />
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Datos Personales</h3>
        </div>
        <div class="panel-body">
            <div class="form-group form-inline">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre: "></asp:Label>
                <asp:TextBox ID="txtNombre" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblApellido1" runat="server" Text="Primer Apellido:"></asp:Label>
                <asp:TextBox ID="txtApellido1" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblApellido2" runat="server" Text="Segundo Apellido:"></asp:Label>
                <asp:TextBox ID="txtApellido2" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblSexo" runat="server" Text="Sexo: "></asp:Label>
                <asp:TextBox ID="txtSexo" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblFechaNacimiento" runat="server" Text="Fecha Nacimiento:"></asp:Label>
                <asp:TextBox ID="txtFechaNacimiento" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblLugarNacimiento" runat="server" Text="Lugar Nacimiento:"></asp:Label>
                <asp:TextBox ID="txtLugarNacimiento" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblEstadoCivil" runat="server" Text="Estado Civil:"></asp:Label>
                <asp:DropDownList ID="ddlEstadoCivil" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblOcupacion" runat="server" Text="Ocupacion:"></asp:Label>
                <asp:TextBox ID="txtOcupacion" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>
    <hr />
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Contacto</h3>
        </div>
        <div class="panel-body">

            <div class="form-group form-inline">
                <asp:Label ID="lblCiudad" runat="server" Text="Ciudad de Residencia"></asp:Label>
                <asp:TextBox ID="txtCiudad" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblProvincia" runat="server" Text="Provincia de Residencia"></asp:Label>
                <asp:TextBox ID="txtProvincia" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblDireccion" runat="server" Text="Direccion Exacta"></asp:Label>
                <asp:TextBox ID="txtDireccion" CssClass="form-control" TextMode="multiline" Columns="50" Rows="3" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblTelefono" runat="server" Text="Telefono"></asp:Label>
                <asp:TextBox ID="txtTelefono" CssClass="form-control" runat="server"></asp:TextBox>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblCorreo" runat="server" Text="Correo"></asp:Label>
                <asp:TextBox ID="txtCorreo" CssClass="form-control" runat="server"></asp:TextBox>

            </div>
        </div>
    </div>
    <hr />
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Datos Medicos</h3>
        </div>
        <div class="panel-body">

            <div class="form-group form-inline">
                <asp:Label ID="lblTipoSangre" runat="server" Text="Tipo de Sangre"></asp:Label>
                <asp:DropDownList ID="ddlTipoSangre" CssClass="form-control" runat="server"></asp:DropDownList>
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblAlergia" runat="server" Text="Alergias"></asp:Label>
                <asp:CheckBox ID="cbxAlergia" CssClass="form-control" runat="server" />
            </div>

            <div class="form-group form-inline">
                <asp:Label ID="lblTipoAlergia" runat="server" Text="Tipo de alergia"></asp:Label>
                <asp:TextBox ID="txtTipoAlergia" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
        </div>
    </div>

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

<%@ Page Title="Pacientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenimientoPaciente.aspx.cs" Inherits="Consultorio.MantenimientoPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <% if(Session["Id"] != null) {%>

    <h1>Mantenimiento de pacientes</h1>
    <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" CssClass="btn btn-success" runat="server" Text="Agregar" />
    <hr />
    

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Lista de Pacientes</h3>
             </div>
            <div class="panel-body">
                <asp:GridView ID="dgvPacientes" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" DataKeyNames="IdPaciente" DataSourceID="Pacientes" AllowPaging="True" OnSelectedIndexChanged="dgvPacientes_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="IdPaciente" HeaderText="Cedula" ReadOnly="True" SortExpression="IdPaciente"></asp:BoundField>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre"></asp:BoundField>
                        <asp:BoundField DataField="Apellido1" HeaderText="Primer Apellido" SortExpression="Apellido1"></asp:BoundField>
                        <asp:BoundField DataField="Apellido2" HeaderText="Segundo Apellido" SortExpression="Apellido2"></asp:BoundField>
                        <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True"></asp:CommandField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="Pacientes" ConnectionString='<%$ ConnectionStrings:ConsultorioConnectionString %>' DeleteCommand="DELETE FROM [Paciente] WHERE [IdPaciente] = @IdPaciente" InsertCommand="INSERT INTO [Paciente] ([IdPaciente], [Nombre], [Apellido1], [Apellido2]) VALUES (@IdPaciente, @Nombre, @Apellido1, @Apellido2)" SelectCommand="SELECT [IdPaciente], [Nombre], [Apellido1], [Apellido2] FROM [Paciente]" UpdateCommand="UPDATE [Paciente] SET [Nombre] = @Nombre, [Apellido1] = @Apellido1, [Apellido2] = @Apellido2 WHERE [IdPaciente] = @IdPaciente">
                    <DeleteParameters>
                        <asp:Parameter Name="IdPaciente" Type="Int32"></asp:Parameter>
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IdPaciente" Type="Int32"></asp:Parameter>
                        <asp:Parameter Name="Nombre" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Apellido1" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Apellido2" Type="String"></asp:Parameter>
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Nombre" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Apellido1" Type="String"></asp:Parameter>
                        <asp:Parameter Name="Apellido2" Type="String"></asp:Parameter>
                        <asp:Parameter Name="IdPaciente" Type="Int32"></asp:Parameter>
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>

    
    <%  }else{ Response.Redirect("Login.aspx"); } %>

</asp:Content>

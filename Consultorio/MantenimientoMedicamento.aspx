<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MantenimientoMedicamento.aspx.cs" Inherits="Consultorio.MantenimientoMedicamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <% if (Session["Id"] != null)
        {%>

    <h1>Mantenimiento de Medicamentos</h1>
    <asp:Button ID="btnAgregar" OnClick="btnAgregar_Click" CssClass="btn btn-success" runat="server" Text="Agregar" />
    <hr />


    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Lista de Medicamentos</h3>
        </div>
        <div class="panel-body">
            <asp:GridView ID="dgvMedicamentos" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" DataKeyNames="IdMedicamento" DataSourceID="Medic" AllowPaging="True" OnSelectedIndexChanged="dgvMedicamentos_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="IdMedicamento" HeaderText="IdMedicamento" ReadOnly="True" SortExpression="IdMedicamento"></asp:BoundField>
                    <asp:BoundField DataField="NombreGenerico" HeaderText="NombreGenerico" SortExpression="NombreGenerico"></asp:BoundField>
                    <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True"></asp:CommandField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="Medic" ConnectionString='<%$ ConnectionStrings:ConsultorioConnectionString %>' DeleteCommand="DELETE FROM [Medicamento] WHERE [IdMedicamento] = @IdMedicamento" InsertCommand="INSERT INTO [Medicamento] ([IdMedicamento], [NombreGenerico]) VALUES (@IdMedicamento, @NombreGenerico)" SelectCommand="SELECT [IdMedicamento], [NombreGenerico] FROM [Medicamento]" UpdateCommand="UPDATE [Medicamento] SET [IdMedicamento] = @IdMedicamento, [NombreGenerico] = @NombreGenerico WHERE [IdMedicamento] = @IdMedicamento">
                <DeleteParameters>
                    <asp:Parameter Name="IdMedicamento" Type="Int32"></asp:Parameter>
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="IdMedicamento" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="NombreGenerico" Type="String"></asp:Parameter>
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IdMedicamento" Type="Int32"></asp:Parameter>
                    <asp:Parameter Name="NombreGenerico" Type="String"></asp:Parameter>
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>


    <%  }
        else { Response.Redirect("Login.aspx"); } %>
</asp:Content>

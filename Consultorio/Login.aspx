<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Consultorio.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Style.css" rel="stylesheet" />
    <title>Consultorio de la Dra. Xinia Jiménez</title>
</head>
<body>
    <form runat="server">
        <div class=" panel-img">
            <img src="Resources/Imagenes/Panel.png" alt="" />
        </div>


        <div>
            <div style="position: absolute; z-index: 1" id="layer2">
                <div class="modal-body" style="margin: 30px 0px 0px 400px">
                    <div class="row">
                        <div class="col-xs-6">
                            <div>
                                <div class="form-group" runat="server">
                                    <asp:Label ID="lbUsuario" runat="server" Text="Nombre de usuario"></asp:Label>
                                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox>
                                    <span class="help-block"></span>
                                    <asp:Label ID="lbPassword" runat="server" Text="Contraseña"></asp:Label>
                                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
                                    <span class="help-block"></span>
                                    <br />
                                    <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" CssClass="btn btn-primary" OnClick="btnIngresar_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </form>
</body>
</html>

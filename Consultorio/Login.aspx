<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Consultorio.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Style.css" rel="stylesheet" />
    <title>Consultorio de la Dra. Xinia Jiménez</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Leckerli+One|Oleo+Script+Swash+Caps');
    </style>
</head>
<body>
   <header>
       <asp:Image ID="icono" ImageUrl="~/Resources/Imagenes/icono.png" runat="server" />
       <asp:Label ID="lbTitulo" runat="server" Text="Xinia María Jiménez Campos"></asp:Label>
   </header>
    <form id="form1" runat="server">
        <section class="cover">
            


                <div class="elements">
                    <div class="intro">
                        
		<br/>
		<div class="col-md-12">
			<div id="carousel-1" class="carousel slide" data-ride="carousel">
				<!-- Indicadores -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-1" data-slide-to="0"	class="active" ></li>
					<li data-target="#carousel-1" data-slide-to="1"	></li>
					<li data-target="#carousel-1" data-slide-to="2"	></li>
				</ol>
				<!-- contenedor de los slide -->
				
				<div class="carousel-inner" role="listbox">
					<!-- #1 -->
					<div class="item  active">
						<asp:Image ImageUrl="~/Resources/Imagenes/background.jpg" runat="server" class="img-responsive" alt="" Width="100%" Height="100%" /> <!-- style="width:822px;height:322px;" --> <!-- YA ME QUEDO CLARO POR QUE TODAS LAS IMAGENES MISMO TAMAÑO -->
						<div class="carousel-caption">
							<!-- <h3>Este es nuestro Slide #1</h3> -->
						</div>
					</div>
					<!-- #2 -->
					<div class="item ">
						<asp:Image ImageUrl="~/Resources/Imagenes/background3.jpg" runat="server" class="img-responsive" alt="" Width="100%" Height="100%" />
						<div class="carousel-caption">
							<!-- <h3>Este es nuestro Slide #2</h3> -->
						</div>
					</div>
					<!-- #3 -->
					<div class="item">
						<asp:Image ImageUrl="~/Resources/Imagenes/background2.jpg" runat="server" class="img-responsive" alt="" Width="100%" Height="100%" />
						<div class="carousel-caption">
			   				<!-- <h3>Este es nuestro Slide #3</h3> -->
						</div>
					</div>
				</div>
				<!-- Controles -->
				<a href="#carousel-1" class="left carousel-control" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Anterior</span>
				</a>
				<a href="#carousel-1" class="right carousel-control" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Siguiente</span>
				</a>
			</div>
		</div>
	
                    </div>
                    <div class="intro2">
                        <asp:Label ID="lbIngresar" runat="server" Text="Inicia sesión"></asp:Label>

                        <asp:TextBox ID="txtUsuario" CssClass="txt1 txtstyle" placeholder="Usuario" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtContrasena" CssClass="txt2 txtstyle" placeholder="Contraseña" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:Label ID="lbMensajeError"  runat="server"></asp:Label>
                        <asp:Button ID="btnIngresar" CssClass="btn1 btnstyle" runat="server" Text="Iniciar sesión" OnClick="btnIngresar_Click"/>

                    </div>
                </div>
            
            <div style="height: 100%; width: 20vw; margin-left: 80vw; background-color: #7dcf7d" runat="server"></div>
        </section>
    </form>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</body>
</html>

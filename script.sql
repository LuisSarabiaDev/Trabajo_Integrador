USE [ProyectoProg3]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulos](
	[CodArticulo] [int] NULL,
	[NombreArticulo] [nvarchar](40) NULL,
	[Marca] [nvarchar](20) NULL,
	[PrecioUnitario] [money] NULL,
	[Estado] [bit] NULL,
	[IdCategoria] [int] NULL,
	[Stock] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[CodCategoria] [int] NULL,
	[NombreCategoria] [nvarchar](20) NULL,
	[Descripcion] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdCliente] [int] NOT NULL,
	[Nombre] [char](30) NOT NULL,
	[Apellido] [char](30) NOT NULL,
	[Email] [char](30) NOT NULL,
	[Celular] [int] NULL,
	[Dni] [int] NOT NULL,
	[Direccion] [char](50) NULL,
	[Contrasena] [char](30) NOT NULL,
	[Tipo_Usuario] [char](15) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Marca], [PrecioUnitario], [Estado], [IdCategoria], [Stock]) VALUES (1, N'Memoria ram 125xp', N'XPJ', 2500.0000, 1, 1, 100)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Marca], [PrecioUnitario], [Estado], [IdCategoria], [Stock]) VALUES (2, N'Disco Solido', N'WD', 4700.0000, 1, 2, 50)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Marca], [PrecioUnitario], [Estado], [IdCategoria], [Stock]) VALUES (3, N'Auriculares Cloud ', N'HyperX', 5660.0000, 0, 4, 0)
INSERT [dbo].[Articulos] ([CodArticulo], [NombreArticulo], [Marca], [PrecioUnitario], [Estado], [IdCategoria], [Stock]) VALUES (5, N'SSD WD', N'wd', 1500.0000, 0, 1, 127)
GO
INSERT [dbo].[Categorias] ([CodCategoria], [NombreCategoria], [Descripcion]) VALUES (1, N'Memoria Ram', N'8 GB DDR 5 1333 MHZ')
INSERT [dbo].[Categorias] ([CodCategoria], [NombreCategoria], [Descripcion]) VALUES (2, N'SSD', N'240 GB')
INSERT [dbo].[Categorias] ([CodCategoria], [NombreCategoria], [Descripcion]) VALUES (3, N'HD', N'1 TB')
INSERT [dbo].[Categorias] ([CodCategoria], [NombreCategoria], [Descripcion]) VALUES (4, N'AURICULARES', N'GAMER')
GO
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Email], [Celular], [Dni], [Direccion], [Contrasena], [Tipo_Usuario]) VALUES (1000, N'Juan                          ', N'Cuello                        ', N'jl@fakemail.com               ', 1526789845, 35965412, N'Cazon 123, Tigre                                  ', N'juanlopez                     ', N'Administrador  ')
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Email], [Celular], [Dni], [Direccion], [Contrasena], [Tipo_Usuario]) VALUES (1001, N'Mariano                       ', N'Cuello                        ', N'mc@fakemail.com               ', 1523469745, 36852456, N'Libertad 4563, Tigre                              ', N'marianocuello                 ', N'Cliente        ')
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Email], [Celular], [Dni], [Direccion], [Contrasena], [Tipo_Usuario]) VALUES (1002, N'Mauro                         ', N'Perez                         ', N'mp@fakemail.com               ', 1552637485, 41456789, N'Valencia 145, Caba                                ', N'mauroperez                    ', N'Administrador  ')
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Email], [Celular], [Dni], [Direccion], [Contrasena], [Tipo_Usuario]) VALUES (1005, N'Maria                         ', N'Perez                         ', N'mp@fakemail.com               ', 1585369745, 38745965, N'Cordoba 1234, Tigre                               ', N'maria perez                   ', N'Administrador  ')
INSERT [dbo].[Usuarios] ([IdCliente], [Nombre], [Apellido], [Email], [Celular], [Dni], [Direccion], [Contrasena], [Tipo_Usuario]) VALUES (1006, N'Daniel                        ', N'Castilla                      ', N'cd@gmail.com                  ', 1578964663, 38965412, N'Cuyo 456, Caba                                    ', N'danielcastilla                ', N'Cliente        ')
GO
/****** Object:  StoredProcedure [dbo].[spAgregarArticulo]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spAgregarArticulo]
(
	@CODARTICULO INT,
	@NOMBREARTICULO NVARCHAR(40),
	@MARCA NVARCHAR(20),
	@PRECIOUNITARIO MONEY,
	@ESTADO BIT,
	@IDCATEGORIA INT,
	@STOCK INT
)
	AS
	BEGIN
	INSERT INTO Articulos(CodArticulo,NombreArticulo,Marca,PrecioUnitario,Estado,IdCategoria,Stock)
	VALUES (@CODARTICULO,@NOMBREARTICULO,@MARCA,@PRECIOUNITARIO,@ESTADO,@IDCATEGORIA,@STOCK)
	END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarCategoria]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spAgregarCategoria]
(
	@CODCATEGORIA int,
	@NOMBRECATEGORIA NVARCHAR(20),
	@DESCRIPCION NVARCHAR(MAX)
)
	AS
	BEGIN
	INSERT INTO Categorias(CodCategoria,NombreCategoria,Descripcion)
	values (@CODCATEGORIA,@NOMBRECATEGORIA,@DESCRIPCION)
	END
GO
/****** Object:  StoredProcedure [dbo].[spAgregarUsuario]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregarUsuario]
	@IDCLIENTE INT,
	@NOMBRE CHAR(30),
	@APELLIDO CHAR(30),
	@EMAIL CHAR(30),
	@CELULAR INT,
	@DNI INT,
	@DIRECCION CHAR(50),
	@CONTRASENA CHAR(30),
	@TIPOUSUARIO CHAR(15)
AS
	INSERT INTO Usuarios(IdCliente,Nombre,Apellido,Email,Celular,Dni,Direccion,Contrasena,Tipo_Usuario)
	SELECT @IDCLIENTE,@NOMBRE,@APELLIDO,@EMAIL,@CELULAR,@DNI,@DIRECCION,@CONTRASENA,@TIPOUSUARIO
GO
/****** Object:  StoredProcedure [dbo].[spBuscarArticulo]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarArticulo]
(
	@CODARTICULO INT
)
AS
BEGIN
	SELECT * FROM Articulos WHERE  CodArticulo = @CODARTICULO
END
GO
/****** Object:  StoredProcedure [dbo].[spBuscarCategoria]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spBuscarCategoria]
(
	@NOMBRECATEGORIA NVARCHAR(20)
)
AS
BEGIN
	SELECT * FROM Categorias WHERE NombreCategoria = @NOMBRECATEGORIA
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarArticulo]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarArticulo]
(
	@CODCARTICULO INT
)
AS
BEGIN
	delete from Articulos where CodArticulo = @CODCARTICULO
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarCategoria]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarCategoria]
(
	@CODCATEGORIA INT
)
AS
BEGIN
	DELETE FROM Categorias WHERE CodCategoria = @CODCATEGORIA
END
GO
/****** Object:  StoredProcedure [dbo].[spEliminarUsuario]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarUsuario]

@IDCLIENTE INT
AS
	DELETE FROM Usuarios Where IdCliente =@IDCLIENTE
GO
/****** Object:  StoredProcedure [dbo].[spModificarUsuario]    Script Date: 03/11/2021 8:26:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spModificarUsuario]
(
@IDCLIENTE INT,
@NOMBRE CHAR(30),
@APELLIDO CHAR(30),
@EMAIL CHAR(30),
@CELULAR INT,
@DNI INT,
@DIRECCION CHAR(50),
@CONTRASENA CHAR(30),
@TIPOUSUARIO CHAR(15)
)
AS
UPDATE Usuarios
SET
Nombre =@NOMBRE,
Apellido = @APELLIDO,
Email = @EMAIL,
Celular = @CELULAR,
Dni = @DNI,
Direccion = @DIRECCION,
Contrasena = @CONTRASENA,
Tipo_Usuario = @TIPOUSUARIO
WHERE IdCliente = @IDCLIENTE
GO

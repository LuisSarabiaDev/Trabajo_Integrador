USE [master]
GO
/****** Object:  Database [ProyectoProg3]    Script Date: 01/11/2021 2:45:32 ******/
CREATE DATABASE [ProyectoProg3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProyectoProg3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoProg3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProyectoProg3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProyectoProg3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProyectoProg3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProyectoProg3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProyectoProg3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProyectoProg3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProyectoProg3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProyectoProg3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProyectoProg3] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProyectoProg3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ProyectoProg3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProyectoProg3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProyectoProg3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProyectoProg3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProyectoProg3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProyectoProg3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProyectoProg3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProyectoProg3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProyectoProg3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ProyectoProg3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProyectoProg3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProyectoProg3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProyectoProg3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProyectoProg3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProyectoProg3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProyectoProg3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProyectoProg3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProyectoProg3] SET  MULTI_USER 
GO
ALTER DATABASE [ProyectoProg3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProyectoProg3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProyectoProg3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProyectoProg3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProyectoProg3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProyectoProg3] SET QUERY_STORE = OFF
GO
USE [ProyectoProg3]
GO
/****** Object:  Table [dbo].[Articulos]    Script Date: 01/11/2021 2:45:32 ******/
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
/****** Object:  Table [dbo].[Categorias]    Script Date: 01/11/2021 2:45:32 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 01/11/2021 2:45:32 ******/
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
/****** Object:  StoredProcedure [dbo].[spAgregarArticulo]    Script Date: 01/11/2021 2:45:32 ******/
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
/****** Object:  StoredProcedure [dbo].[spAgregarCategoria]    Script Date: 01/11/2021 2:45:32 ******/
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
/****** Object:  StoredProcedure [dbo].[spBuscarArticulo]    Script Date: 01/11/2021 2:45:32 ******/
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
/****** Object:  StoredProcedure [dbo].[spBuscarCategoria]    Script Date: 01/11/2021 2:45:32 ******/
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
/****** Object:  StoredProcedure [dbo].[spEliminarArticulo]    Script Date: 01/11/2021 2:45:32 ******/
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
/****** Object:  StoredProcedure [dbo].[spEliminarCategoria]    Script Date: 01/11/2021 2:45:32 ******/
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
USE [master]
GO
ALTER DATABASE [ProyectoProg3] SET  READ_WRITE 
GO

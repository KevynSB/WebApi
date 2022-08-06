USE [master]
GO
/****** Object:  Database [prueba]    Script Date: 5/08/2022 14:28:02 ******/
CREATE DATABASE [prueba]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prueba', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\prueba.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prueba_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\prueba_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [prueba] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prueba].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prueba] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prueba] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prueba] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prueba] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prueba] SET ARITHABORT OFF 
GO
ALTER DATABASE [prueba] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [prueba] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prueba] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prueba] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prueba] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prueba] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prueba] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prueba] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prueba] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prueba] SET  ENABLE_BROKER 
GO
ALTER DATABASE [prueba] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prueba] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prueba] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prueba] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prueba] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prueba] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prueba] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prueba] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [prueba] SET  MULTI_USER 
GO
ALTER DATABASE [prueba] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prueba] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prueba] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prueba] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prueba] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prueba] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [prueba] SET QUERY_STORE = OFF
GO
USE [prueba]
GO
/****** Object:  Table [dbo].[encuesta]    Script Date: 5/08/2022 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[encuesta](
	[idencueta] [int] IDENTITY(1,1) NOT NULL,
	[NommbreEncuesta] [varchar](50) NULL,
	[DescripcionEncuesta] [varchar](200) NULL,
	[requerido] [tinyint] NULL,
	[idtipo] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo]    Script Date: 5/08/2022 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo](
	[idtipo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[encuesta] ON 
GO
INSERT [dbo].[encuesta] ([idencueta], [NommbreEncuesta], [DescripcionEncuesta], [requerido], [idtipo]) VALUES (1, N'nombre', N'nombre completo', 1, 1)
GO
INSERT [dbo].[encuesta] ([idencueta], [NommbreEncuesta], [DescripcionEncuesta], [requerido], [idtipo]) VALUES (2, N'apellido', N'apellido', 1, 1)
GO
INSERT [dbo].[encuesta] ([idencueta], [NommbreEncuesta], [DescripcionEncuesta], [requerido], [idtipo]) VALUES (3, N'edad', N'edad', 1, 3)
GO
INSERT [dbo].[encuesta] ([idencueta], [NommbreEncuesta], [DescripcionEncuesta], [requerido], [idtipo]) VALUES (4, N'nacimiento', N'nacimiento', 1, 2)
GO
SET IDENTITY_INSERT [dbo].[encuesta] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo] ON 
GO
INSERT [dbo].[tipo] ([idtipo], [Nombre]) VALUES (1, N'texto')
GO
INSERT [dbo].[tipo] ([idtipo], [Nombre]) VALUES (2, N'fecha')
GO
INSERT [dbo].[tipo] ([idtipo], [Nombre]) VALUES (3, N'numero')
GO
INSERT [dbo].[tipo] ([idtipo], [Nombre]) VALUES (4, N'bool')
GO
SET IDENTITY_INSERT [dbo].[tipo] OFF
GO
/****** Object:  StoredProcedure [dbo].[getlist]    Script Date: 5/08/2022 14:28:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getlist]( @operacion int = 1)
AS
	if @operacion = 1 
	begin 
		select * from [dbo].[encuesta] a
		inner join [dbo].[tipo] b
		on a.idtipo = b.idtipo 
	end
GO
USE [master]
GO
ALTER DATABASE [prueba] SET  READ_WRITE 
GO

USE [master]
GO
/****** Object:  Database [Dim_School_All_in_One]    Script Date: 16-12-2024 22:23:31 ******/
CREATE DATABASE [Dim_School_All_in_One]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Dim_School_All_in_One', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MULTIDIMENSIONAL\MSSQL\DATA\Dim_School_All_in_One.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Dim_School_All_in_One_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MULTIDIMENSIONAL\MSSQL\DATA\Dim_School_All_in_One_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Dim_School_All_in_One] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Dim_School_All_in_One].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Dim_School_All_in_One] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET ARITHABORT OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Dim_School_All_in_One] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Dim_School_All_in_One] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Dim_School_All_in_One] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Dim_School_All_in_One] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET RECOVERY FULL 
GO
ALTER DATABASE [Dim_School_All_in_One] SET  MULTI_USER 
GO
ALTER DATABASE [Dim_School_All_in_One] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Dim_School_All_in_One] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Dim_School_All_in_One] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Dim_School_All_in_One] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Dim_School_All_in_One] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Dim_School_All_in_One', N'ON'
GO
ALTER DATABASE [Dim_School_All_in_One] SET QUERY_STORE = OFF
GO
USE [Dim_School_All_in_One]
GO
/****** Object:  User [NT SERVICE\MSOLAP$MULTIDIMENSIONAL]    Script Date: 16-12-2024 22:23:31 ******/
CREATE USER [NT SERVICE\MSOLAP$MULTIDIMENSIONAL] FOR LOGIN [NT SERVICE\MSOLAP$MULTIDIMENSIONAL] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT SERVICE\MSOLAP$MULTIDIMENSIONAL]
GO
/****** Object:  Table [dbo].[dim_anotacion]    Script Date: 16-12-2024 22:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_anotacion](
	[id_anot_pks] [int] IDENTITY(1,1) NOT NULL,
	[id_anot] [int] NOT NULL,
	[nomb_anot] [varchar](400) NOT NULL,
	[tipo_anot] [varchar](100) NOT NULL,
	[fecha_carga] [date] NOT NULL,
 CONSTRAINT [PK_dim_anotacion] PRIMARY KEY CLUSTERED 
(
	[id_anot_pks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_curso]    Script Date: 16-12-2024 22:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_curso](
	[id_curso_pks] [int] IDENTITY(1,1) NOT NULL,
	[id_curso] [varchar](50) NOT NULL,
	[nomb_curso] [varchar](400) NOT NULL,
	[annio] [int] NOT NULL,
	[fecha_carga] [date] NOT NULL,
 CONSTRAINT [PK_dim_curso] PRIMARY KEY CLUSTERED 
(
	[id_curso_pks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_empleado]    Script Date: 16-12-2024 22:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_empleado](
	[id_empleado_pks] [int] IDENTITY(1,1) NOT NULL,
	[id_empleado] [int] NOT NULL,
	[rut_emp] [varchar](12) NOT NULL,
	[nomb_compl_emp] [varchar](600) NOT NULL,
	[nomb_cargo] [varchar](300) NOT NULL,
	[fecha_carga] [date] NOT NULL,
 CONSTRAINT [PK_dim_empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado_pks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_estudiante]    Script Date: 16-12-2024 22:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_estudiante](
	[id_estudiante_pks] [int] IDENTITY(1,1) NOT NULL,
	[id_estudiante] [int] NOT NULL,
	[rut_estu] [varchar](12) NOT NULL,
	[nomb_compl_estu] [varchar](600) NOT NULL,
	[estado_estu] [varchar](200) NOT NULL,
	[fecha_carga] [date] NOT NULL,
 CONSTRAINT [PK_dim_estudiante] PRIMARY KEY CLUSTERED 
(
	[id_estudiante_pks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_sucursal]    Script Date: 16-12-2024 22:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_sucursal](
	[id_sucursal_pks] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal] [int] NOT NULL,
	[nomb_sucursal] [varchar](200) NOT NULL,
	[nomb_comuna] [varchar](100) NOT NULL,
	[nomb_region] [varchar](100) NOT NULL,
	[fecha_carga] [date] NOT NULL,
 CONSTRAINT [PK_dim_sucursal] PRIMARY KEY CLUSTERED 
(
	[id_sucursal_pks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_tiempo]    Script Date: 16-12-2024 22:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_tiempo](
	[id_tiempo_pks] [int] NOT NULL,
	[mes] [int] NOT NULL,
	[trimestre] [int] NOT NULL,
	[semestre] [int] NOT NULL,
	[annio] [int] NOT NULL,
	[nomb_mes] [varchar](100) NOT NULL,
 CONSTRAINT [PK_dim_tiempo] PRIMARY KEY CLUSTERED 
(
	[id_tiempo_pks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hecho_alumno]    Script Date: 16-12-2024 22:23:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hecho_alumno](
	[id_alumno_pks] [int] IDENTITY(1,1) NOT NULL,
	[id_sucursal_pks] [int] NOT NULL,
	[id_curso_pks] [int] NOT NULL,
	[id_empleado_pks] [int] NOT NULL,
	[id_estudiante_pks] [int] NOT NULL,
	[id_tiempo_pks] [int] NOT NULL,
	[id_anot_pks] [int] NOT NULL,
	[fecha_carga] [date] NOT NULL,
 CONSTRAINT [PK_hecho_alumno] PRIMARY KEY CLUSTERED 
(
	[id_alumno_pks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[hecho_alumno]  WITH CHECK ADD  CONSTRAINT [FK_hecho_alum_anotacion] FOREIGN KEY([id_anot_pks])
REFERENCES [dbo].[dim_anotacion] ([id_anot_pks])
GO
ALTER TABLE [dbo].[hecho_alumno] CHECK CONSTRAINT [FK_hecho_alum_anotacion]
GO
ALTER TABLE [dbo].[hecho_alumno]  WITH CHECK ADD  CONSTRAINT [FK_hecho_alum_curso] FOREIGN KEY([id_curso_pks])
REFERENCES [dbo].[dim_curso] ([id_curso_pks])
GO
ALTER TABLE [dbo].[hecho_alumno] CHECK CONSTRAINT [FK_hecho_alum_curso]
GO
ALTER TABLE [dbo].[hecho_alumno]  WITH CHECK ADD  CONSTRAINT [FK_hecho_alum_empleado] FOREIGN KEY([id_empleado_pks])
REFERENCES [dbo].[dim_empleado] ([id_empleado_pks])
GO
ALTER TABLE [dbo].[hecho_alumno] CHECK CONSTRAINT [FK_hecho_alum_empleado]
GO
ALTER TABLE [dbo].[hecho_alumno]  WITH CHECK ADD  CONSTRAINT [FK_hecho_alum_estudiante] FOREIGN KEY([id_estudiante_pks])
REFERENCES [dbo].[dim_estudiante] ([id_estudiante_pks])
GO
ALTER TABLE [dbo].[hecho_alumno] CHECK CONSTRAINT [FK_hecho_alum_estudiante]
GO
ALTER TABLE [dbo].[hecho_alumno]  WITH CHECK ADD  CONSTRAINT [FK_hecho_alum_sucursal] FOREIGN KEY([id_sucursal_pks])
REFERENCES [dbo].[dim_sucursal] ([id_sucursal_pks])
GO
ALTER TABLE [dbo].[hecho_alumno] CHECK CONSTRAINT [FK_hecho_alum_sucursal]
GO
ALTER TABLE [dbo].[hecho_alumno]  WITH CHECK ADD  CONSTRAINT [FK_hecho_alum_tiempo] FOREIGN KEY([id_tiempo_pks])
REFERENCES [dbo].[dim_tiempo] ([id_tiempo_pks])
GO
ALTER TABLE [dbo].[hecho_alumno] CHECK CONSTRAINT [FK_hecho_alum_tiempo]
GO
USE [master]
GO
ALTER DATABASE [Dim_School_All_in_One] SET  READ_WRITE 
GO

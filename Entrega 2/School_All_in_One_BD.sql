USE [master]
GO
/****** Object:  Database [School_All_in_One]    Script Date: 15/10/2024 16:11:52 ******/
CREATE DATABASE [School_All_in_One]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School_All_in_One', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\School_All_in_One.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'School_All_in_One_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\School_All_in_One_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [School_All_in_One] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School_All_in_One].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School_All_in_One] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [School_All_in_One] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [School_All_in_One] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [School_All_in_One] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [School_All_in_One] SET ARITHABORT OFF 
GO
ALTER DATABASE [School_All_in_One] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [School_All_in_One] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [School_All_in_One] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [School_All_in_One] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [School_All_in_One] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [School_All_in_One] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [School_All_in_One] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [School_All_in_One] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [School_All_in_One] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [School_All_in_One] SET  DISABLE_BROKER 
GO
ALTER DATABASE [School_All_in_One] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [School_All_in_One] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [School_All_in_One] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [School_All_in_One] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [School_All_in_One] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [School_All_in_One] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [School_All_in_One] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [School_All_in_One] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [School_All_in_One] SET  MULTI_USER 
GO
ALTER DATABASE [School_All_in_One] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [School_All_in_One] SET DB_CHAINING OFF 
GO
ALTER DATABASE [School_All_in_One] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [School_All_in_One] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [School_All_in_One] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [School_All_in_One] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [School_All_in_One] SET QUERY_STORE = ON
GO
ALTER DATABASE [School_All_in_One] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [School_All_in_One]
GO
/****** Object:  Table [dbo].[alumno]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alumno](
	[id_alum] [varchar](50) NOT NULL,
	[rut_alum] [varchar](25) NOT NULL,
	[nomb_alum] [varchar](100) NOT NULL,
	[apell_paterno_alum] [varchar](100) NOT NULL,
	[apell_materno_alum] [varchar](100) NOT NULL,
	[edad_alum] [int] NOT NULL,
	[correo_alum] [varchar](100) NOT NULL,
	[password_alum] [varchar](10) NOT NULL,
	[id_curso] [varchar](50) NOT NULL,
	[id_estado] [varchar](50) NOT NULL,
	[id_apo] [varchar](50) NOT NULL,
 CONSTRAINT [pk_alumno] PRIMARY KEY CLUSTERED 
(
	[id_alum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[anotacion]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anotacion](
	[id_anotacion] [varchar](50) NOT NULL,
	[desc_anotacion] [varchar](200) NOT NULL,
	[id_alum] [varchar](50) NOT NULL,
	[id_tipo_anotacion] [varchar](50) NOT NULL,
 CONSTRAINT [pk_anotacion] PRIMARY KEY CLUSTERED 
(
	[id_anotacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[apoderado]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[apoderado](
	[id_apo] [varchar](50) NOT NULL,
	[rut_apo] [varchar](25) NOT NULL,
	[nomb_apo] [varchar](100) NOT NULL,
	[apell_paterno_apo] [varchar](100) NOT NULL,
	[apell_materno_apo] [varchar](100) NOT NULL,
	[edad_apo] [int] NOT NULL,
	[correo_apo] [varchar](100) NOT NULL,
	[password_apo] [varchar](10) NOT NULL,
 CONSTRAINT [pk_apoderado] PRIMARY KEY CLUSTERED 
(
	[id_apo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[asignatura]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asignatura](
	[id_asignatura] [varchar](50) NOT NULL,
	[nomb_asignatura] [varchar](100) NOT NULL,
	[nota_1] [decimal](2, 1) NOT NULL,
	[nota_2] [decimal](2, 1) NOT NULL,
	[nota_3] [decimal](2, 1) NOT NULL,
	[nota_4] [decimal](2, 1) NOT NULL,
	[nota_5] [decimal](2, 1) NOT NULL,
	[nota_6] [decimal](2, 1) NOT NULL,
	[nota_semestral] [decimal](2, 1) NOT NULL,
	[nota_trimestral] [decimal](2, 1) NOT NULL,
	[nota_examen] [decimal](2, 1) NOT NULL,
	[nota_final] [decimal](2, 1) NOT NULL,
	[id_tipo_asignatura] [varchar](50) NOT NULL,
 CONSTRAINT [pk_asignatura] PRIMARY KEY CLUSTERED 
(
	[id_asignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clase]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clase](
	[id_clase] [varchar](50) NOT NULL,
	[asistencia] [varchar](50) NOT NULL,
	[id_curso] [varchar](50) NOT NULL,
	[id_asignatura] [varchar](50) NOT NULL,
 CONSTRAINT [pk_clase] PRIMARY KEY CLUSTERED 
(
	[id_clase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comuna]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comuna](
	[id_comuna] [varchar](50) NOT NULL,
	[desc_comuna] [varchar](200) NOT NULL,
	[id_region] [varchar](50) NOT NULL,
 CONSTRAINT [pk_comuna] PRIMARY KEY CLUSTERED 
(
	[id_comuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[curso]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[curso](
	[id_curso] [varchar](50) NOT NULL,
	[nomb_curso] [varchar](50) NOT NULL,
	[prom_nota] [decimal](2, 1) NOT NULL,
	[prom_asistencia] [varchar](10) NOT NULL,
	[id_sucursal] [varchar](50) NOT NULL,
	[id_doce] [varchar](50) NOT NULL,
 CONSTRAINT [pk_curso] PRIMARY KEY CLUSTERED 
(
	[id_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[director]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[director](
	[id_dire] [varchar](50) NOT NULL,
	[rut_dire] [varchar](25) NOT NULL,
	[nomb_dire] [varchar](100) NOT NULL,
	[apell_paterno_dire] [varchar](100) NOT NULL,
	[apell_materno_dire] [varchar](100) NOT NULL,
	[edad_dire] [int] NOT NULL,
	[correo_dire] [varchar](100) NOT NULL,
	[password_dire] [varchar](10) NOT NULL,
 CONSTRAINT [pk_director] PRIMARY KEY CLUSTERED 
(
	[id_dire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[docente]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[docente](
	[id_doce] [varchar](50) NOT NULL,
	[rut_doce] [varchar](25) NOT NULL,
	[nomb_doce] [varchar](100) NOT NULL,
	[apell_paterno_doce] [varchar](100) NOT NULL,
	[apell_materno_doce] [varchar](100) NOT NULL,
	[edad_doce] [int] NOT NULL,
	[correo_doce] [varchar](100) NOT NULL,
	[password_doce] [varchar](10) NOT NULL,
 CONSTRAINT [pk_docente] PRIMARY KEY CLUSTERED 
(
	[id_doce] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado](
	[id_estado] [varchar](50) NOT NULL,
	[desc_estado] [varchar](200) NOT NULL,
 CONSTRAINT [pk_estado] PRIMARY KEY CLUSTERED 
(
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[institucion]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[institucion](
	[id_institucion] [varchar](50) NOT NULL,
	[nomb_institucion] [varchar](200) NOT NULL,
 CONSTRAINT [pk_institucion] PRIMARY KEY CLUSTERED 
(
	[id_institucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[region](
	[id_region] [varchar](50) NOT NULL,
	[desc_region] [varchar](200) NOT NULL,
 CONSTRAINT [pk_region] PRIMARY KEY CLUSTERED 
(
	[id_region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursal](
	[id_sucursal] [varchar](50) NOT NULL,
	[nomb_sucursal] [varchar](200) NOT NULL,
	[id_institucion] [varchar](50) NOT NULL,
	[id_comuna] [varchar](50) NOT NULL,
 CONSTRAINT [pk_sucursal] PRIMARY KEY CLUSTERED 
(
	[id_sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_anotacion]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_anotacion](
	[id_tipo_anotacion] [varchar](50) NOT NULL,
	[desc_tipo_anotacion] [varchar](200) NOT NULL,
 CONSTRAINT [pk_tipo_anotacion] PRIMARY KEY CLUSTERED 
(
	[id_tipo_anotacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_asignatura]    Script Date: 15/10/2024 16:11:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_asignatura](
	[id_tipo_asignatura] [varchar](50) NOT NULL,
	[desc_tipo_asignatura] [varchar](200) NOT NULL,
 CONSTRAINT [pk_tipo_asignatura] PRIMARY KEY CLUSTERED 
(
	[id_tipo_asignatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[alumno]  WITH CHECK ADD  CONSTRAINT [fk_apoderado] FOREIGN KEY([id_apo])
REFERENCES [dbo].[apoderado] ([id_apo])
GO
ALTER TABLE [dbo].[alumno] CHECK CONSTRAINT [fk_apoderado]
GO
ALTER TABLE [dbo].[alumno]  WITH CHECK ADD  CONSTRAINT [fk_curso_2] FOREIGN KEY([id_curso])
REFERENCES [dbo].[curso] ([id_curso])
GO
ALTER TABLE [dbo].[alumno] CHECK CONSTRAINT [fk_curso_2]
GO
ALTER TABLE [dbo].[alumno]  WITH CHECK ADD  CONSTRAINT [fk_estado] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id_estado])
GO
ALTER TABLE [dbo].[alumno] CHECK CONSTRAINT [fk_estado]
GO
ALTER TABLE [dbo].[anotacion]  WITH CHECK ADD  CONSTRAINT [fk_curso_3] FOREIGN KEY([id_alum])
REFERENCES [dbo].[alumno] ([id_alum])
GO
ALTER TABLE [dbo].[anotacion] CHECK CONSTRAINT [fk_curso_3]
GO
ALTER TABLE [dbo].[anotacion]  WITH CHECK ADD  CONSTRAINT [fk_tipo_anotacion] FOREIGN KEY([id_tipo_anotacion])
REFERENCES [dbo].[tipo_anotacion] ([id_tipo_anotacion])
GO
ALTER TABLE [dbo].[anotacion] CHECK CONSTRAINT [fk_tipo_anotacion]
GO
ALTER TABLE [dbo].[asignatura]  WITH CHECK ADD  CONSTRAINT [fk_tipo_asignatura] FOREIGN KEY([id_tipo_asignatura])
REFERENCES [dbo].[tipo_asignatura] ([id_tipo_asignatura])
GO
ALTER TABLE [dbo].[asignatura] CHECK CONSTRAINT [fk_tipo_asignatura]
GO
ALTER TABLE [dbo].[clase]  WITH CHECK ADD  CONSTRAINT [fk_asignatura] FOREIGN KEY([id_asignatura])
REFERENCES [dbo].[asignatura] ([id_asignatura])
GO
ALTER TABLE [dbo].[clase] CHECK CONSTRAINT [fk_asignatura]
GO
ALTER TABLE [dbo].[clase]  WITH CHECK ADD  CONSTRAINT [fk_curso] FOREIGN KEY([id_curso])
REFERENCES [dbo].[curso] ([id_curso])
GO
ALTER TABLE [dbo].[clase] CHECK CONSTRAINT [fk_curso]
GO
ALTER TABLE [dbo].[comuna]  WITH CHECK ADD  CONSTRAINT [fk_region] FOREIGN KEY([id_region])
REFERENCES [dbo].[region] ([id_region])
GO
ALTER TABLE [dbo].[comuna] CHECK CONSTRAINT [fk_region]
GO
ALTER TABLE [dbo].[curso]  WITH CHECK ADD  CONSTRAINT [fk_docente] FOREIGN KEY([id_doce])
REFERENCES [dbo].[docente] ([id_doce])
GO
ALTER TABLE [dbo].[curso] CHECK CONSTRAINT [fk_docente]
GO
ALTER TABLE [dbo].[curso]  WITH CHECK ADD  CONSTRAINT [fk_sucursal] FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id_sucursal])
GO
ALTER TABLE [dbo].[curso] CHECK CONSTRAINT [fk_sucursal]
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD  CONSTRAINT [fk_comuna] FOREIGN KEY([id_comuna])
REFERENCES [dbo].[comuna] ([id_comuna])
GO
ALTER TABLE [dbo].[sucursal] CHECK CONSTRAINT [fk_comuna]
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD  CONSTRAINT [fk_institucion] FOREIGN KEY([id_institucion])
REFERENCES [dbo].[institucion] ([id_institucion])
GO
ALTER TABLE [dbo].[sucursal] CHECK CONSTRAINT [fk_institucion]
GO
USE [master]
GO
ALTER DATABASE [School_All_in_One] SET  READ_WRITE 
GO

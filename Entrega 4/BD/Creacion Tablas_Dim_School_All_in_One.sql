USE Dim_School_All_in_One

DROP TABLE hecho_alumno
DROP TABLE dim_sucursal
DROP TABLE dim_empleado
DROP TABLE dim_curso
DROP TABLE dim_estudiante
DROP TABLE dim_anotacion
DROP TABLE dim_tiempo

create table Dim_School_All_in_One.dbo.dim_sucursal 
(
	id_sucursal_pks INT IDENTITY(1,1) NOT NULL,
	id_sucursal INT NOT NULL,
	nomb_sucursal VARCHAR(200) NOT NULL,
	nomb_comuna VARCHAR(100) NOT NULL,
	nomb_region VARCHAR(100) NOT NULL,
	fecha_carga DATE NOT NULL,
	CONSTRAINT PK_dim_sucursal PRIMARY KEY (id_sucursal_pks)
)

create table Dim_School_All_in_One.dbo.dim_empleado 
(
	id_empleado_pks INT IDENTITY(1,1) NOT NULL,
	id_empleado INT NOT NULL,
	rut_emp VARCHAR(12) NOT NULL,
	nomb_compl_emp VARCHAR(600) NOT NULL,
	nomb_cargo VARCHAR(300) NOT NULL,
	fecha_carga DATE NOT NULL,
	CONSTRAINT PK_dim_empleado PRIMARY KEY (id_empleado_pks)
)

create table Dim_School_All_in_One.dbo.dim_curso 
(
	id_curso_pks INT IDENTITY(1,1) NOT NULL,
	id_curso VARCHAR(50) NOT NULL,
	nomb_curso VARCHAR(400) NOT NULL,
	annio INT NOT NULL,
	fecha_carga DATE NOT NULL,
	CONSTRAINT PK_dim_curso PRIMARY KEY (id_curso_pks)
)

create table Dim_School_All_in_One.dbo.dim_estudiante 
(
	id_estudiante_pks INT IDENTITY(1,1) NOT NULL,
	id_estudiante INT NOT NULL,
	rut_estu VARCHAR(12) NOT NULL,
	nomb_compl_estu VARCHAR(600) NOT NULL,
	estado_estu VARCHAR(200) NOT NULL,
	fecha_carga DATE NOT NULL,
	CONSTRAINT PK_dim_estudiante PRIMARY KEY (id_estudiante_pks)
)

create table Dim_School_All_in_One.dbo.dim_anotacion 
(
	id_anot_pks INT IDENTITY(1,1) NOT NULL,
	id_anot INT NOT NULL,
	nomb_anot VARCHAR(400) NOT NULL,
	tipo_anot VARCHAR(100) NOT NULL,
	fecha_carga DATE NOT NULL,
	CONSTRAINT PK_dim_anotacion PRIMARY KEY (id_anot_pks)
)

create table Dim_School_All_in_One.dbo.dim_tiempo 
(
	id_tiempo_pks INT NOT NULL,
	mes INT NOT NULL,
	trimestre INT NOT NULL,
	semestre INT NOT NULL,
	annio INT NOT NULL,
	nomb_mes VARCHAR(100) NOT NULL
	CONSTRAINT PK_dim_tiempo PRIMARY KEY (id_tiempo_pks)
)

create table Dim_School_All_in_One.dbo.hecho_alumno 
(
	id_alumno_pks INT IDENTITY(1,1) NOT NULL,
	id_sucursal_pks INT NOT NULL,
	id_curso_pks INT NOT NULL,
	id_empleado_pks INT NOT NULL,
	id_estudiante_pks INT NOT NULL,
	id_tiempo_pks INT NOT NULL,
	id_anot_pks INT NOT NULL,
	fecha_carga DATE NOT NULL,
	CONSTRAINT PK_hecho_alumno PRIMARY KEY (id_alumno_pks),
	CONSTRAINT FK_hecho_alum_sucursal FOREIGN KEY(id_sucursal_pks) REFERENCES dim_sucursal (id_sucursal_pks),
	CONSTRAINT FK_hecho_alum_curso FOREIGN KEY(id_curso_pks) REFERENCES dim_curso (id_curso_pks),
	CONSTRAINT FK_hecho_alum_empleado FOREIGN KEY(id_empleado_pks) REFERENCES dim_empleado (id_empleado_pks),
	CONSTRAINT FK_hecho_alum_estudiante FOREIGN KEY(id_estudiante_pks) REFERENCES dim_estudiante (id_estudiante_pks),
	CONSTRAINT FK_hecho_alum_tiempo FOREIGN KEY(id_tiempo_pks) REFERENCES dim_tiempo (id_tiempo_pks),
	CONSTRAINT FK_hecho_alum_anotacion FOREIGN KEY(id_anot_pks) REFERENCES dim_anotacion (id_anot_pks)
)
	
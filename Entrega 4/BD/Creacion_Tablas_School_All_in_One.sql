USE School_All_in_One

drop table School_All_in_One..calificacion
drop table School_All_in_One..asistencia
drop table School_All_in_One..anotacion
drop table School_All_in_One..alumno
drop table School_All_in_One..curso
drop table School_All_in_One..asignatura_docente
drop table School_All_in_One..asignatura
drop table School_All_in_One..director
drop table School_All_in_One..sucursal
drop table School_All_in_One..docente
drop table School_All_in_One..comuna
drop table School_All_in_One..apoderado
drop table School_All_in_One..tipo_docente
drop table School_All_in_One..tipo_asignatura
drop table School_All_in_One..tipo_anotacion
drop table School_All_in_One..estado_asignatura
drop table School_All_in_One..estado_alumno
drop table School_All_in_One..institucion
drop table School_All_in_One..region


-- Tablas de Traduccion
create table School_All_in_One..region
(
	id_region varchar(50) not null,
	desc_region varchar(200) not null,
	constraint pk_region primary key (id_region)
)

create table School_All_in_One..institucion
(
	id_inst varchar(50) not null,
	nomb_inst varchar(200) not null,
	constraint pk_institucion primary key (id_inst)
)

create table School_All_in_One..estado_alumno
(
	id_estado_alum varchar(50) not null,
	desc_estado_alum varchar(200) not null,
	constraint pk_estado_alumno primary key (id_estado_alum)
)

create table School_All_in_One..estado_asignatura
(
	id_estado_asig varchar(50) not null,
	desc_estado_asig varchar(200) not null,
	constraint pk_estado_asignatura primary key (id_estado_asig)
)

create table School_All_in_One..tipo_anotacion
(
	id_tipo_anot varchar(50) not null,
	desc_tipo_anot varchar(200) not null,
	constraint pk_tipo_anotacion primary key (id_tipo_anot)
)

create table School_All_in_One..tipo_asignatura
(
	id_tipo_asig varchar(50) not null,
	desc_tipo_asig varchar(200) not null,
	constraint pk_tipo_asignatura primary key (id_tipo_asig)
)

create table School_All_in_One..tipo_docente
(
	id_tipo_doce varchar(50) not null,
	desc_tipo_doce varchar(200) not null,
	constraint pk_tipo_docente primary key (id_tipo_doce)
)

create table School_All_in_One..apoderado
(
	id_apo varchar(50) not null,
	rut_apo varchar(25) not null,
	nomb_apo varchar(100) not null,
	apell_paterno_apo varchar(100) not null,
	apell_materno_apo varchar(100) not null,
	edad_apo integer not null,
	correo_apo varchar(100) not null,
	password_apo varchar(10) not null,
	constraint pk_apoderado primary key (id_apo)
)


-- Tablas con foreing key
create table School_All_in_One..comuna
(
	id_comuna varchar(50) not null,
	desc_comuna varchar(200) not null,
	id_region varchar(50) not null,
	constraint pk_comuna primary key (id_comuna),
	constraint fk_region foreign key (id_region) references region (id_region)
)

create table School_All_in_One..docente
(
	id_doce varchar(50) not null,
	rut_doce varchar(25) not null,
	nomb_doce varchar(100) not null,
	apell_paterno_doce varchar(100) not null,
	apell_materno_doce varchar(100) not null,
	edad_doce integer not null,
	correo_doce varchar(100) not null,
	password_doce varchar(10) not null,
	id_tipo_doce varchar(50) not null,
	constraint pk_docente primary key (id_doce),
	constraint fk_tipo_docente foreign key (id_tipo_doce) references tipo_docente (id_tipo_doce)
)

create table School_All_in_One..sucursal
(
	id_sucursal varchar(50) not null,
	nomb_sucursal varchar(200) not null,
	id_inst varchar(50) not null,
	id_comuna varchar(50) not null,
	constraint pk_sucursal primary key (id_sucursal),
	constraint fk_institucion foreign key (id_inst) references institucion (id_inst),
	constraint fk_comuna foreign key (id_comuna) references comuna (id_comuna)
)

create table School_All_in_One..director
(
	id_dire varchar(50) not null,
	rut_dire varchar(25) not null,
	nomb_dire varchar(100) not null,
	apell_paterno_dire varchar(100) not null,
	apell_materno_dire varchar(100) not null,
	edad_dire integer not null,
	correo_dire varchar(100) not null,
	password_dire varchar(10) not null,
	id_sucursal varchar(50) not null,
	constraint pk_director primary key (id_dire),
	constraint fk_director_sucursal foreign key (id_sucursal) references sucursal (id_sucursal)
)

create table School_All_in_One..asignatura
(
	id_asig varchar(50) not null,
	nomb_asig varchar(100) not null,
	id_tipo_asig varchar(50) not null,
	id_estado_asig varchar(50) not null,
	constraint pk_asignatura primary key (id_asig),
	constraint fk_tipo_asignatura foreign key (id_tipo_asig) references tipo_asignatura (id_tipo_asig),
	constraint fk_estado_asignatura foreign key (id_estado_asig) references estado_asignatura (id_estado_asig)
)

create table School_All_in_One..asignatura_docente
(
	id_asig_doce varchar(50) not null,
	id_asig varchar(50) not null,
	id_doce varchar(50) not null,
	constraint pk_asig_doce primary key (id_asig_doce),
	constraint fk_asig_doce_asig foreign key (id_asig) references asignatura (id_asig),
	constraint fk_asig_doce_docente foreign key (id_doce) references docente (id_doce)
)

create table School_All_in_One..curso
(
	id_curso varchar(50) not null,
	nomb_curso varchar(50) not null,
	estado varchar(50) not null,
	anio varchar(10) not null,
	id_sucursal varchar(50) not null,
	constraint pk_curso primary key (id_curso),
	constraint fk_curso_sucursal foreign key (id_sucursal) references sucursal (id_sucursal)
)

create table School_All_in_One..alumno
(
	id_alum varchar(50) not null,
	rut_alum varchar(25) not null,
	nomb_alum varchar(100) not null,
	apell_paterno_alum varchar(100) not null,
	apell_materno_alum varchar(100) not null,
	edad_alum integer not null,
	correo_alum varchar(100) not null,
	password_alum varchar(10) not null,
	id_curso varchar(50) not null,
	id_estado_alum varchar(50) not null,
	id_apo varchar(50) not null,
	constraint pk_alumno primary key (id_alum),
	constraint fk_curso foreign key (id_curso) references curso (id_curso),
	constraint fk_estado_alumno foreign key (id_estado_alum) references estado_alumno (id_estado_alum),
	constraint fk_apoderado foreign key (id_apo) references apoderado (id_apo),
)

create table School_All_in_One..anotacion
(
	id_anot varchar(50) not null,
	desc_anot varchar(200) not null,
	asunto varchar(200) not null,
	id_alum varchar(50) not null,
	id_tipo_anot varchar(50) not null,
	constraint pk_anotacion primary key (id_anot),
	constraint fk_alumno foreign key (id_alum) references alumno (id_alum),
	constraint fk_tipo_anotacion foreign key (id_tipo_anot) references tipo_anotacion (id_tipo_anot)
)

create table School_All_in_One..asistencia
(
	id_asistencia varchar(50) not null,
	asistencia char(1) not null,
	hora_inicio varchar(50) not null,
	hora_fin varchar(50) not null,
	fecha date not null,
	id_alum varchar(50) not null,
	id_asig varchar(50) not null,
	constraint pk_asistencia primary key (id_asistencia),
	constraint fk_asist_alum foreign key (id_alum) references alumno (id_alum),
	constraint fk_asig_asistencia foreign key (id_asig) references asignatura (id_asig)
)

create table School_All_in_One..calificacion
(
	id_califi varchar(50) not null,
	nota_1 decimal(2,1) not null,
	nota_2 decimal(2,1) not null,
	nota_3 decimal(2,1) not null,
	nota_4 decimal(2,1) not null,
	nota_5 decimal(2,1) not null,
	nota_6 decimal(2,1) not null,
	nota_present decimal(2,1) not null,
	nota_examen decimal(2,1) not null,
	nota_final decimal(2,1) not null,
	id_alum varchar(50) not null,
	id_asig varchar(50) not null,
	constraint pk_calificacion primary key (id_califi),
	constraint fk_califi_alum foreign key (id_alum) references alumno (id_alum),
	constraint fk_asig_califi foreign key (id_asig) references asignatura (id_asig)
)






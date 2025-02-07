USE concrete_jungle;

-- Tabla de Usuarios
CREATE TABLE USUARIO (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombres VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE, -- Documento de identidad
    correo VARCHAR(150) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL -- Se almacenará cifrada
);

-- Tabla de Mascotas
CREATE TABLE MASCOTAS (
    id_mascota INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT NOT NULL,
    nombreMascota VARCHAR(50) NOT NULL,
    tipoDeMascota ENUM("perro", "gato", "ave") NOT NULL,
    dniMascota VARCHAR(20) NOT NULL UNIQUE, -- Identificación de la mascota
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(id_usuario) ON DELETE CASCADE
);


-- Tabla de Doctores
CREATE TABLE DOCTORES (
    id_doctor INT PRIMARY KEY AUTO_INCREMENT,
    nombreDoctor VARCHAR(50) NOT NULL,
    apellidoDoctor VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    telefonoDoctor VARCHAR(15) NOT NULL
);

-- Tabla de Citas
CREATE TABLE CITAS (
    id_cita INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT NOT NULL,
    idMascota INT NOT NULL,
    idDoctor INT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    estado ENUM("pendiente", "completada", "cancelada") DEFAULT "pendiente",
    FOREIGN KEY (idUsuario) REFERENCES USUARIO(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (idMascota) REFERENCES MASCOTAS(id_mascota) ON DELETE CASCADE,
    FOREIGN KEY (idDoctor) REFERENCES DOCTORES(id_doctor) ON DELETE CASCADE
);

-- Tabla de Recetas Médicas
CREATE TABLE RECETAS_MEDICAS (
    id_receta INT PRIMARY KEY AUTO_INCREMENT,
    id_cita INT NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_emision DATE NOT NULL,
    FOREIGN KEY (id_cita) REFERENCES CITAS(id_cita) ON DELETE CASCADE
);

-- Tabla de Resultados Médicos
CREATE TABLE RESULTADOS_MEDICOS (
    id_resultado INT PRIMARY KEY AUTO_INCREMENT,
    id_cita INT NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_emision DATE NOT NULL,
    FOREIGN KEY (id_cita) REFERENCES CITAS(id_cita) ON DELETE CASCADE
);

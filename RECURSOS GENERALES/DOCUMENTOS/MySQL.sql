-- Active: 1738881322720@@127.0.0.1@3306@concrete_jungle

-- Tabla para dueños de mascotas
CREATE TABLE Dueño (
    idDueño INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    direccion VARCHAR(255),
    fechaRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para mascotas
CREATE TABLE Mascota (
    idMascota INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raza VARCHAR(50),
    edad INT,
    idDueño INT,
    documentacion TEXT,
    FOREIGN KEY (idDueño) REFERENCES Dueño(idDueño) ON DELETE CASCADE
);

-- Tabla para cuidadores
CREATE TABLE Cuidador (
    idCuidador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100),
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    fechaIngreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para citas
CREATE TABLE Cita (
    idCita INT AUTO_INCREMENT PRIMARY KEY,
    fechaCita DATE NOT NULL,
    horaCita TIME NOT NULL,
    idMascota INT,
    idCuidador INT,
    descripcion TEXT,
    estado VARCHAR(50)  DEFAULT 'Pendiente',
    FOREIGN KEY (idMascota) REFERENCES Mascota(idMascota) ON DELETE CASCADE,
    FOREIGN KEY (idCuidador) REFERENCES Cuidador(idCuidador) ON DELETE CASCADE
);

-- Insertar datos de ejemplo
INSERT INTO Dueño (nombre, correo, telefono, direccion) 
VALUES 
('Juan Pérez', 'juan.perez@example.com', '123456789', 'Calle Falsa 123'),
('María Gómez', 'maria.gomez@example.com', '987654321', 'Avenida Siempreviva 456');

INSERT INTO Mascota (nombre, especie, raza, edad, idDueño, documentacion) 
VALUES 
('Bobby', 'Perro', 'Golden Retriever', 3, 1, 'Vacunas al día, sin alergias'),
('Mimi', 'Gato', 'Siames', 2, 2, 'Vacunas al día, alergia al pescado');

INSERT INTO Cuidador (nombre, especialidad, correo, telefono) 
VALUES 
('Ana Torres', 'Veterinaria especializada en perros', 'ana.torres@example.com', '111222333'),
('Carlos López', 'Veterinario especializado en gatos', 'carlos.lopez@example.com', '444555666');

INSERT INTO Cita (fechaCita, horaCita, idMascota, idCuidador, descripcion, estado) 
VALUES 
('2024-11-15', '10:30:00', 1, 1, 'Chequeo general y vacunas', 'Pendiente'),
('2024-11-16', '14:00:00', 2, 2, 'Revisión por problema de piel', 'Pendiente');

CREATE TABLE Cuentas (
    id INT PRIMARY KEY IDENTITY,
    descripcion VARCHAR(255)
);

-- Creación de la tabla MovimientosContables
CREATE TABLE MovimientosContables (
    id INT IDENTITY(1,1) PRIMARY KEY,
    fecha DATE NOT NULL,
    monto DECIMAL(18, 2) NOT NULL,
    tipo CHAR(1) CHECK (tipo IN ('D', 'H')) NOT NULL, -- 'D' para debe, 'H' para haber
    idCuenta INT NOT NULL,
    FOREIGN KEY (idCuenta) REFERENCES Cuentas(id)
);


Insert into cuentas (descripcion) values ('Caja');
Insert into cuentas (descripcion) values ('Bancos');
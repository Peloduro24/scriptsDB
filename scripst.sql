-- Tabla Usuario
CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nombres VARCHAR(150) NOT NULL,
    Correo VARCHAR(150) UNIQUE NOT NULL,
    Passwordd VARCHAR(100) NOT NULL,
    Login VARCHAR(100)
);

-- Tabla Producto
CREATE TABLE Producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Detalle VARCHAR(150) NOT NULL,
    Descripcion VARCHAR(200),
    Precio DECIMAL(10, 2) NOT NULL,
    Nuevo TINYINT(1) DEFAULT 1,
    Categoria INT
);

-- Tabla Distrito
CREATE TABLE Distrito (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Detalle VARCHAR(150) NOT NULL
);

-- Tabla Local
CREATE TABLE Local (
    id INT AUTO_INCREMENT PRIMARY KEY,
    RazonSocial VARCHAR(200) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    idDistrito INT,
    Horario VARCHAR(100),
    Latitud VARCHAR(50),
    Longitud VARCHAR(50),
    FOREIGN KEY (idDistrito) REFERENCES Distrito (id)
);

-- Tabla Favoritos
CREATE TABLE Favoritos (
    idUsuario INT,
    idProducto INT,
    PRIMARY KEY (idUsuario, idProducto),
    FOREIGN KEY (idUsuario) REFERENCES Usuario (id),
    FOREIGN KEY (idProducto) REFERENCES Producto (id)
);

-- Tabla Pedido
CREATE TABLE Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idUsuario INT,
    idLocal INT,
    FechaVenta DATETIME NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    Items INT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario (id),
    FOREIGN KEY (idLocal) REFERENCES Local (id)
);

-- Tabla PedidoDetalle
CREATE TABLE PedidoDetalle (
    idPedido INT,
    idProducto INT,
    Cantidad INT NOT NULL,
    Size INT,
    Milk INT,
    Cream INT,
    Caffeine INT,
    Total DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (idPedido, idProducto),
    FOREIGN KEY (idPedido) REFERENCES Pedido (id),
    FOREIGN KEY (idProducto) REFERENCES Producto (id)
);

INSERT INTO
    Usuario (
        Correo,
        Login,
        Passwordd,
        Nombres
    )
VALUES (
        "asdasd@gmail.com",
        "1234",
        "12345",
        "gonzaloo"
    );
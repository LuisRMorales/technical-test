CREATE TABLE Cliente 
    (IdCliente int on primary, 
    Nombre varchar(128) not null, 
    Estado boolean not null);

CREATE TABLE Paquete 
    (IdPaquete int on primary, 
    Nombre varchar(128) not null, 
    Precio decimal(5,2) not null, 
    FechaCompra datetime, 
    FechaVencimiento datetime);

CREATE TABLE PaqueteCliente 
    (Id int on primary, 
    IdCliente guid FOREIGN KEY REFERENCES Cliente(IdCliente), 
    IdPaquete guid FOREIGN KEY REFERENCES Paquete(IdPaquete));


SELECT * FROM Cliente as c
WHERE c.Estado = 1 
    WHERE EXISTS (SELECT 1 FROM PaqueteCliente AS pc          
        JOIN Paquete as p on pc.IdPaquete = c.IdPaquete
        WHERE pc.IdCliente = c.IdCliente 
        AND p.FechaCompra >= DATEADD(MONTH, -3, GETDATE())
)


SELECT * FROM Cliente as c
WHERE c.Estado = 1 
    WHERE EXISTS (SELECT 1 FROM PaqueteCliente AS pc          
        JOIN Paquete as p on pc.IdPaquete = c.IdPaquete
        WHERE pc.IdCliente = c.IdCliente 
        AND p.FechaVencimiento <= GETDATE()
        AND DATEDIFF(DAY, p.FechaVencimiento, GETDATE()) <= 15
)



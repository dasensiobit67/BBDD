USE  mydb;

INSERT INTO Proveedor VALUES 
(1,'Moxin Co.', 'Moyanes 18', '936584712', '936584712', '56842759Z'),
(2,'MHR Fasion', 'Calabria 59', '958455762', '958455762', '3456287Q'),
(3,'Quasar SRL', 'Spathenstrash 23', '785555666', '785555666', '78451296J'),
(4,'Tech Optik', 'Reşitpaşa cad 125', '902126942010', '902126942010', '74185296F'),
(5,'AJC Opticos', 'Castellana 186', '91589666', '91456789', '32456789A');

INSERT INTO Cliente VALUES
(1,'Virtudes Martinez', 'Moyanes 18', '936584712', 'vmartinez@gmail.com', '2018-11-18',4),
(2,'Adrian Benjamin', 'Calabria 59', '958455762', 'adrian1965@hotmail.com',  '2017-04-27',2),
(3,'Ana Tornero', 'Spathenstrash 23', '785555666', 'anita28@yahoo.es',  '2015-10-05',5),
(4,'Alejandro Tudela', 'Reşitpaşa cad 125', '902126942010','aletudel@gmail.com',  '2019-05-24',3),
(5,'Maria Sirulo', 'Castellana 186', '91589666', 'maria.sirulo@gmail.com', '2020-08-31',1);

INSERT INTO Gafas VALUES
(1,'Ray-Ban', '1,0', '1,0' ,'Metal', 'DORADO', 'VERDE', 200,1),
(2,'Adidas','1,5', '1,5','Pasta', 'NEGRO', 'GRIS', 150, 2),
(3,'Gucci', '2,0', '2,0','Madera', 'CAOBA', 'AMBAR', 175, 2),
(4,'Polaroid','1,0', '1,0', 'Titanio', 'PLATEADO', 'ESPEJO', 250, 4),
(5,'DKNY','1,0', '1,0', 'Pasta', 'ROJO', 'NEGRO', 99, 3);

INSERT INTO Empleado VALUES
(1,'Pedro Gomez'),
(2,'Juan Perez'),
(3,'Ana Sanchez'),
(4,'German Gutierrez'),
(5,'Beatriz Parla');

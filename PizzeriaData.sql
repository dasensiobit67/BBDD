USE  mydb;

INSERT INTO producte VALUES 
(1,'Margarita', 'Tomate, Mozzarella, Albahaca', 'http://margarita.jpg', 10),
(2,'Prosciutto', 'Tomate, Mozzarella, Jamon', 'http://prosciutto.jpg', 12),
(3,'Napolitana', 'Tomate, Mozzarella, Anchoas', 'http://napolitana.jpg',14);


INSERT INTO client VALUES
(1,'Virtudes', 'Martinez', 'Moyanes 18','08014', '936584712'),
(2,'Adrian', 'Benjamin', 'Calabria 59', '08014','958455762'),
(3,'Ana', 'Tornero', 'Begur 23','08028', '785555666');


INSERT INTO categoria VALUES
(1,'Pizza'),
(2,'Amanida'),
(3,'Beguda');

INSERT INTO empleat VALUES
(1,'Pedro', 'Gomez','36555487L','936584712',1),
(4,'German', 'Gutierrez', '34698214K', '936584712',2),
(5,'Beatriz', 'Parla', '39789456J', '936584712',1);

INSERT INTO botiga VALUES
(1,'Sants','Moyanes 18','08014'),
(2,'Eixample', 'Calabria 59', '08032'),
(3,'Rambla', 'Rambla 23','08028');

INSERT INTO provincia VALUES
(1,'Barcelona'),
(3,'Lleida'),
(2,'Girona');

INSERT INTO localitat VALUES
(1,'Barcelona'),
(3,'Sabadell'),
(2,'Terrassa');

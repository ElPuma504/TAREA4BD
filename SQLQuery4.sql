CREATE DATABASE Tarea4;

USE TAREA4;

create table Proveedor(
id_proveedor int  primary key identity(1,1),
nombre varchar(30),
categoria varchar(100),
ciudad varchar(150)

)
INSERT INTO Proveedor(nombre,categoria,ciudad)
values('francisco','plastico','tegucigalpa'),
('jimenas','plastico','tegucigalpa'),
('guayaba','metal','tegucigalpa'),
('francisco','madera','tegucigalpa'),
('francisco','consumibles','tegucigalpa');

select *from Proveedor

create table producto(
id_articulo varchar(255) primary key,
descripcion varchar(255),
ciudad varchar(255),
precio int,
);
INSERT into producto(id_articulo,descripcion,ciudad,precio)
values('1','fuerte','tegucigalpa','89'),
('2','debil','choloma','39'),
('3','debil','catacamas','20'),
('4','fuerte','la ceiba','67'),
('5','fuerte','sps','99');
SELECT *from producto

create table cliente(
id_cliente int primary key,
nombre varchar(255),
precio int,
);
INSERT INTO cliente(id_cliente,nombre,precio)
values('1','daniel','650'),
('2','mario','50'),
('3','lorenzo','150'),
('4','david','550'),
('5','carrion','950');

select *from cliente

create table pedido(
id_pedido int primary key,
id_articulo varchar(255),
id_cliente int,
id_proveedor int,
fecha_pedido date,
cantidad int,
precio_total int,
);

ALTER TABLE pedido add constraint fk_producto_pedido foreign key(id_articulo) references producto(id_articulo);
ALTER TABLE pedido add constraint fk_cliente_pedido foreign key(id_cliente) references cliente(id_cliente);
ALTER TABLE pedido add constraint fk_proveedor_pedido foreign key(id_proveedor) references proveedor(id_proveedor);
Insert INTO pedido(id_pedido,id_articulo,id_cliente,id_proveedor,fecha_pedido,cantidad,precio_total)
values
('1','cam','001','0001','2015-11-2','1','99'),
('2','mat','002','0002','2015-11-2','2','78'),
('3','sas','003','0003','2015-11-2','3','89'),
('4','nas','004','0004','2015-11-2','4',' 78'),
('5','tam','005','0005','2015-11-2','5','34');

Select *from pedido

Alter table pedido ALTER column fecha_pedido datetime;

create table inventario(
id_inventario int primary key,
id_producto int,
fecha date,
cantidad int,
);

insert into inventario(id_inventario,id_producto,fecha,cantidad)
values('1','1','2020-11-23','23'),
('2','2','2020-11-23','23'),
('3','3','2023-9-3','3'),
('4','4','1997-8-23','2'),
('5','5','1995-7-13','31');

Select *from inventario
-----------------------------------------------------------------------------------------------------------consultas------
select id_proveedor,c.nombre from producto as p
left join proveedor as c on p.id_articulo=c.id_proveedor
where c.id_proveedor ='1'

Select*from cliente
select *from producto
select *from proveedor
select *from pedido


select p.nombre as nombre_cliente,f.id_proveedor from cliente  as p
inner join pedido as s on p.id_cliente=s.id_cliente
inner join proveedor as f on s.id_proveedor=f.id_proveedor
where f.id_proveedor ='1'

Select id_proveedor from pedido where precio_total >(select AVG(precio) from producto)

select r.nombre as nombresnoasignados from Proveedor as r
inner join pedido as p on r.id_proveedor=p.id_proveedor
where r.nombre='Null'

select nombre from cliente as f
inner join pedido as d on f.id_cliente=d.id_cliente
where precio>100 and cantidad>1

select n.id_cliente,p.descripcion,t.fecha_pedido,n.nombre,t.cantidad,p.precio, s.nombre from pedido as t 
left join cliente as n on t.id_cliente=n.id_cliente
inner join producto as p on t.id_articulo=p.id_articulo
inner join Proveedor as s on t.id_proveedor=s.id_proveedor
where fecha_pedido between '2022-01-01' and '2022-03-20'

select n.cantidad as cantidadenproducto,s.nombre from pedido as n
inner join cliente as s on n.id_cliente=s.id_cliente
where n.cantidad >1
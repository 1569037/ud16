/*
	insertar tuplas
*/
use informatica;

insert into fabricantes values ('1', 'a'),
('2', 'b'),
('3', 'c'),
('4', 'd'),
('5', 'e'),
('6', 'f'),
('7', 'g'),
('8', 'h'),
('9', 'i'),
('10', 'j');

insert into articulos values ('11', 'aa', '3','1'),
 ('22', 'bb', '3','2'),
 ('33', 'aa', '3','3'),
 ('44', 'aa', '3','4'),
 ('55', 'aa', '3','5'),
 ('66', 'aa', '3','6'),
 ('77', 'aa', '3','7'),
 ('88', 'aa', '3','8'),
 ('99', 'aa', '3','9'),
 ('00', 'aa', '3','10');

#1.1
 select nombre 
 from articulos;
 #1.2
 select nombre, precio
 from articulos;
 #1.3
 select nombre
 from articulos
 where precio <=200;
 #1.4
 select *
 from articulos
 where precio between 60 and 120;
 #1.5
 select nombre, (precio * 166.386) as precio
 from articulos;
 #1.6
 select avg(precio) 
 from articulos;
 #1.7
select avg(precio)
from articulos
where cod_fabri=2;
#1.8
select count(cod_art)
from articulos
where precio>=180;

insert into articulos values('111', 'aaa', '200', '1'),
('222', 'aba', '190', '1'); 
#1.9
select nombre, precio
from articulos
where precio>=180
order by precio, nombre desc;

#1.10
select *
from articulos a, fabricantes f
where a.cod_fabri = f.cod_fabri
order by 1;
#1.11
select a.nombre, a.precio, f.nombre
from articulos a, fabricantes f
where a.cod_fabri=f.cod_fabri
order by 1;
#1.12
select a.cod_fabri, avg(a.precio)
from articulos a, fabricantes f
where a.cod_fabri=f.cod_fabri
group by a.cod_fabri
order by 1;	
#1.13
select f.nombre, avg(a.precio)
from articulos a, fabricantes f
where a.cod_fabri=f.cod_fabri
group by a.cod_fabri
order by 1;	
#1.14
select f.nombre
from articulos a, fabricantes f
where a.cod_fabri=f.cod_fabri 
group by a.cod_fabri
having avg(a.precio)>=150
order by 1;
#1.15
select distinct precio, nombre
from articulos
where precio = (select min(precio) from articulos);
#1.16
select a.precio, f.nombre, a.nombre
from articulos a, fabricantes f
where a.cod_fabri=f.cod_fabri and a.precio=(select max(a.precio)
from articulos a, fabricantes f
where a.cod_fabri=f.cod_fabri)
group by f.cod_fabri, a.nombre, a.precio
order by 2;
	
#1.17
insert into articulos (cod_art, nombre, precio, cod_fabri) values
('23232', 'Altavoces', '70', '2');
#1.18
update articulos set nombre='Impresora Laser' where cod_art=8;
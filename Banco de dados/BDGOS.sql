show databases;
create database gos;
use gos;
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
describe tbusuarios;

insert into  tbusuarios(iduser, usuario, fone, login, senha)
values(1, 'José de Assis', '9899699981', 'joseassis', '123456');
select * from tbusuarios;
insert into  tbusuarios(iduser, usuario, fone, login, senha)
values(2, 'Administrador', '9899699981', 'admin', 'admin');
select * from tbusuarios;
insert into  tbusuarios(iduser, usuario, fone, login, senha)
values(3, 'Bill Gates', '9899699981', 'bill', '123456');

select * from tbusuarios;
update tbusuarios set fone = 88888888 where iduser='2';
select * from tbusuarios;
delete from tbusuarios where iduser = 3;
select * from tbusuarios;

create table tbclientes(
idcli int primary key auto_increment,
nome varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);
select * from tbusuarios;
select * from tbclientes;

describe tbclientes;

alter table tbclientes change nome nomecli varchar (50) not null;
-- alter table tbclientes rename column nome to nomecli;

-- alter table tbclientes change column nome  nomecli varchar(50) not null;
select * from tbclientes;
describe tbclientes;

insert into tbclientes(nomecli, endcli,fonecli, emailcli)
values ('Linus Torvalds', 'Rua Tux, 2015', '9999999', 'linus@linux.com');
select * from tbclientes;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar (30),
valor decimal(10,2),
idcli int not null,
foreign key(idcli) references tbclientes(idcli)
);
describe tbos;
insert into tbos (equipamento, defeito, servico, tecnico, valor, idcli)
values('notebook', 'não liga', 'troca da fonte', 'Zé;', 87.50, 1);

select * from tbos;

select
O.os,equipamento, defeito, servico, valor,
C.nomecli, fonecli from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);

create database trab_individual;
create table Residente( -- criação da tabela Residente
	resid_id serial primary key not null,
	resid_nome varchar(50) not null,
	resid_email varchar(50) not null,
	resid_matricula varchar(50) not null
);

create table Habilidade( -- criação da tabela Habilidade
	hab_id serial primary key not null,
	hab_nome varchar(50) not null
);

create table ResidentHabilidade( -- criação da tabela intermediária
	resid_id id not null,
	hab_id id not null,
	foreign key (resid_id) references Residente(resid_id),
	foreign key (hab_id) references Habilidade(hab_id),
	primary key (resid_id, hab_id)
);

select * from residente; -- consultei a tabela residente

insert into residente (resid_id, resid_nome, resid_email, resid_matricula) values -- inseri os dados na tabela residente
	(1, 'Cristian', 'cristian@gmail.com', '123456'),
	(2, 'Eduardo', 'eduardo@gmail.com', '234567'),
	(3, 'Felipe', 'felipe@gmail.com', '345678'),
	(4, 'Igor', 'igor@gmail.com', '456789'),
	(5, 'Rian', 'rian@gmail.com', '567890');

select * from habilidade; -- consultei a tabela habilidade

insert into habilidade (hab_id, hab_nome) values -- inseri os dados na tabela habilidade
	(1, 'Lógica de Programação'),
	(2, 'Banco de Dados'),
	(3, 'Java'),
	(4, 'FrontEnd Essencial'),
	(5, 'Desenvolvimento de API Restful'),
	(6, 'Desenvolvimento WEB'),
	(7, 'Desenvolvimento de Aplicativo Mobile');

insert into residenthabilidade (resid_id, hab_id) values -- inseri os dados na tabela residednthabilidade
	(1, 1),
	(1, 3),
	(1, 5),
	(2, 2),
	(2, 4),
	(2, 7),
	(3, 3),
	(3, 4),
	(3, 6),
	(4, 2),
	(4, 5),
	(4, 6),
	(5, 1),
	(5, 2),
	(5, 3);
	
select r.resid_nome as "Nome do Residente", h.hab_nome as "Habilidade"
	from 
		residente r
		inner join residenthabilidade rh on
			r.resid_id=rh.resid_id 
		inner join habilidade h on
			rh.hab_id=h.hab_id 
		where h.hab_id = :id;

select
	r.resid_nome,
	r.resid_matricula,
	string_agg(h.hab_nome,
	', ') as compecencias
from 
		residente r
join residenthabilidade rh on
	r.resid_id = rh.resid_id
join habilidade h on
	rh.hab_id = h.hab_id
group by
	r.resid_id,
	r.resid_nome,
	r.resid_matricula;
-- gerei uma tabela com o nome do residente, matrícula e as competências 

select
	r.resid_nome,
	r.resid_matricula,
	string_agg(h.hab_nome,
	', ') as competencias
from
		residente r
join residenthabilidade rh on
	r.resid_id = rh.resid_id
join habilidade h on
	rh.hab_id = h.hab_id
group by
	r.resid_id,
	r.resid_nome,
	r.resid_matricula
order by
	r.resid_nome;
--ordenei em ordem alfabetica em relação ao nome



	

	

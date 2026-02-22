create database oficina;

/*usar um banco de dados */
use oficina;
 
create table fabricante(
 codigo bigint primary key,  /* inteiro grande */
 nome varchar(100) not null,  /*campo é obrigatório */
 telefone varchar(30),
 email varchar(100) not null unique, /* não pode ter valor repetido */
 responsavel varchar(100)
);
 
 
create table modelo(
 codigoModelo bigint primary key,
 tipo varchar(100) not null,
 peso decimal(12,4) default(1),   
 codigofabricante bigint,
 horaTeste int default(100)
);
 
/*crio o relacionamento entre as tabelas */ 
alter table modelo add foreign key
modelo(codigofabricante) references
fabricante(codigo);

 
create table maquina(
 registro varchar(100) primary key,
 ano char(4),
 horasUso int default(0),
 codigoModelo bigint
);
 
alter table maquina add foreign key
maquina(codigoModelo) references modelo(codigoModelo);

create table oficina(
 codigoOficina bigint primary key,
 cnpj char(14) not null unique,
 nome varchar(100),
 responsavel varchar(100),
 telefone varchar(20) not null unique,
 email varchar(100) not null unique,
 codigoTecnico bigint,
 codigoTeste bigint
);

create table teste(
 codigo bigint primary key,
 pontuacao decimal(12,4) not null unique,
 nome varchar(100),
 responsavel varchar(100),
 telefone varchar(20) not null unique,
 email varchar(100) not null unique,
 codigoTecnico bigint,
 codigoTeste bigint
);
 
create table tecnico(
	codigoFuncional bigint primary key,
	endereco varchar(100), 
	telefone varchar(20) not null unique, 
	salario decimal(12,4) default(1),
	qualificacao varchar(100)
);

create table modeloOficina(
	codigoOficina bigint,
	codigoModelo bigint,
	PRIMARY KEY (codigoModelo, codigoOficina), /*chave primária composta*/
	foreign key(codigoModelo) references modelo(codigoModelo),
	foreign key(codigoOficina) references oficina(codigoOficina)
);

alter table teste add foreign key
teste(codigo) references oficina(codigoOficina);

alter table tecnico add foreign key 
tecnico(codigoFuncional) references oficina(codigoOficina);

alter table teste add foreign key
teste(codigo) references tecnico(codigoFuncional); 

create table modeloTecnico(
	codigoFuncional bigint,
	codigoModelo bigint,
	PRIMARY KEY (codigoModelo, codigoFuncional), /*chave primária composta*/
	foreign key(codigoModelo) references modelo(codigoModelo),
	foreign key(codigoFuncional) references tecnico(codigoFuncional)
);


create database fazenda_bd;
use fazenda_bd;

create table funcionario (
id int not null auto_increment primary key,
nome text not null,
cpf varchar(14) not null,
salario varchar(20) not null
) engine = InnoDB;


create table producaoleite(
identificacao int not null auto_increment primary key,
especie text not null,
ultimaordenha varchar (200),
temperaturaleite varchar(6) not null,
produtividadecadaquarto varchar(8) not null,
insemunacao varchar(3) not null,
estimativaparto date not null,
ruminacaopordia time not null
) engine = InnoDB;


create table produtos (
id int not null auto_increment primary key,
nome text not null,
tipo text not null,
quantidadeestoque varchar (8) not null,
preco varchar(6) not null
) engine = InnoDB;


create table equipamento (
id int not null auto_increment primary key,
nome text not null,
tipo text not null
) engine = InnoDB;


create table varejista (
id int not null auto_increment primary key,
compradores text
) engine = InnoDB;


# script para inserir dados na tabela Funcionario
insert into funcionario(id, nome, cpf, salario) values ('1','Lúcia','111.111.111-11','1589,75');

# script para inserir dados na tabela Produção de Leite
insert into producaoleite(identificacao, especie, ultimaordenha, temperaturaleite, produtividadecadaquarto, insemunacao, estimativaparto,
						   ruminacaopordia ) values ('1', 'Vaca leiteira', 'Mês Passado', '25,5', '1000L', 'Sim', '2020-10-30', '15:20:00');
					
# script para inserir dados na tabela Produtos
insert into produtos (id, nome, tipo ,quantidadeestoque, preco) values ('1', 'Leite ', 'A', '250L', '5.00');

# script para inserir dados na tabela Equipamento
insert into equipamento (id, nome, tipo) values ('1', 'Machado', 'Ferramenta Agricola'); 

# script para inserir dados na tabela Varejista
insert into varejista (id, compradores) values ('1', 'Supermercado A'); 


# Consulta de Junção tabela Produtos e Varejista
alter table varejista
add foreign key (id)
references produtos (id);

select produtos.id as 'IdProduto',  produtos.nome as 'NomeDoProduto', produtos.tipo as 'TipoDoProduto', 
	   produtos.quantidadeestoque as 'QuantidadeEmEstoque', produtos.preco as 'Preço', varejista.id as 'Varejista',
       varejista.compradores as 'Compradores'
from produtos join varejista
on produtos.id = varejista.id;
       
       
# Consulta de Junção tabela Funcionario e Equipamento
alter table funcionario 
add foreign key (id)
references equipamento (id);

select funcionario.id as 'ID', funcionario.nome as 'NomeDoFuncionario', funcionario.cpf'CPFDoFuncionario', funcionario.salario as 'Salário',
	   equipamento.id as 'Equipamento', equipamento.nome as 'NomeDoEquipamento', equipamento.tipo as 'TipoDeEquipamento'  
from funcionario inner join equipamento
on funcionario.id = equipamento.id;   


# Consulta de Agregação tabela Produção de Leite
select avg(produtividadecadaquarto) as 'MediaDeProdutividade'
from producaoleite;

# SubConsulta tabela Funcionario
select funcionario.salario
from funcionario
where salario < 1589.75;
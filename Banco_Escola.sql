create database Escola;
use Escola;

create table Professor(
	Id_Professor int primary key auto_increment,
    Nome_Professor varchar(50) not null,
    Idade smallint,
    Grau enum("Mestrado", "Doutorado", "Livre-Docente") not null
);

create table Aula(
	Id_Aula int primary key auto_increment,
    Nome_Aula varchar(20) not null,
    Horario_Aula time,
    Id_Professor int not null,
    foreign key (Id_Professor) references Professor(Id_Professor)
);

create table Turma(
	Id_Turma int primary key auto_increment,
    Turma enum('A', 'B', 'C', 'D', 'E') not null,
	Sala smallint not null,
    Quantidade_De_Alunos smallint
);

create table Aluno(
	Id_Aluno int primary key auto_increment,
    Nome_Aluno varchar(50) not null,
    Idade smallint,
    Ano smallint not null,
    Id_Aula int not null,
    Id_Turma int not null,
    foreign key (Id_Aula) references Aula(Id_Aula),
    foreign key (Id_Turma) references Turma(Id_Turma)
);

create table Professor_Turma(
	Id_Professor int,
    Id_Turma int,
    primary key(Id_Professor, Id_Turma),
    foreign key (Id_Professor) references Professor(Id_Professor),
    foreign key (Id_Turma) references Turma(Id_Turma)
);

insert into Professor(Nome_Professor, Grau)
	values('João', 'Doutorado'),
    ('Paulo', 'Livre-Docente');

insert into Aula(Nome_Aula, Id_Professor)
	values('Física', 1),
    ('Matemática', 2);
    
insert into Turma(Sala, Turma)
	values(5, 'A'),
    (10, 'E');

insert into Aluno(Nome_Aluno, Ano, Id_Aula, Id_Turma)
	values('Pedro', 7, 2, 1),
    ('Maria', 4, 1, 2);
    
insert into Professor_Turma(Id_Professor, Id_Turma)
	values(1, 1),
    (2, 2);

update Professor
	set	Nome_Professor = 'Carlos'
    where Id_Professor = 1;

update Aula
	set Nome_Aula = 'Geografia'
    where Id_Aula = 1;

update Turma
	set Quantidade_de_Alunos = 1
    where Id_Turma = 1;

update Aluno
	set Idade = 15
    where Nome_Aluno = 'Maria';
    
update Professor_Turma
	set Id_Professor = 1
    where Id_Turma = 2;

delete from Professor_Turma
	where Id_Professor = 1;
    
delete from Aluno
	where Id_Turma = 1;

delete from Turma
	where Id_Turma = 1;

delete from Aula
	where Nome_Aula = 'Matemática';

delete from Professor
	where Nome_Professor = 'Paulo';
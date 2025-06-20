CREATE DATABASE bdIntea
use bdIntea
--DROP Database bdIntea
  
CREATE TABLE tbAutista(
idAutista INT PRIMARY KEY IDENTITY(1,1),
emailAutista VARCHAR(100),
senhaAutista VARCHAR(50),
cipteia VARCHAR(50),
generoAustista varchar(20),
dataNascAutista DATE,
cep INT,
logradouro VARCHAR(50),
endereco VARCHAR(50),
rua varchar(50),
bairro VARCHAR(100),
numero INT,
cidade varchar(100),
estado VARCHAR(100),
)
CREATE TABLE tbFoneAutista(
idFoneAustista INT PRIMARY KEY IDENTITY(1,1),
numero INT,
idAutista INT FOREIGN KEY REFERENCES tbAutista(idAutista)
)

CREATE TABLE tbPsicologo(
idPsicologo INT PRIMARY KEY IDENTITY(1,1),
nomePsicologo VARCHAR(50),
emailPsicologo VARCHAR(100),
senhaPsicologo VARCHAR(100),
crmPsicologo varchar(50),
dataNascPsicologo DATE,
cep INT,
logradouro VARCHAR(50),
endereco VARCHAR(50),
rua varchar(50),
bairro VARCHAR(100),
numero INT,
cidade varchar(100),
estado VARCHAR(100),
) 
CREATE TABLE tbFonePsicologo(
idFonePsicologo INT PRIMARY KEY IDENTITY(1,1),
numero INT,
idPsicologo INT FOREIGN KEY REFERENCES tbPsicologo(idPsicologo),
)	
CREATE TABLE tbResponsavel(
idResponsavel INT PRIMARY KEY IDENTITY(1,1),
nomeResponsavel VARCHAR(50),
emailResponsavel VARCHAR(50),
senhaResponsavel VARCHAR(100),
dataNascimentoResponsavel DATE,
idAutista INT FOREIGN KEY REFERENCES tbAutista(idAutista),
cep INT,
logradouro VARCHAR(50),
endereco VARCHAR(50),
rua varchar(50),
bairro VARCHAR(100),
numero INT,
cidade varchar(100),
estado VARCHAR(100),
)
CREATE TABLE tbFoneResponsavel(
idFoneResponsavel INT PRIMARY KEY  IDENTITY (1,1),
numero INT,
idResponsavel INT FOREIGN KEY REFERENCES tbResponsavel(idResponsavel)
)
CREATE TABLE tbPostagem(
idPostagem INT PRIMARY KEY  IDENTITY(1,1),
idAutista INT FOREIGN KEY REFERENCES tbAutista(idAutista),
conteudo VARCHAR(1000),
dataPostagem DATETIME DEFAULT CURRENT_TIMESTAMP
)
CREATE TABLE tbComentario(
idComentario INT PRIMARY KEY IDENTITY (1,1),
idPostagem INT FOREIGN KEY REFERENCES tbPostagem(idPostagem),
idAutista INT FOREIGN KEY REFERENCES tbAutista (idAutista),
)

CREATE TABLE tbSalaVirtual(
idSalaVirtual INT PRIMARY KEY IDENTITY(1,1),
link VARCHAR(100),
dataCriacao DATETIME DEFAULT CURRENT_TIMESTAMP
)
CREATE TABLE  tbConsultas(
idConsultas INT PRIMARY KEY IDENTITY(1,1),
idPsicologo INT FOREIGN KEY  REFERENCES tbPsicologo(idPsicologo),
idAutista INT FOREIGN KEY REFERENCES tbAutista (idAutista),
idSalaVirtual INT FOREIGN KEY REFERENCES tbSalaVirtual(idSalaVirtual),
dataAgendamento DATETIME,
DataRealizacao DATETIME,
statusConsultas VARCHAR(50) DEFAULT'Agendada',
observacoesConsulta  VARCHAR(500),
)

CREATE TABLE tbResponsavelAutista(
idResponsavelAutista INT PRIMARY KEY IDENTITY(1,1),
idAutista INT FOREIGN KEY REFERENCES tbAutista(idAutista),
idResponsavel INT FOREIGN KEY REFERENCES tbResponsavel (idResponsavel),
)
Create table tbComunidadeAutista(
idComunidade INT PRIMARY KEY IDENTITY (1,1),
nomeComunidade VARCHAR(500),
cpfComunidade VARCHAR(18),
tipoComunidade VARCHAR(50),
dataNascComunidade DATE,
emailComunidade Varchar(500),
cep INT,
logradouro VARCHAR(50),
endereco VARCHAR(50),
rua varchar(50),
bairro VARCHAR(100),
numero INT,
cidade varchar(100),
estado VARCHAR(100),
)
CREATE TABLE tbAdmin(
idAdmin INT PRIMARY KEY IDENTITY(1,1),
emailAdmin varchar(500),
senhaAdmin VARCHAR(500),
cpfAdmin VARCHAR(20)
)

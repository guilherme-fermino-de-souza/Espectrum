CREATE DATABASE bdRedeSocialAutistas
use bdRedeSocialAutistas
--DROP Database bdRedeSocialAutistas
CREATE TABLE tbAutista(
idAutista INT PRIMARY KEY IDENTITY(1,1),
emailAutista VARCHAR(100),
senhaAutista VARCHAR(50),
cipteiaAutista VARCHAR(50),
generoAustista varchar(20),
dataNascAutista DATE,
cepAutista INT,
logradouroAutista VARCHAR(50),
enderecoAutista VARCHAR(50),
ruaAutista varchar(50),
bairroAutista VARCHAR(100),
numeroAutista INT,
cidadeAutista varchar(100),
estadoAutista VARCHAR(100),
)
CREATE TABLE tbFoneAutista(
idFoneAustista INT PRIMARY KEY IDENTITY(1,1),
numeroFoneAutista INT,
idAutista INT FOREIGN KEY REFERENCES tbAutista(idAutista)
)

CREATE TABLE tbProfissional(
idProfissional INT PRIMARY KEY IDENTITY(1,1),
nomeProfissional VARCHAR(50),
emailProfissional VARCHAR(100),
senhaProfissional VARCHAR(100),
crmProfissional varchar(50),
dataNascProfissional DATE,
cepProfissional INT,
logradouroProfissional VARCHAR(50),
enderecoProfissional VARCHAR(50),
ruaProfissional varchar(50),
bairroProfissional VARCHAR(100),
numeroProfissional INT,
cidadeProfissional varchar(100),
estadoProfissional VARCHAR(100),
) 
  
CREATE TABLE tbFoneProfissional(
idFoneProfissional INT PRIMARY KEY IDENTITY(1,1),
numeroFoneProfissional INT,
idProfissional INT FOREIGN KEY REFERENCES tbProfissional(idProfissional),
)	
  
CREATE TABLE tbResponsavel(
idResponsavel INT PRIMARY KEY IDENTITY(1,1),
nomeResponsavel VARCHAR(50),
emailResponsavel VARCHAR(50),
senhaResponsavel VARCHAR(100),
dataNascimentoResponsavel DATE,
idAutista INT FOREIGN KEY REFERENCES tbAutista(idAutista),
cepResponsavel INT,
logradouroResponsavel VARCHAR(50),
enderecoResponsavel VARCHAR(50),
ruaResponsavel varchar(50),
bairroResponsavel VARCHAR(100),
numeroResponsavel INT,
cidadeResponsavel varchar(100),
estadoResponsavel VARCHAR(100),
)
  
CREATE TABLE tbFoneResponsavel(
idFoneResponsavel INT PRIMARY KEY  IDENTITY (1,1),
numeroFoneResponsavel INT,
idResponsavel INT FOREIGN KEY REFERENCES tbResponsavel(idResponsavel)
)
  
CREATE TABLE tbPostagem(
idPostagem INT PRIMARY KEY  IDENTITY(1,1),
conteudoPostagem VARCHAR(1000),
comentarioPostagem varchar(500),
dataPostagem DATETIME DEFAULT CURRENT_TIMESTAMP,
postagem VARCHAR(100)
)
CREATE TABLE tbComentario(
idComentario INT PRIMARY KEY IDENTITY (1,1),
idPostagem INT FOREIGN KEY REFERENCES tbPostagem(idPostagem),
conteudoComentario VARCHAR(500)
)
CREATE TABLE tbImagem(
idImagem INT PRIMARY KEY IDENTITY(1,1),
caminhoImagem VARCHAR(500),
idPostagem INT FOREIGN KEY REFERENCES tbPostagem(idPostagem),
)

CREATE TABLE  tbConsulta(
idConsulta INT PRIMARY KEY IDENTITY(1,1),
idPsicologo INT FOREIGN KEY  REFERENCES tbPsicologo(idPsicologo),
idAutista INT FOREIGN KEY REFERENCES tbAutista (idAutista),
dataAgendamentoConsulta DATETIME,
DataRealizacaoConsulta DATETIME,
statusConsulta VARCHAR(50) ,
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
cepComunidade INT,
logradouroComunidade VARCHAR(50),
enderecoComunidade VARCHAR(50),
ruaComunidade varchar(50),
bairroComunidade VARCHAR(100),
numeroComunidade INT,
cidadeComunidade varchar(100),
estadoComunidade VARCHAR(100),
)
  
CREATE TABLE tbAdmin(
idAdmin INT PRIMARY KEY IDENTITY(1,1),
emailAdmin varchar(500),
senhaAdmin VARCHAR(500),
cpfAdmin VARCHAR(20)
)
  
CREATE TABLE tbGruposDaComunidadeAutista(
idGruposDaComunidadeAutista Int PRIMARY KEY IDENTITY(1,1),
nomeGrupo VARCHAR(500),
descricaoGrupo varchar(500),
)
  
CREATE TABLE tbGruposComunidade(
idGruposComunidade INT PRIMARY KEY IDENTITY(1,1),
idGruposDaComunidadeAutista INT FOREIGN KEY REFERENCES tbGruposDaComunidadeAutista(idGruposDaComunidadeAutista),
idComunidade INT FOREIGN KEY REFERENCES tbComunidadeAutista(idComunidade)
)

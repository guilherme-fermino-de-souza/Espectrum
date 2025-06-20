CREATE DATABASE bdRedeSocialAutistas
use bdRedeSocialAutistas
--DROP Database bdRedeSocialAutistas
CREATE TABLE tbAutista(
idAutista INT PRIMARY KEY IDENTITY(1,1),
emailAutista VARCHAR(100),
senhaAutista VARCHAR(50),
cipteia VARCHAR(50),
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
cepPsicologo INT,
logradouroPsicologo VARCHAR(50),
enderecoPsicologo VARCHAR(50),
ruaPsicologo varchar(50),
bairroPsicologo VARCHAR(100),
numeroPsicologo INT,
cidadePsicologo varchar(100),
estadoPsicologo VARCHAR(100),
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
numero INT,
idResponsavel INT FOREIGN KEY REFERENCES tbResponsavel(idResponsavel)
)
  
CREATE TABLE tbPostagem(
idPostagem INT PRIMARY KEY  IDENTITY(1,1),
conteudoPostagem VARCHAR(1000),
comentarioPostagem varchar(500),
dataPostagem DATETIME DEFAULT CURRENT_TIMESTAMP,
imagem
  Postagem VARCHAR(100)
)
CREATE TABLE tbComentarios(
idComentario INT PRIMARY KEY IDENTITY (1,1),
idPostagem INT FOREIGN KEY REFERENCES tbPostagem(idPostagem),
conteudoComentario VARCHAR(500)

)
CREATE TABLE tbImagems(
idImagem INT PRIMARY KEY IDENTITY(1,1),
imagem VARCHAR(500),
idPostagem INT FOREIGN KEY REFERENCES tbPostagem(idPostagem),

)


CREATE TABLE  tbConsultas(
idConsultas INT PRIMARY KEY IDENTITY(1,1),
idPsicologo INT FOREIGN KEY  REFERENCES tbPsicologo(idPsicologo),
idAutista INT FOREIGN KEY REFERENCES tbAutista (idAutista),
dataAgendamento DATETIME,
DataRealizacao DATETIME,
statusConsultas VARCHAR(50) ,
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

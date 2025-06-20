CREATE DATABASE bdIntea;
USE bdIntea;

-- Tabela principal de usuários
CREATE TABLE tbUsuario (
  idUsuario INT AUTO_INCREMENT PRIMARY KEY,
  nomeUsuario VARCHAR(255) NOT NULL,
  emailUsuario VARCHAR(255) UNIQUE NOT NULL,
  senhaUsuario VARCHAR(255) NOT NULL, 
  cpf VARCHAR(14) NOT NULL,
  generoUsuario VARCHAR(20) NOT NULL,
  dataNascUsuario DATE NOT NULL,
  cepUsuario CHAR(8) NOT NULL,
  logradouroUsuario VARCHAR(255),
  enderecoUsuario VARCHAR(255),
  ruaUsuario VARCHAR(255),
  bairroUsuario VARCHAR(100),
  numeroUsuario INT,
  cidadeUsuario VARCHAR(100),
  estadoUsuario VARCHAR(100),
  tipo_usuario ENUM('admin', 'alistico', 'autista', 'cuidador', 'profissional') NOT NULL
) 
-- telefones usuário
CREATE TABLE tbFoneUsuario (
  idFoneUsuario INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT UNIQUE NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE
);
-- alístico (mais simples de todos)
CREATE TABLE tbAlistico(
  idAlistico INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT UNIQUE NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE
)
-- autista
CREATE TABLE tbAutista (
  idAutista INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT UNIQUE NOT NULL,
  cpteia VARCHAR(255) NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE
)
-- cuidador
CREATE TABLE tbCuidador (
  idCuidador INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT UNIQUE NOT NULL,
  documentoCuidador VARCHAR(255) NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE
)
-- este seria o antigo psicólogo
CREATE TABLE tbProfissional (
  idProfissional INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT UNIQUE NOT NULL,
  areaAtuacaoProfissional VARCHAR(255) NOT NULL,
  documentoProfissional VARCHAR(255) NOT NULL,  -- algo que comprove a funcão, talvez o crm
  FOREIGN KEY (usuario_id) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE
)
-- ligação responsável e autista (n para n)
CREATE TABLE tbCuidadorAutista (
    cuidador_id INT NOT NULL,
    autista_id INT NOT NULL,
    PRIMARY KEY (cuidador_id, autista_id),
    FOREIGN KEY (cuidador_id) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE,
    FOREIGN KEY (autista_id) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE
)
-- postagem
CREATE TABLE tbPostagem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    tituloPostagem VARCHAR(255),
    imagemPostagem VARCHAR(255),
    textoPostagem VARCHAR(1555),
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE
);
-- mensagem
CREATE TABLE tbMensagem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    imagemMensagem VARCHAR(255),
    textoMensagem VARCHAR(1555),
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE
);

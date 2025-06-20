CREATE DATABASE bdIntea;
USE bdIntea;

-- Tabela principal de usuários
CREATE TABLE tbUsuario (
  idUsuario INT AUTO_INCREMENT PRIMARY KEY,
  nomeUsuario VARCHAR(255) NOT NULL,
  emailUsuario VARCHAR(255) UNIQUE NOT NULL,
  senhaUsuario VARCHAR(255) NOT NULL,
  generoUsuario VARCHAR(20),
  dataNascUsuario DATE,
  cepUsuario CHAR(8),
  logradouroUsuario VARCHAR(255),
  enderecoUsuario VARCHAR(255),
  ruaUsuario VARCHAR(255),
  bairroUsuario VARCHAR(100),
  numeroUsuario INT,
  cidadeUsuario VARCHAR(100),
  estadoUsuario VARCHAR(100),
  tipo_usuario ENUM('admin', 'alistico', 'autista', 'cuidador', 'profissional') NOT NULL,
) 
-- autista
CREATE TABLE tbAutista (
  idAutista INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id INT UNIQUE NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  cpteia VARCHAR(50) NOT NULL,
  -- Outros campos específicos do autista (se quiser)
  FOREIGN KEY (usuario_id) REFERENCES tbUsuario(idUsuario) ON DELETE CASCADE
)
-- 

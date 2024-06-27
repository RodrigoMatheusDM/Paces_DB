
CREATE DATABASE PACES_DATABASE;
USE PACES_DATABASE;

-- Tabela Planos_Usuario
CREATE TABLE Planos_Usuario (
    Pk_Id_Plano_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Plano VARCHAR(100) NOT NULL,
    Preco_Plano DECIMAL(10, 2) NOT NULL,
    Duracao_Plano INT NOT NULL, -- Em dias, meses, anos, etc.
    Beneficios_Plano TEXT
);

-- Tabela Usuario
CREATE TABLE Usuario (
    Pk_Id_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Senha_Usuario VARCHAR(80) NOT NULL,
    Email_Usuario VARCHAR(100) NOT NULL,
    CPF_usuario VARCHAR(14) NOT NULL,
    Data_Nascimento_Usuario DATE NOT NULL,
    Genero_Usuario ENUM('Masculino', 'Feminino', 'Outro') NOT NULL,
    Nome_Usuario VARCHAR(100) NOT NULL,
    Nome_Social_Usuario VARCHAR(100),
    Fk_Id_Assinatura_Usuario INT
);

-- Tabela Assinatura_Usuario
CREATE TABLE Assinatura_Usuario (
    Pk_Id_Assinatura_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Fk_Id_Usuario INT,
    Fk_Id_Plano_Usuario INT,
    Data_Inicio_Assinatura DATE NOT NULL,
    Data_Termino_Assinatura DATE NOT NULL
);

-- Tabela Videos_Profissional
CREATE TABLE Videos_Profissional (
    Pk_Id_Videos INT AUTO_INCREMENT PRIMARY KEY,
    Titulo_Video VARCHAR(255) NOT NULL,
    Descricao_Video TEXT,
    Video LONGBLOB, -- Armazenamento do vídeo em si
    Fk_Id_Profissional INT
);

-- Tabela Profissional
CREATE TABLE Profissional (
    Pk_Id_Profissional INT AUTO_INCREMENT PRIMARY KEY,
    Senha_Profissional VARCHAR(255) NOT NULL,
    Email_Profissional VARCHAR(255) NOT NULL,
    CRM_Profissional VARCHAR(20) NOT NULL,
    Data_Nascimento_Profissional DATE NOT NULL,
    Genero_Profissional ENUM('Masculino', 'Feminino', 'Outro') NOT NULL,
    Nome_Profissional VARCHAR(100) NOT NULL,
    Nome_Social_Profissional VARCHAR(100),
    Fk_Id_Videos INT
);

-- Adicionando chaves estrangeiras na tabela Usuario
ALTER TABLE Usuario
ADD CONSTRAINT FK_Usuario_Assinatura
FOREIGN KEY (Fk_Id_Assinatura_Usuario) REFERENCES Assinatura_Usuario(Pk_Id_Assinatura_Usuario);

-- Adicionando chaves estrangeiras na tabela Assinatura_Usuario
ALTER TABLE Assinatura_Usuario
ADD CONSTRAINT FK_Assinatura_Usuario
FOREIGN KEY (Fk_Id_Usuario) REFERENCES Usuario(Pk_Id_Usuario),
ADD CONSTRAINT FK_Assinatura_Plano
FOREIGN KEY (Fk_Id_Plano_Usuario) REFERENCES Planos_Usuario(Pk_Id_Plano_Usuario);

-- Adicionando chaves estrangeiras na tabela Videos_Profissional
ALTER TABLE Videos_Profissional
ADD CONSTRAINT FK_Video_Profissional
FOREIGN KEY (Fk_Id_Profissional) REFERENCES Profissional(Pk_Id_Profissional);

-- Adicionando chaves estrangeiras na tabela Profissional
ALTER TABLE Profissional
ADD CONSTRAINT FK_Profissional_Video
FOREIGN KEY (Fk_Id_Videos) REFERENCES Videos_Profissional(Pk_Id_Videos);

select * from usuario;
select * from profissional;
select * from videos_profissional;
select * from planos_usuario;
select * from assinatura_usuario;
select * from pacote_videos;
-- Crie o banco de dados "oficina_automotiva"
CREATE DATABASE oficina_automotiva;

-- Use o banco de dados recém-criado
USE oficina_automotiva;

-- Crie a tabela "Clientes"
CREATE TABLE Clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    veiculo_id INT UNIQUE, -- Relação 1:1 com a tabela Veículos
    FOREIGN KEY (veiculo_id) REFERENCES Veiculos(veiculo_id)
);

-- Crie a tabela "Veiculos"
CREATE TABLE Veiculos (
    veiculo_id INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano_fabricacao INT NOT NULL,
    placa VARCHAR(15) UNIQUE NOT NULL,
    quilometragem INT,
    cor VARCHAR(30),
    cliente_id INT UNIQUE, -- Relação 1:1 com a tabela Clientes
    ordem_id INT UNIQUE, -- Relação 1:1 com a tabela Ordens_de_Servico
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (ordem_id) REFERENCES Ordens_de_Servico(ordem_id)
);

-- Crie a tabela "Ordens_de_Servico"
CREATE TABLE Ordens_de_Servico (
    ordem_id INT AUTO_INCREMENT PRIMARY KEY,
    veiculo_id INT UNIQUE, -- Relação 1:1 com a tabela Veiculos
    data_inicio DATETIME,
    data_fim DATETIME,
    descricao_servico TEXT,
    valor_total DECIMAL(10, 2)
);

-- Defina a relação 1:1 entre as tabelas Clientes e Veiculos
-- Isso garante que um cliente esteja associado a um único veículo
-- e um veículo esteja associado a um único cliente
ALTER TABLE Clientes
ADD CONSTRAINT FK_Clientes_Veiculos
FOREIGN KEY (veiculo_id) REFERENCES Veiculos(veiculo_id);

-- Defina a relação 1:1 entre as tabelas Veiculos e Ordens_de_Servico
-- Isso garante que um veículo esteja associado a uma única ordem de serviço
-- e uma ordem de serviço esteja associada a um único veículo
ALTER TABLE Veiculos
ADD CONSTRAINT FK_Veiculos_Ordens_de_Servico
FOREIGN KEY (ordem_id) REFERENCES Ordens_de_Servico(ordem_id);


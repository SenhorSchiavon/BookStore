CREATE DATABASE livrariaBooksCo;
USE livrariaBooksCo;

CREATE TABLE fornecedores (
    id_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) NOT NULL,
    contato VARCHAR(50)
);

CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor)
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    id_cliente INT,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE vendas_Livros (
    id_venda INT,
    id_livro INT,
    quantidade INT NOT NULL,
    PRIMARY KEY (id_venda, id_livro),
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_livro) REFERENCES livros(id_livro)
);

INSERT INTO fornecedores (nome, cnpj, contato) VALUES 
('Fornecedor A', '00.000.000/0001-00', 'contato@fornecedora.com'),
('Fornecedor B', '00.000.000/0002-00', 'contato@fornecedorb.com');


INSERT INTO livros (titulo, autor, preco, quantidade_estoque, id_fornecedor) VALUES 
('Livro 1', 'Autor 1', 39.90, 10, 1),
('Livro 2', 'Autor 2', 29.90, 5, 2);


INSERT INTO clientes (nome, email, telefone) VALUES 
('Cliente 1', 'cliente1@gmail.com', '11999999999'),
('Cliente 2', 'cliente2@gmail.com', '11988888888');


INSERT INTO vendas (data, id_cliente, total) VALUES 
('2024-09-03', 1, 69.80);


INSERT INTO vendas_Livros (id_venda, id_livro, quantidade) VALUES 
(1, 1, 1),
(1, 2, 2);

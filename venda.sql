/*Crie uma tabela de produtos com os seguintes campos: id, nome, descrição e preço.*/

CREATE TABLE produtos (
  id INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  descricao VARCHAR(255),
  preco DECIMAL(10,2) NOT NULL
);

/* Crie uma tabela de clientes com os seguintes campos: id, nome, e-mail e telefone. */

CREATE TABLE clientes (
  id INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  email VARCHAR(255) UNIQUE,
  telefone VARCHAR(20)
);

/*Crie uma tabela de vendas com os seguintes campos: id, data, id_produto, id_cliente e quantidade.*/

CREATE TABLE vendas (
  id INT PRIMARY KEY,
  data DATE NOT NULL,
  id_produto INT NOT NULL,
  id_cliente INT NOT NULL,
  quantidade INT NOT NULL,
  FOREIGN KEY (id_produto) REFERENCES produtos(id),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

/*Com as tabelas criadas, agora você pode inserir alguns dados de exemplo para fazer consultas SQL:*/ 

INSERT INTO produtos (id, nome, descricao, preco) VALUES
  (1, 'Camiseta', 'Camiseta de algodão', 29.99),
  (2, 'Calça', 'Calça jeans', 59.99),
  (3, 'Sapato', 'Sapato social', 99.99);

INSERT INTO clientes (id, nome, email, telefone) VALUES
  (1, 'João', 'joao@example.com', '999999999'),
  (2, 'Maria', 'maria@example.com', '888888888'),
  (3, 'Pedro', 'pedro@example.com', '777777777');

INSERT INTO vendas (id, data, id_produto, id_cliente, quantidade) VALUES
  (1, '2023-03-15', 1, 1, 2),
  (2, '2023-03-16', 2, 2, 1),
  (3, '2023-03-16', 1, 3, 1),
  (4, '2023-03-17', 3, 1, 1),
  (5, '2023-03-17', 1, 2, 3),
  (6, '2023-03-18', 2, 3, 2),
  (7, '2023-03-18', 1, 1, 1),
  (8, '2023-03-18', 3, 2, 1);

/*Agora, você pode usar consultas SQL para responder as perguntas propostas:

/* Quais produtos têm mais vendas? */

SELECT produtos.nome, SUM(vendas.quantidade) AS total_vendido
FROM vendas
JOIN produtos ON vendas.id_produto = produtos.id
GROUP BY produtos.nome
ORDER BY total_vendido DESC;

/* Qual é o período de tempo com mais vendas? */

SELECT DATE_FORMAT(data, '%m-%Y') AS mes_ano, SUM(quantidade) AS total_vendido
FROM vendas
GROUP BY mes_ano
ORDER BY total_vendido DESC;

/* Quais são os clientes mais frequentes? */ 

SELECT clientes.nome, COUNT(*) AS total_compras
FROM vendas
JOIN clientes



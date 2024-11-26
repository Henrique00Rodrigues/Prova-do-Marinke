CREATE DATABASE prova_marinke;

USE prova_marinke;

CREATE TABLE CLIENTE (
codigo_cliente INT,
nome VARCHAR(45),
anonimato VARCHAR(3),
CHECK (anonimato IN ('sim', 'nao')),
PRIMARY KEY (codigo_cliente)
);

CREATE TABLE FUNCIONARIO (
id_funcionario INT,
nome VARCHAR (45),
cargo VARCHAR (30),
PRIMARY KEY (id_funcionario)
);

CREATE TABLE MESA (
numero_mesa INT,
status VARCHAR (15),
codigo_cliente INT,
id_funcionario INT,
PRIMARY KEY (numero_mesa),
FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

CREATE TABLE PEDIDO (
numero_pedido INT PRIMARY KEY,
status VARCHAR (15),
numero_mesa INT,
data_pedido DATE,
codigo_cliente INT,
id_funcionario INT,
FOREIGN KEY (numero_mesa) REFERENCES mesa(numero_mesa),
FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente),
FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE PRODUTO (
codigo_produto INT PRIMARY KEY,
preco_unitario FLOAT,
quantidade_estoque INT,
estoque_minimmo INT,
marca VARCHAR (30)
);

CREATE TABLE PRODUTO_DO_PEDIDO (
codigo_produto_do_pedido INT PRIMARY KEY,
numero_pedido INT,
codigo_produto INT,
quantidade INT,
preco_unitario FLOAT,
valor_final FLOAT,
FOREIGN KEY (numero_pedido) REFERENCES pedido(numero_pedido),
FOREIGN KEY (codigo_produto) REFERENCES produto(codigo_produto)
);

CREATE TABLE FORMA_PAGAMENTO (
codigo_forma_pagamento INT PRIMARY KEY,
descricao VARCHAR(50)
);

CREATE TABLE FORMA_DE_PAGAMENTO_DO_PEDIDO (
codigo_formaDePagamentoDoPedido INT PRIMARY KEY,
codigo_forma_pagamento INT,
numero_pedido INT,
FOREIGN KEY (codigo_forma_pagamento) REFERENCES forma_pagamento(codigo_forma_pagamento),
FOREIGN KEY (numero_pedido) REFERENCES pedido(numero_pedido)
);
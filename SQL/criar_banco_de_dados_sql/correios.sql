show databases;

create database correios; -- criando o banco de dados chamado correios
use correios; -- usando o banco criando 

-- esses codigos só vão funcionar depois de criar as tabelas abaixo
SELECT * FROM clientes; -- mostrar a tabela clientes
SELECT * FROM pacotes; -- mostrar a tabela pacotes
SELECT * FROM agentes; -- motrar a tabela agentes
SELECT * FROM envios; -- mostrar a tabela envios
SELECT * FROM rastreamento; -- mostrar a tabela rastreamento

-- tabela cliente
CREATE TABLE clientes -- criando a tabela de clientes
(
	cli_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cli_nome VARCHAR(100) NOT NULL,
    cli_cpf varchar(11),
    cli_email VARCHAR(100),
    cli_telefone VARCHAR(20),
    cli_endereco VARCHAR(255),
    cli_cidade VARCHAR(100),
    cli_estado VARCHAR(50),
    cli_cep VARCHAR(15)
    );
create table pacotes -- criando a tabela de pacotes
(
	pac_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	pac_descricao varchar (255),
	pac_peso decimal (10,2),
	pac_dimensao decimal (10,2),
	pac_valor decimal (10,2),
	pac_cli_id int,
	foreign key (pac_cli_id) references clientes (cli_id)
);
create table agentes -- criando a tabela de agentes
(
	ag_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ag_nome varchar(100),
    ag_email varchar(100),
    ag_tel varchar (20)
);
create table envios -- criando a tabela de envios
(
	env_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    env_pac_id int,
    env_ag_id int,
    env_data_envio datetime,
    env_data_entrega datetime,
    env_status_envio varchar (100),
    foreign key (env_pac_id) references pacotes (pac_id),
    foreign key (env_ag_id) references agentes (ag_id)
);
create table rastreamento -- criando a tabela de rastreamento
(
	ras_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ras_envio_id int,
    ras_data_hora datetime,
    ras_localizacao varchar (200),
    ras_status_atual varchar(200),
    foreign key (ras_envio_id) references envios (env_id)
);
-- inserindo dados da tabela cliente
INSERT INTO clientes (cli_nome, cli_cpf, cli_email, cli_telefone, cli_endereco, cli_cidade, cli_estado, cli_cep) VALUES
('João Silva', '12345678901', 'joao.silva@example.com', '(11) 98765-4321', 'Rua A, 123', 'São Paulo', 'SP', '01234-567'),
('Maria Souza', '23456789012', 'maria.souza@example.com', '(21) 98765-4322', 'Rua B, 456', 'Rio de Janeiro', 'RJ', '01234-568'),
('Carlos Oliveira', '34567890123', 'carlos.oliveira@example.com', '(31) 98765-4323', 'Rua C, 789', 'Belo Horizonte', 'MG', '01234-569'),
('Ana Pereira', '45678901234', 'ana.pereira@example.com', '(41) 98765-4324', 'Rua D, 101', 'Curitiba', 'PR', '01234-570'),
('Pedro Santos', '56789012345', 'pedro.santos@example.com', '(51) 98765-4325', 'Rua E, 202', 'Porto Alegre', 'RS', '01234-571'),
('Marina Costa', '67890123456', 'marina.costa@example.com', '(85) 98765-4326', 'Rua F, 303', 'Fortaleza', 'CE', '01234-572'),
('Lucas Almeida', '78901234567', 'lucas.almeida@example.com', '(71) 98765-4327', 'Rua G, 404', 'Salvador', 'BA', '01234-573'),
('Juliana Lima', '89012345678', 'juliana.lima@example.com', '(61) 98765-4328', 'Rua H, 505', 'Brasília', 'DF', '01234-574'),
('Rafael Oliveira', '90123456789', 'rafael.oliveira@example.com', '(27) 98765-4329', 'Rua I, 606', 'Vitória', 'ES', '01234-575'),
('Patrícia Souza', '01234567890', 'patricia.souza@example.com', '(19) 98765-4330', 'Rua J, 707', 'Campinas', 'SP', '01234-576'),
('Fernando Almeida', '12345678902', 'fernando.almeida@example.com', '(11) 98765-4331', 'Rua K, 808', 'São Paulo', 'SP', '01234-577'),
('Camila Costa', '23456789013', 'camila.costa@example.com', '(21) 98765-4332', 'Rua L, 909', 'Rio de Janeiro', 'RJ', '01234-578'),
('Daniel Pereira', '34567890124', 'daniel.pereira@example.com', '(31) 98765-4333', 'Rua M, 111', 'Belo Horizonte', 'MG', '01234-579'),
('Aline Santos', '45678901235', 'aline.santos@example.com', '(41) 98765-4334', 'Rua N, 222', 'Curitiba', 'PR', '01234-580'),
('Ricardo Lima', '56789012346', 'ricardo.lima@example.com', '(51) 98765-4335', 'Rua O, 333', 'Porto Alegre', 'RS', '01234-581');

-- inserindo dados da tabela pacotes
INSERT INTO pacotes (pac_descricao, pac_peso, pac_dimensao, pac_valor, pac_cli_id) VALUES
('Pacote de Livros', 2.5, 30.0, 50.00, 1),
('Pacote de Eletrônicos', 1.8, 25.0, 200.00, 2),
('Pacote de Roupas', 3.2, 40.0, 150.00, 3),
('Pacote de Brinquedos', 1.5, 20.0, 80.00, 4),
('Pacote de Alimentos', 4.0, 35.0, 120.00, 5),
('Pacote de Ferramentas', 5.0, 50.0, 300.00, 6),
('Pacote de Decoração', 2.0, 28.0, 90.00, 7),
('Pacote de Esportes', 3.5, 45.0, 250.00, 8),
('Pacote de Cosméticos', 1.2, 18.0, 70.00, 9),
('Pacote de Joias', 0.5, 10.0, 500.00, 10),
('Pacote de Móveis', 20.0, 150.0, 1000.00, 11),
('Pacote de Eletrodomésticos', 15.0, 120.0, 800.00, 12),
('Pacote de Instrumentos Musicais', 8.0, 100.0, 600.00, 13),
('Pacote de Artigos de Papelaria', 1.0, 15.0, 40.00, 14),
('Pacote de Produtos de Limpeza', 3.0, 30.0, 60.00, 15);

-- inserindo dados da tabela agentes
INSERT INTO agentes (ag_nome, ag_email, ag_tel) VALUES
('Agente A', 'agente.a@example.com', '(11) 91234-5678'),
('Agente B', 'agente.b@example.com', '(21) 91234-5679'),
('Agente C', 'agente.c@example.com', '(31) 91234-5680'),
('Agente D', 'agente.d@example.com', '(41) 91234-5681'),
('Agente E', 'agente.e@example.com', '(51) 91234-5682'),
('Agente F', 'agente.f@example.com', '(85) 91234-5683'),
('Agente G', 'agente.g@example.com', '(71) 91234-5684'),
('Agente H', 'agente.h@example.com', '(61) 91234-5685'),
('Agente I', 'agente.i@example.com', '(27) 91234-5686'),
('Agente J', 'agente.j@example.com', '(19) 91234-5687'),
('Agente K', 'agente.k@example.com', '(11) 91234-5688'),
('Agente L', 'agente.l@example.com', '(21) 91234-5689'),
('Agente M', 'agente.m@example.com', '(31) 91234-5690'),
('Agente N', 'agente.n@example.com', '(41) 91234-5691'),
('Agente O', 'agente.o@example.com', '(51) 91234-5692');

-- inserindo dados da tabela envios
INSERT INTO envios (env_pac_id, env_ag_id, env_data_envio, env_data_entrega, env_status_envio) VALUES
(1, 1, '2023-10-01 08:00:00', '2023-10-05 10:00:00', 'Entregue'),
(2, 2, '2023-10-02 09:00:00', '2023-10-06 11:00:00', 'Entregue'),
(3, 3, '2023-10-03 10:00:00', '2023-10-07 12:00:00', 'Entregue'),
(4, 4, '2023-10-04 11:00:00', '2023-10-08 13:00:00', 'Entregue'),
(5, 5, '2023-10-05 12:00:00', '2023-10-09 14:00:00', 'Entregue'),
(6, 6, '2023-10-06 13:00:00', '2023-10-10 15:00:00', 'Entregue'),
(7, 7, '2023-10-07 14:00:00', '2023-10-11 16:00:00', 'Entregue'),
(8, 8, '2023-10-08 15:00:00', '2023-10-12 17:00:00', 'Entregue'),
(9, 9, '2023-10-09 16:00:00', '2023-10-13 18:00:00', 'Entregue'),
(10, 10, '2023-10-10 17:00:00', '2023-10-14 19:00:00', 'Entregue'),
(11, 11, '2023-10-11 18:00:00', '2023-10-15 20:00:00', 'Entregue'),
(12, 12, '2023-10-12 19:00:00', '2023-10-16 21:00:00', 'Entregue'),
(13, 13, '2023-10-13 20:00:00', '2023-10-17 22:00:00', 'Entregue'),
(14, 14, '2023-10-14 21:00:00', '2023-10-18 23:00:00', 'Entregue'),
(15, 15, '2023-10-15 22:00:00', '2023-10-19 00:00:00', 'Entregue');

-- inserindo dados da tabela rastreamento

INSERT INTO rastreamento (ras_envio_id, ras_data_hora, ras_localizacao, ras_status_atual) VALUES
(1, '2023-10-01 08:00:00', 'São Paulo, SP', 'Pacote postado'),
(1, '2023-10-02 09:00:00', 'Campinas, SP', 'Em trânsito'),
(1, '2023-10-03 10:00:00', 'Ribeirão Preto, SP', 'Em trânsito'),
(1, '2023-10-04 11:00:00', 'Uberlândia, MG', 'Em trânsito'),
(1, '2023-10-05 10:00:00', 'Belo Horizonte, MG', 'Entregue'),
(2, '2023-10-02 09:00:00', 'Rio de Janeiro, RJ', 'Pacote postado'),
(2, '2023-10-03 10:00:00', 'São Gonçalo, RJ', 'Em trânsito'),
(2, '2023-10-04 11:00:00', 'Niterói, RJ', 'Em trânsito'),
(2, '2023-10-05 12:00:00', 'Nova Friburgo, RJ', 'Em trânsito'),
(2, '2023-10-06 11:00:00', 'Petrópolis, RJ', 'Entregue'),
(3, '2023-10-03 10:00:00', 'Belo Horizonte, MG', 'Pacote postado'),
(3, '2023-10-04 11:00:00', 'Contagem, MG', 'Em trânsito'),
(3, '2023-10-05 12:00:00', 'Betim, MG', 'Em trânsito'),
(3, '2023-10-06 13:00:00', 'Ibirité, MG', 'Em trânsito'),
(3, '2023-10-07 12:00:00', 'Santa Luzia, MG', 'Entregue'),
(4, '2023-10-04 11:00:00', 'Curitiba, PR', 'Pacote postado'),
(4, '2023-10-05 12:00:00', 'Pinhais, PR', 'Em trânsito'),
(4, '2023-10-06 13:00:00', 'Colombo, PR', 'Em trânsito'),
(4, '2023-10-07 14:00:00', 'Almirante Tamandaré, PR', 'Em trânsito'),
(4, '2023-10-08 13:00:00', 'Piraquara, PR', 'Entregue'),
(5, '2023-10-05 12:00:00', 'Porto Alegre, RS', 'Pacote postado'),
(5, '2023-10-06 13:00:00', 'Canoas, RS', 'Em trânsito'),
(5, '2023-10-07 14:00:00', 'Gravataí, RS', 'Em trânsito'),
(5, '2023-10-08 15:00:00', 'Viamão, RS', 'Em trânsito'),
(5, '2023-10-09 14:00:00', 'Novo Hamburgo, RS', 'Entregue'),
(6, '2023-10-06 13:00:00', 'Fortaleza, CE', 'Pacote postado'),
(6, '2023-10-07 14:00:00', 'Caucaia, CE', 'Em trânsito'),
(6, '2023-10-08 15:00:00', 'Maracanaú, CE', 'Em trânsito'),
(6, '2023-10-09 16:00:00', 'Maranguape, CE', 'Em trânsito'),
(6, '2023-10-10 15:00:00', 'Aquiraz, CE', 'Entregue'),
(7, '2023-10-07 14:00:00', 'Salvador, BA', 'Pacote postado'),
(7, '2023-10-08 15:00:00', 'Feira de Santana, BA', 'Em trânsito'),
(7, '2023-10-09 16:00:00', 'Vitória da Conquista, BA', 'Em trânsito'),
(7, '2023-10-10 17:00:00', 'Camaçari, BA', 'Em trânsito'),
(7, '2023-10-11 16:00:00', 'Juazeiro, BA', 'Entregue'),
(8, '2023-10-08 15:00:00', 'Brasília, DF', 'Pacote postado'),
(8, '2023-10-09 16:00:00', 'Águas Claras, DF', 'Em trânsito'),
(8, '2023-10-10 17:00:00', 'Taguatinga, DF', 'Em trânsito'),
(8, '2023-10-11 18:00:00', 'Planaltina, DF', 'Em trânsito'),
(8, '2023-10-12 17:00:00', 'Ceilândia, DF', 'Entregue'),
(9, '2023-10-09 16:00:00', 'Vitória, ES', 'Pacote postado'),
(9, '2023-10-10 17:00:00', 'Serra, ES', 'Em trânsito'),
(9, '2023-10-11 18:00:00', 'Cariacica, ES', 'Em trânsito'),
(9, '2023-10-12 19:00:00', 'Vila Velha, ES', 'Em trânsito'),
(9, '2023-10-13 18:00:00', 'Cachoeiro de Itapemirim, ES', 'Entregue'),
(10, '2023-10-10 17:00:00', 'Campinas, SP', 'Pacote postado'),
(10, '2023-10-11 18:00:00', 'Sumaré, SP', 'Em trânsito'),
(10, '2023-10-12 19:00:00', 'Hortolândia, SP', 'Em trânsito'),
(10, '2023-10-13 20:00:00', 'Paulínia, SP', 'Em trânsito'),
(10, '2023-10-14 19:00:00', 'Valinhos, SP', 'Entregue'),
(11, '2023-10-11 18:00:00', 'São Paulo, SP', 'Pacote postado'),
(11, '2023-10-12 19:00:00', 'Guarulhos, SP', 'Em trânsito'),
(11, '2023-10-13 20:00:00', 'Santo André, SP', 'Em trânsito'),
(11, '2023-10-14 21:00:00', 'São Bernardo do Campo, SP', 'Em trânsito'),
(11, '2023-10-15 20:00:00', 'Osasco, SP', 'Entregue'),
(12, '2023-10-12 19:00:00', 'Rio de Janeiro, RJ', 'Pacote postado'),
(12, '2023-10-13 20:00:00', 'Duque de Caxias, RJ', 'Em trânsito'),
(12, '2023-10-14 21:00:00', 'Nova Iguaçu, RJ', 'Em trânsito'),
(12, '2023-10-15 22:00:00', 'Belford Roxo, RJ', 'Em trânsito'),
(12, '2023-10-16 21:00:00', 'Niterói, RJ', 'Entregue'),
(13, '2023-10-13 20:00:00', 'Belo Horizonte, MG', 'Pacote postado'),
(13, '2023-10-14 21:00:00', 'Contagem, MG', 'Em trânsito'),
(13, '2023-10-15 22:00:00', 'Betim, MG', 'Em trânsito'),
(13, '2023-10-16 23:00:00', 'Juiz de Fora, MG', 'Em trânsito'),
(13, '2023-10-17 22:00:00', 'Montes Claros, MG', 'Entregue'),
(14, '2023-10-14 21:00:00', 'Curitiba, PR', 'Pacote postado'),
(14, '2023-10-15 22:00:00', 'Londrina, PR', 'Em trânsito'),
(14, '2023-10-16 23:00:00', 'Maringá, PR', 'Em trânsito'),
(14, '2023-10-17 00:00:00', 'Ponta Grossa, PR', 'Em trânsito'),
(14, '2023-10-18 23:00:00', 'Cascavel, PR', 'Entregue'),
(15, '2023-10-15 22:00:00', 'Porto Alegre, RS', 'Pacote postado'),
(15, '2023-10-16 23:00:00', 'Caxias do Sul, RS', 'Em trânsito'),
(15, '2023-10-17 00:00:00', 'Pelotas, RS', 'Em trânsito'),
(15, '2023-10-18 01:00:00', 'Canoas, RS', 'Em trânsito'),
(15, '2023-10-19 00:00:00', 'Santa Maria, RS', 'Entregue');

-- consultar Consultar o número de pacotes enviados por cliente
SELECT cli_id, cli_nome, COUNT(pac_id) AS numero_de_pacotes
FROM clientes
LEFT JOIN pacotes ON cli_id = pac_cli_id
GROUP BY cli_id, cli_nome;

-- Consultar o status de todos os envios de um cliente específico:
SELECT e.env_id, p.pac_descricao, e.env_status_envio, e.env_data_envio, e.env_data_entrega
FROM envios e
JOIN pacotes p ON e.env_pac_id = p.pac_id
WHERE p.pac_cli_id = 1; -- Substitua 1 pelo ID do cliente desejado

-- Consultar todos os pacotes com peso maior que 2kg:
SELECT pac_id, pac_descricao, pac_peso
FROM pacotes
WHERE pac_peso > 2.0;

-- Consultar todos os pacotes de um cliente específico, incluindo o rastreamento:
SELECT p.pac_id, p.pac_descricao, r.ras_data_hora, r.ras_localizacao, r.ras_status_atual
FROM pacotes p
JOIN envios e ON p.pac_id = e.env_pac_id
JOIN rastreamento r ON e.env_id = r.ras_envio_id
WHERE p.pac_cli_id = 1; -- Substitua 1 pelo ID do cliente desejado

-- Consultar todos os pacotes entregues após uma data específica:
SELECT p.pac_id, p.pac_descricao, e.env_data_entrega
FROM pacotes p
JOIN envios e ON p.pac_id = e.env_pac_id
WHERE e.env_status_envio = 'Entregue' AND e.env_data_entrega > '2023-10-10'; -- Substitua pela data desejada

-- Atualizar o valor de um pacote específico:
UPDATE pacotes
SET pac_valor = 100.00 -- Substitua pelo novo valor
WHERE pac_id = 1; -- Substitua 1 pelo ID do pacote desejado

-- Atualizar o status de um envio específico:
UPDATE envios
SET env_status_envio = 'Em trânsito' -- Substitua pelo novo status
WHERE env_id = 1; -- Substitua 1 pelo ID do envio desejado

-- Atualizar o telefone de um cliente:
UPDATE clientes
SET cli_telefone = '(11) 99999-9999' -- Substitua pelo novo telefone
WHERE cli_id = 1; -- Substitua 1 pelo ID do cliente desejado

-- Excluir um envio específico:
DELETE FROM rastreamento WHERE ras_envio_id = 15;
DELETE FROM envios WHERE env_id = 15;


-- Excluir um rastreamento específico:
DELETE FROM rastreamento
WHERE ras_id = 1; -- Substitua 1 pelo ID do rastreamento desejado


-- Criar banco de dados
CREATE DATABASE IF NOT EXISTS imoveis_db;
USE imoveis_db;

-- Tabela de tipos de imóvel
CREATE TABLE tipo_imovel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

INSERT INTO tipo_imovel (nome) VALUES
('Apartamento'),
('Casa'),
('Sala Comercial'),
('Galpão');

CREATE TABLE imovel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_imovel INT NOT NULL,
    descricao_imovel VARCHAR(255) NOT NULL,
    id_tipo INT,
    FOREIGN KEY (id_tipo) REFERENCES tipo_imovel(id)
);

INSERT INTO imovel (codigo_imovel, descricao_imovel, id_tipo) VALUES
(1001, 'Apartamento 80m² em condomínio fechado', 1),
(1002, 'Apartamento 120m² frente mar', 1),
(2001, 'Casa 3 quartos em bairro residencial', 2),
(2002, 'Casa 5 quartos com piscina', 2),
(3001, 'Sala Comercial 40m² no centro', 3),
(3002, 'Sala Comercial 100m² coworking', 3),
(4001, 'Galpão logístico 500m²', 4),
(4002, 'Galpão industrial 1200m²', 4);

CREATE TABLE pagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_do_pagamento DATE NOT NULL,
    valor_do_pagamento DECIMAL(10,2) NOT NULL,
    id_imovel INT,
    FOREIGN KEY (id_imovel) REFERENCES imovel(id)
);

INSERT INTO pagamento (data_do_pagamento, valor_do_pagamento, id_imovel) VALUES
-- Agosto 2023
('2023-08-10', 5000.00, 1),
('2023-08-15', 6200.00, 2),
('2023-08-20', 4500.00, 3),
('2023-08-22', 7500.00, 4),
('2023-08-25', 3200.00, 5),
('2023-08-28', 4100.00, 6),

-- Setembro 2023
('2023-09-05', 8000.00, 7),
('2023-09-07', 15000.00, 8),
('2023-09-12', 5200.00, 1),
('2023-09-14', 6000.00, 3),
('2023-09-18', 9800.00, 5),
('2023-09-22', 7200.00, 6),

-- Outubro 2023
('2023-10-02', 5100.00, 2),
('2023-10-06', 11200.00, 4),
('2023-10-10', 4300.00, 7),
('2023-10-15', 3000.00, 8),
('2023-10-20', 6200.00, 1),
('2023-10-25', 4800.00, 5),

-- Novembro 2023
('2023-11-01', 10500.00, 2),
('2023-11-03', 3900.00, 3),
('2023-11-07', 8700.00, 4),
('2023-11-12', 3300.00, 6),
('2023-11-18', 7600.00, 7),
('2023-11-22', 5400.00, 8),

-- Dezembro 2023
('2023-12-05', 9500.00, 1),
('2023-12-08', 4200.00, 3),
('2023-12-13', 11800.00, 5),
('2023-12-18', 6500.00, 6),
('2023-12-22', 13200.00, 7),
('2023-12-28', 7800.00, 8);

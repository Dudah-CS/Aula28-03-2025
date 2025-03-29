-- Criando o banco de dados 
CREATE DATABASE Empresa; 
USE Empresa;

-- Criando a tabela de Departamentos 
CREATE TABLE Departamentos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL 
    );

-- Criando a tabela de Cargos 
CREATE TABLE Cargos ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    nivel VARCHAR(50) NOT NULL 
    );
    
-- Criando a tabela de Funcionários 
CREATE TABLE Funcionarios ( 
    id INT PRIMARY KEY AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL, 
    data_nascimento DATE NOT NULL, 
    salario DECIMAL(10,2) NOT NULL, 
    departamento_id INT NOT NULL, 
    cargo_id INT NOT NULL, 
    FOREIGN KEY (departamento_id) REFERENCES Departamentos(id), 
    FOREIGN KEY (cargo_id) REFERENCES Cargos(id) 
);

-- Inserindo dados na tabela Departamentos 
INSERT INTO Departamentos (nome) VALUES ('TI'), ('RH'), ('Financeiro'), ('Marketing'), ('Vendas');

-- Inserindo dados na tabela Cargos 
INSERT INTO Cargos (nome, nivel) VALUES 
('Analista', 'Pleno'), 
('Gerente', 'Sênior'), 
('Assistente', 'Júnior'), 
('Coordenador', 'Sênior'), 
('Desenvolvedor', 'Pleno');

-- Inserindo dados na tabela Funcionarios 
INSERT INTO Funcionarios (nome, data_nascimento, salario, departamento_id, cargo_id) VALUES 
('Ana Silva', '1985-06-15', 5500.00, 1, 5), 
('Carlos Santos', '1990-03-22', 4800.00, 2, 1), 
('Bruna Costa', '1987-12-10', 6000.00, 3, 2), 
('Daniel Oliveira', '1992-08-05', 5200.00, 1, 5), 
('Fernanda Lima', '1995-09-30', 4500.00, 2, 3), 
('Gustavo Souza', '1980-01-25', 7000.00, 3, 2), 
('Helena Martins', '1983-11-17', 5300.00, 1, 4), 
('Igor Ferreira', '1991-07-08', 4900.00, 2, 1), 
('Juliana Rocha', '1989-04-19', 5600.00, 3, 2), 
('Lucas Mendes', '1993-06-23', 5100.00, 1, 5);

 select * from Funcionarios;

-- ======= EXERCICIOS ======= 

-- 1 Encontre o maior salario
SELECT MAX(salario)as MaiorSalario 
FROM Funcionarios;

-- 2 Encontre o menor salario
SELECT MIN(salario)as MenorSalario 
FROM Funcionarios;

-- 3 Qual a quantidadde de funcionarios?
SELECT COUNT(nome)as QuantidadeFun 
FROM Funcionarios;

-- 4 Filtre os funcionarios nascidos a partir de 1990
SELECT id, nome, data_nascimento
FROM Funcionarios
WHERE data_nascimento LIKE '%1990%';-- Esta buscando todos que tem o ano igual a 1990

-- 5 Encotre a media salarial
SELECT AVG(salario)as MediaFun 
FROM Funcionarios;

-- 6 Extraia os 3 primeiros caracteres do nome
SELECT SUBSTRING(nome,1,3)
FROM Funcionarios;

-- 7 contar quantos funcionarios por departamento
-- join
SELECT COUNT(*) as QtFuncEmDep, d.nome
from Funcionarios f
join Departamentos d ON f.departamento_id = d.id
GROUP BY d.nome;

-- 8 contar quantos funcionarios existem em cargo
-- join
SELECT COUNT(*) as QtFuncEmCargo, c.nome
from Funcionarios f
join Cargos c ON f.cargo_id = c.id
GROUP BY c.nome;
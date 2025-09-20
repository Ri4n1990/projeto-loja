CREATE DATABASE IF NOT EXISTS loja
character set utf8mb4
default character set utf8mb4;

use loja;

CREATE TABLE IF NOT EXISTS cliente(

	cpf VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(256) NOT NULL,
    email VARCHAR(256) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero ENUM("Masculino", "Feminino"),
    telefone VARCHAR(11) NOT NULL






) charset = utf8mb4;

CREATE TABLE IF NOT EXISTS produto(

	cod_produto VARCHAR(13) PRIMARY KEY,
    nome_produto VARCHAR(256) NOT NULL,
    preco DECIMAL NOT NULL,
    qtd_estoque INT NOT NULL,
    marca VARCHAR(50),
    telefone VARCHAR(11)




) charset = utf8mb4;



CREATE TABLE IF NOT EXISTS compra(
	
    id_venda VARCHAR(20) PRIMARY KEY,
    qtd INT NOT NULL,
    valor_total DECIMAL NOT NULL,
    data_compra DATE NOT NULL,
    tipo_pagamento VARCHAR(50) NOT NULL,
    cpf_cliente VARCHAR(11) NOT NULL,
    cod_produto VARCHAR(13) NOT NULL,
    CONSTRAINT fk_compra_produto
    FOREIGN KEY(cod_produto) REFERENCES produto(cod_produto)
    ON DELETE CASCADE,
    CONSTRAINT fk_compra_cliente
    FOREIGN KEY(cpf_cliente) REFERENCES cliente(cpf)
    ON DELETE CASCADE
    
    




) charset = utf8mb4;


INSERT INTO cliente (cpf, nome, email, data_nascimento, genero, telefone) VALUES
('11111111111', 'Ana Souza', 'ana.souza@gmail.com', '1990-05-12', 'Feminino', '51998765432'),
('22222222222', 'Carlos Silva', 'carlos.silva@gmail.com', '1985-03-20', 'Masculino', '51991234567'),
('33333333333', 'Mariana Oliveira', 'mariana.oliveira@gmail.com', '1992-07-08', 'Feminino', '51997654321'),
('44444444444', 'João Pereira', 'joao.pereira@gmail.com', '1988-11-15', 'Masculino', '51993456789'),
('55555555555', 'Fernanda Costa', 'fernanda.costa@gmail.com', '1995-09-30', 'Feminino', '51994561234'),
('66666666666', 'Paulo Almeida', 'paulo.almeida@gmail.com', '1983-06-02', 'Masculino', '51992345678'),
('77777777777', 'Juliana Santos', 'juliana.santos@gmail.com', '1991-12-22', 'Feminino', '51996789012'),
('88888888888', 'Ricardo Lima', 'ricardo.lima@gmail.com', '1987-08-14', 'Masculino', '51997890123'),
('99999999999', 'Camila Rocha', 'camila.rocha@gmail.com', '1993-02-18', 'Feminino', '51993451234'),
('10101010101', 'Felipe Martins', 'felipe.martins@gmail.com', '1989-10-25', 'Masculino', '51995678901'),
('12121212121', 'Gabriela Araujo', 'gabriela.araujo@gmail.com', '1994-07-19', 'Feminino', '51995432123'),
('13131313131', 'Rodrigo Ribeiro', 'rodrigo.ribeiro@gmail.com', '1986-03-10', 'Masculino', '51996781234'),
('14141414141', 'Patrícia Gomes', 'patricia.gomes@gmail.com', '1991-11-30', 'Feminino', '51999876543'),
('15151515151', 'Thiago Moreira', 'thiago.moreira@gmail.com', '1987-06-25', 'Masculino', '51993458976'),
('16161616161', 'Larissa Fernandes', 'larissa.fernandes@gmail.com', '1992-04-02', 'Feminino', '51991239876'),
('17171717171', 'Bruno Barbosa', 'bruno.barbosa@gmail.com', '1984-12-12', 'Masculino', '51997659876'),
('18181818181', 'Amanda Teixeira', 'amanda.teixeira@gmail.com', '1993-09-05', 'Feminino', '51994561239'),
('19191919191', 'Lucas Cardoso', 'lucas.cardoso@gmail.com', '1988-07-07', 'Masculino', '51997654389'),
('20202020202', 'Débora Castro', 'debora.castro@gmail.com', '1990-01-14', 'Feminino', '51993457890'),
('21212121212', 'André Melo', 'andre.melo@gmail.com', '1985-08-18', 'Masculino', '51994562345'),
('22232323232', 'Cláudia Correia', 'claudia.correia@gmail.com', '1991-05-22', 'Feminino', '51997893456'),
('23232323232', 'Eduardo Batista', 'eduardo.batista@gmail.com', '1987-02-28', 'Masculino', '51993458901'),
('24242424242', 'Sofia Pires', 'sofia.pires@gmail.com', '1992-06-06', 'Feminino', '51997651234'),
('25252525252', 'Marcelo Duarte', 'marcelo.duarte@gmail.com', '1989-03-03', 'Masculino', '51994563456'),
('26262626262', 'Renata Nunes', 'renata.nunes@gmail.com', '1994-12-09', 'Feminino', '51997894567'),
('27272727272', 'Gustavo Reis', 'gustavo.reis@gmail.com', '1986-10-15', 'Masculino', '51993454567'),
('28282828282', 'Aline Carvalho', 'aline.carvalho@gmail.com', '1993-01-20', 'Feminino', '51994569876'),
('29292929292', 'Daniel Moura', 'daniel.moura@gmail.com', '1988-08-08', 'Masculino', '51997653456'),
('30303030303', 'Vanessa Brito', 'vanessa.brito@gmail.com', '1991-09-29', 'Feminino', '51993455678'),
('31313131313', 'Mateus Faria', 'mateus.faria@gmail.com', '1990-11-01', 'Masculino', '51994566789'),
('32323232323', 'Letícia Prado', 'leticia.prado@gmail.com', '1995-06-15', 'Feminino', '51997657890'),
('34343434343', 'Rafaela Mendes', 'rafaela.mendes@gmail.com', '1992-03-25', 'Feminino', '51994569812'),
('35353535353', 'Diego Cunha', 'diego.cunha@gmail.com', '1984-05-30', 'Masculino', '51997653412'),
('36363636363', 'Natália Lopes', 'natalia.lopes@gmail.com', '1993-07-11', 'Feminino', '51993451289'),
('37373737373', 'Henrique Rocha', 'henrique.rocha@gmail.com', '1989-09-17', 'Masculino', '51994567891'),
('38383838383', 'Bruna Carvalho', 'bruna.carvalho@gmail.com', '1994-04-08', 'Feminino', '51997654329'),
('39393939393', 'Pedro Henrique', 'pedro.henrique@gmail.com', '1988-02-02', 'Masculino', '51993457829'),
('40404040404', 'Carolina Ramos', 'carolina.ramos@gmail.com', '1991-12-30', 'Feminino', '51994569829'),
('41414141414', 'Vitor Almeida', 'vitor.almeida@gmail.com', '1990-06-21', 'Masculino', '51997658912'),
('42424242424', 'Mariana Cunha', 'mariana.cunha@gmail.com', '1992-01-09', 'Feminino', '51993458912'),
('43434343434', 'Guilherme Souza', 'guilherme.souza@gmail.com', '1987-03-27', 'Masculino', '51994561278'),
('44444444445', 'Elaine Rocha', 'elaine.rocha@gmail.com', '1995-08-16', 'Feminino', '51997659891'),
('45454545454', 'Ronaldo Lima', 'ronaldo.lima@gmail.com', '1989-07-05', 'Masculino', '51993456712'),
('46464646464', 'Tatiane Gomes', 'tatiane.gomes@gmail.com', '1993-02-14', 'Feminino', '51994567812'),
('47474747474', 'Marcelo Vieira', 'marcelo.vieira@gmail.com', '1986-09-23', 'Masculino', '51997658934'),
('48484848484', 'Simone Moreira', 'simone.moreira@gmail.com', '1992-10-12', 'Feminino', '51993459834'),
('49494949494', 'Alexandre Torres', 'alexandre.torres@gmail.com', '1988-11-11', 'Masculino', '51994561234'),
('50505050505', 'Isabela Cunha', 'isabela.cunha@gmail.com', '1994-05-11', 'Feminino', '51996547890');


INSERT INTO produto (cod_produto, nome_produto, preco, qtd_estoque, marca) VALUES
('7891000000011', 'Notebook Dell Inspiron 15', 3500.00, 20, 'Dell'),
('7891000000028', 'Smartphone Samsung Galaxy S22', 4200.00, 35, 'Samsung'),
('7891000000035', 'Smart TV LG 55"', 2800.00, 15, 'LG'),
('7891000000042', 'Geladeira Brastemp Frost Free', 3100.00, 10, 'Brastemp'),
('7891000000059', 'Micro-ondas Electrolux 20L', 450.00, 50, 'Electrolux'),
('7891000000066', 'Notebook Lenovo IdeaPad 3', 2900.00, 18, 'Lenovo'),
('7891000000073', 'Smartphone iPhone 14', 6200.00, 12, 'Apple'),
('7891000000080', 'Fone Bluetooth JBL Tune 510BT', 350.00, 40, 'JBL'),
('7891000000097', 'Console Playstation 5', 4800.00, 8, 'Sony'),
('7891000000103', 'Cadeira Gamer ThunderX3', 1200.00, 25, 'ThunderX3'),
('7891000000110', 'Notebook Acer Aspire 5', 3100.00, 20, 'Acer'),
('7891000000127', 'Smartphone Motorola Edge 30', 2700.00, 30, 'Motorola'),
('7891000000134', 'TV Samsung 65" 4K', 4500.00, 12, 'Samsung'),
('7891000000141', 'Geladeira Consul Duplex', 2500.00, 14, 'Consul'),
('7891000000158', 'Fogão Atlas 4 Bocas', 1200.00, 22, 'Atlas'),
('7891000000165', 'Tablet Apple iPad 9', 2800.00, 16, 'Apple'),
('7891000000172', 'Caixa de Som Alexa Echo Dot', 400.00, 40, 'Amazon'),
('7891000000189', 'Impressora HP Deskjet 2776', 650.00, 18, 'HP'),
('7891000000196', 'Monitor LG UltraWide 29"', 1200.00, 15, 'LG'),
('7891000000202', 'Cafeteira Nespresso Essenza', 700.00, 28, 'Nespresso'),
('7891000000219', 'Ventilador Arno Turbo Silence', 280.00, 50, 'Arno'),
('7891000000226', 'Ar Condicionado Split 12000 BTUs', 2200.00, 12, 'LG'),
('7891000000233', 'Notebook Samsung Book', 3300.00, 14, 'Samsung'),
('7891000000240', 'Smartphone Xiaomi Redmi Note 11', 1600.00, 26, 'Xiaomi'),
('7891000000257', 'Caixa de Som JBL Flip 6', 700.00, 32, 'JBL'),
('7891000000264', 'Relógio Smartwatch Apple Watch 8', 3500.00, 10, 'Apple'),
('7891000000271', 'Máquina de Lavar Electrolux 11kg', 2400.00, 11, 'Electrolux'),
('7891000000288', 'Roteador TP-Link Archer AX50', 600.00, 25, 'TP-Link'),
('7891000000295', 'HD Externo Seagate 2TB', 480.00, 30, 'Seagate'),
('7891000000301', 'SSD Kingston 480GB', 320.00, 35, 'Kingston'),
('7891000000318', 'Placa de Vídeo RTX 3060', 2400.00, 8, 'Nvidia'),
('7891000000325', 'Fonte Corsair 650W', 550.00, 20, 'Corsair'),
('7891000000332', 'Teclado Mecânico Redragon Kumara', 280.00, 40, 'Redragon'),
('7891000000349', 'Mouse Gamer Logitech G203', 160.00, 50, 'Logitech'),
('7891000000356', 'Câmera Canon EOS Rebel T7', 2800.00, 9, 'Canon'),
('7891000000363', 'Bicicleta Caloi Aro 29', 1500.00, 15, 'Caloi'),
('7891000000370', 'Patinete Elétrico Xiaomi', 2200.00, 12, 'Xiaomi'),
('7891000000387', 'Aspirador de Pó Electrolux PowerSpeed', 700.00, 18, 'Electrolux'),
('7891000000394', 'Notebook HP Pavilion', 3400.00, 14, 'HP'),
('7891000000400', 'Smartphone Realme 9 Pro+', 2100.00, 22, 'Realme'),
('7891000000417', 'Kindle Paperwhite 11ª Geração', 600.00, 30, 'Amazon'),
('7891000000424', 'Caixa de Som Sony SRS-XB43', 1100.00, 14, 'Sony'),
('7891000000431', 'Console Xbox Series X', 4700.00, 9, 'Microsoft'),
('7891000000448', 'Máquina Fotográfica GoPro Hero 10', 2500.00, 10, 'GoPro'),
('7891000000455', 'Smart TV Philips 50"', 2300.00, 12, 'Philips'),
('7891000000462', 'Headset HyperX Cloud II', 650.00, 20, 'HyperX'),
('7891000000479', 'Soundbar Samsung 5.1', 1900.00, 8, 'Samsung'),
('7891000000486', 'Notebook Asus VivoBook 15', 3000.00, 15, 'Asus'),
('7891000000493', 'Smartphone Oppo Reno 7', 2100.00, 10, 'Oppo'),
('7891000000509', 'Monitor Dell 27" 144Hz', 1800.00, 12, 'Dell');



INSERT INTO compra (id_venda, qtd, valor_total, data_compra, tipo_pagamento, cpf_cliente, cod_produto) VALUES
('V00001', 1, 3500.00, '2025-01-10', 'Cartão de Crédito', '11111111111', '7891000000011'),
('V00002', 2, 8400.00, '2025-01-12', 'Pix', '22222222222', '7891000000028'),
('V00003', 1, 2800.00, '2025-01-15', 'Boleto', '33333333333', '7891000000035'),
('V00004', 1, 3100.00, '2025-01-18', 'Cartão de Débito', '44444444444', '7891000000042'),
('V00005', 3, 1350.00, '2025-01-20', 'Pix', '55555555555', '7891000000059'),
('V00006', 1, 2900.00, '2025-01-25', 'Cartão de Crédito', '66666666666', '7891000000066'),
('V00007', 1, 6200.00, '2025-02-01', 'Pix', '77777777777', '7891000000073'),
('V00008', 2, 700.00, '2025-02-05', 'Boleto', '88888888888', '7891000000080'),
('V00009', 1, 4800.00, '2025-02-07', 'Cartão de Crédito', '99999999999', '7891000000097'),
('V00010', 1, 1200.00, '2025-02-10', 'Pix', '10101010101', '7891000000103'),
('V00011', 1, 3100.00, '2025-02-12', 'Pix', '12121212121', '7891000000110'),
('V00012', 1, 2700.00, '2025-02-13', 'Cartão de Crédito', '13131313131', '7891000000127'),
('V00013', 1, 4500.00, '2025-02-14', 'Pix', '14141414141', '7891000000134'),
('V00014', 1, 2500.00, '2025-02-15', 'Boleto', '15151515151', '7891000000141'),
('V00015', 2, 2400.00, '2025-02-16', 'Pix', '16161616161', '7891000000158'),
('V00016', 1, 2800.00, '2025-02-17', 'Pix', '17171717171', '7891000000165'),
('V00017', 2, 800.00, '2025-02-18', 'Cartão de Débito', '18181818181', '7891000000172'),
('V00018', 1, 650.00, '2025-02-19', 'Cartão de Crédito', '19191919191', '7891000000189'),
('V00019', 1, 1200.00, '2025-02-20', 'Pix', '20202020202', '7891000000196'),
('V00020', 1, 700.00, '2025-02-21', 'Boleto', '21212121212', '7891000000202'),
('V00021', 2, 560.00, '2025-02-22', 'Pix', '22232323232', '7891000000219'),
('V00022', 1, 2200.00, '2025-02-23', 'Pix', '23232323232', '7891000000226'),
('V00023', 1, 3300.00, '2025-02-24', 'Cartão de Crédito', '24242424242', '7891000000233'),
('V00024', 1, 1600.00, '2025-02-25', 'Pix', '25252525252', '7891000000240'),
('V00025', 2, 1400.00, '2025-02-26', 'Cartão de Débito', '26262626262', '7891000000257'),
('V00026', 1, 3500.00, '2025-02-27', 'Cartão de Crédito', '27272727272', '7891000000264'),
('V00027', 1, 2400.00, '2025-02-28', 'Pix', '28282828282', '7891000000271'),
('V00028', 1, 600.00, '2025-03-01', 'Pix', '29292929292', '7891000000288'),
('V00029', 2, 960.00, '2025-03-02', 'Pix', '30303030303', '7891000000295'),
('V00030', 1, 320.00, '2025-03-03', 'Boleto', '31313131313', '7891000000301'),
('V00031', 1, 2400.00, '2025-03-04', 'Pix', '32323232323', '7891000000318'),
('V00032', 1, 550.00, '2025-03-05', 'Pix', '33333333333', '7891000000325'),
('V00033', 2, 560.00, '2025-03-06', 'Pix', '34343434343', '7891000000332'),
('V00034', 1, 160.00, '2025-03-07', 'Cartão de Débito', '35353535353', '7891000000349'),
('V00035', 1, 2800.00, '2025-03-08', 'Pix', '36363636363', '7891000000356'),
('V00036', 1, 1500.00, '2025-03-09', 'Pix', '37373737373', '7891000000363'),
('V00037', 1, 2200.00, '2025-03-10', 'Cartão de Crédito', '38383838383', '7891000000370'),
('V00038', 1, 700.00, '2025-03-11', 'Pix', '39393939393', '7891000000387'),
('V00039', 1, 3400.00, '2025-03-12', 'Pix', '40404040404', '7891000000394'),
('V00040', 1, 2100.00, '2025-03-13', 'Cartão de Crédito', '41414141414', '7891000000400'),
('V00041', 1, 600.00, '2025-03-14', 'Pix', '42424242424', '7891000000417'),
('V00042', 1, 1100.00, '2025-03-15', 'Pix', '43434343434', '7891000000424'),
('V00043', 1, 4700.00, '2025-03-16', 'Cartão de Débito', '44444444445', '7891000000431'),
('V00044', 1, 2500.00, '2025-03-17', 'Pix', '45454545454', '7891000000448'),
('V00045', 1, 2300.00, '2025-03-18', 'Pix', '46464646464', '7891000000455'),
('V00046', 1, 650.00, '2025-03-19', 'Pix', '47474747474', '7891000000462'),
('V00047', 1, 1900.00, '2025-03-20', 'Pix', '48484848484', '7891000000479'),
('V00048', 1, 3000.00, '2025-03-21', 'Cartão de Crédito', '49494949494', '7891000000486'),
('V00049', 1, 2100.00, '2025-03-22', 'Pix', '50505050505', '7891000000493'),
('V00050', 1, 1800.00, '2025-03-23', 'Boleto', '11111111111', '7891000000509');

INSERT INTO compra (id_venda, qtd, valor_total, data_compra, tipo_pagamento, cpf_cliente, cod_produto) VALUES
('V00060', '1', '1800', '2025-03-23', 'Boleto', '11111111111', '7891000000509'),
('V00061', '2', '6000', '2025-03-23', 'Cartão de Crédito', '22222222222', '7891000000486'),
('V00062', '1', '4700', '2025-03-23', 'Pix', '33333333333', '7891000000431'),
('V00063', '3', '3300', '2025-03-23', 'Cartão de Débito', '44444444444', '7891000000240'),
('V00064', '1', '3500', '2025-03-23', 'Pix', '55555555555', '7891000000011'),
('V00065', '2', '8400', '2025-03-23', 'Boleto', '66666666666', '7891000000073'),
('V00066', '1', '1200', '2025-03-23', 'Cartão de Crédito', '77777777777', '7891000000103'),
('V00067', '2', '5600', '2025-03-23', 'Pix', '88888888888', '7891000000110'),
('V00068', '1', '2800', '2025-03-23', 'Cartão de Débito', '99999999999', '7891000000066'),
('V00069', '1', '4500', '2025-03-23', 'Pix', '10101010101', '7891000000134'),
('V00070', '2', '6200', '2025-03-23', 'Cartão de Crédito', '12121212121', '7891000000127'),
('V00071', '1', '2500', '2025-03-23', 'Boleto', '13131313131', '7891000000141'),
('V00072', '3', '8400', '2025-03-23', 'Pix', '14141414141', '7891000000158'),
('V00073', '1', '2800', '2025-03-23', 'Cartão de Débito', '15151515151', '7891000000165'),
('V00074', '2', '800', '2025-03-23', 'Pix', '16161616161', '7891000000219'),
('V00075', '1', '700', '2025-03-23', 'Cartão de Crédito', '17171717171', '7891000000202'),
('V00076', '1', '4800', '2025-03-23', 'Boleto', '18181818181', '7891000000097'),
('V00077', '2', '9400', '2025-03-23', 'Pix', '19191919191', '7891000000028'),
('V00078', '1', '3100', '2025-03-23', 'Cartão de Débito', '20202020202', '7891000000042'),
('V00079', '3', '1050', '2025-03-23', 'Boleto', '21212121212', '7891000000080');



select distinct data_compra from compra  ;






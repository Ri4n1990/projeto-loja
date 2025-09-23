from sqlalchemy import ForeignKey
from sqlalchemy.orm import DeclarativeBase, Mapped, MappedColumn, Relationship
from sqlalchemy.types import Integer, String, DATE, Enum, DECIMAL
from typing import List




class Base(DeclarativeBase):
    pass


class Cliente(Base):
    __tablename__ = 'cliente'

    cpf : Mapped[str] = MappedColumn(String(11), primary_key = True)
    nome : Mapped[str] = MappedColumn(String(256), nullable = False)
    email : Mapped[str] = MappedColumn(String(256), nullable = False)
    data_nascimento  = MappedColumn(DATE)
    genero =  MappedColumn(Enum('Masculino', 'Feminino'))
    telefone : Mapped[str] = MappedColumn(String(11), nullable = False)

    compra : Mapped[List["Compra"]] = Relationship(back_populates= 'cliente')


    def __repr__(self):
        return f'cpf : {self.cpf} , nome : {self.nome} , email : {self.email} , data_nascimento : {self.data_nascimento} , genero : {self.genero} , telefone : {self.telefone}'
    

class Compra(Base):
    __tablename__ = 'compra'

    id_venda : Mapped[str] = MappedColumn(String(20), primary_key = True)
    qtd  : Mapped[int] = MappedColumn(nullable = False)
    valor_total = MappedColumn(DECIMAL(10,0), nullable = False)
    data_compra = MappedColumn(DATE, nullable = False)
    tipo_pagamento : Mapped[str] = MappedColumn(String(50), nullable = False)
    cpf_cliente : Mapped[str] = MappedColumn(String(11), ForeignKey('cliente.cpf'),nullable = False)
    cod_produto : Mapped[str] = MappedColumn(String(13), ForeignKey('produto.cod_produto'), nullable = False)

    cliente : Mapped[List["Cliente"]] = Relationship(back_populates= 'compra')
    produto  :Mapped[List["Produto"]] = Relationship(back_populates= 'compra')


    def __repr__(self):
        return f'id_venda : {self.id_venda} , qtd : {self.qtd} , valor_total : {self.valor_total} , data_compra : {self.data_compra} , tipo_pagamento : {self.tipo_pagamento} , cpf_cliente : {self.cpf_cliente} , cod_produto : {self.cod_produto}'




class Produto(Base):
    __tablename__ = 'produto'

    cod_produto : Mapped[str] = MappedColumn(String(13), primary_key = True)
    nome_produto : Mapped[str] = MappedColumn(String(256), nullable = False)
    preco = MappedColumn(DECIMAL)
    qtd_estoque : Mapped[int] = MappedColumn(nullable = False)
    marca : Mapped[str] = MappedColumn(String(50))
    telefone : Mapped[str] = MappedColumn(String(11))

    compra : Mapped[List["Compra"]] = Relationship(back_populates = 'produto')


    def __repr__(self):
        return f'cod_produto : {self.cod_produto} , nome_produto : {self.nome_produto} , preco : {self.preco} , qtd_estoque : {self.qtd_estoque} , marca : {self.marca} , telefone : {self.telefone}'







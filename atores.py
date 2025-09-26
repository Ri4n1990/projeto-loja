from banco import conexao_bd as bd
from banco import models as md
from sqlalchemy.orm import Session
from sqlalchemy.exc import NoResultFound

class Adm:
    def __init__(self):
        pass

    def __verifica_cliente(self,cpf):
        try:
            session = Session(bd.engine)

        except Exception(NoResultFound):
            pass

    def criar(self,dados):
        pass

    def excluir(self,cpf):
        pass

    def atualizar(self,dados,cpf):
        pass


dados_cli = {"cpf" : "04922014047" , "nome" : "Rian magnus" , "email" : "rianmagnus5791@gmail.com" , "data_nascimento" : "2004-01-03" , "genero" : "", "telefone" : "51993746389"}


no = Adm()


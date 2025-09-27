from nis import match

from banco import conexao_bd as bd
from banco import models as md
from sqlalchemy import select
from sqlalchemy.orm import Session
from sqlalchemy.exc import NoResultFound



class Adm:
    def __init__(self):
        pass

    def __verifica_cliente(self,cpf):
        try:
            session = Session(bd.engine)

            stmt = select(md.Cliente).filter(md.Cliente.cpf == cpf)

            session.execute(stmt).one()

            session.close()

            return 409

        except(NoResultFound):
            session.close()
            return 200
        
        except:
            session.close()
            return 500
            
    def criar(self,dados):

        resposta = self.__verifica_cliente(dados['cpf'])

        match resposta:

            case 409:
                return 409

            case 200:
                try:
                    session = Session(bd.engine)

                    novo_cliente = md.Cliente( cpf = dados['cpf'], nome = dados['nome'], email = dados['email'] , data_nascimento = dados['data_nascimento'] , genero = dados['genero'] , telefone = dados['telefone'] )

                    session.add(novo_cliente)

                    session.commit()

                    session.close()

                    return 201

                    
                except Exception as erro:
                    session.rollback()
                    print('algo saiu errado!', erro)
                    session.close()
                    return 500

            case 500:
                return 500

    def excluir(self,cpf):

        try:
            session = Session(bd.engine)

            cliente = session.get(md.Cliente,cpf)

            if not cliente:
                return 404
            
            session.delete(cliente)
            session.commit()
            session.close()

            return 204
    
        except Exception as erro:

            session.rollback()
            print('Algo saiu errado!', erro)
            session.close()

            return 500
        

    def atualizar(self,dados,cpf):

        try:
            session = Session(bd.engine)

            pass
            # aqui





            session.close()
        except:
            pass


dados_cli = {"cpf" : "04922014040" , "nome" : "Rian magnus" , "email" : "rianmagnus5791@gmail.com" , "data_nascimento" : "2004-01-03" , "genero" : None, "telefone" : "51993746389"}


no = Adm()




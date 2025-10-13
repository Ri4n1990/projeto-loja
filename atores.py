from banco import conexao_bd as bd
from banco import models as md
from sqlalchemy import select
from sqlalchemy.orm import Session
from sqlalchemy.exc import NoResultFound
import json

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

    def obter_clientes(self):

        try:
            session = Session(bd.engine)

            stmt = select(md.Cliente)

            result = session.execute(stmt).all()

            registros = []

            for lin in result:
                dados = {"cpf":lin[0].cpf, "nome" : lin[0].nome , "email": lin[0].email, "data_nascimento" : lin[0].data_nascimento.strftime("%d/%m/%Y") , "genero" : lin[0].genero, "telefone" : lin[0].telefone }
                registros.append(dados)
            

            session.close()
            
            regi_json = json.dumps(registros)

            return regi_json


        except Exception as erro:
            session.close()
            print('Algo saiu errado!', erro)
            return 500


    def cliente(self, cpf):
        try:
            session = Session(bd.engine)

            cliente = session.get(md.Cliente, cpf)

            if(not cliente):
                return 404
            
            dados = {'cpf' : cliente.cpf, 'nome' : cliente.nome, 'email' : cliente.email, 'nascimento' : cliente.data_nascimento.strftime("%Y-%m-%d"), 'genero' : cliente.genero, 'telefone' : cliente.telefone}

            session.close()
            

            return dados



        
        except Exception as erro:
            session.close()
            print('algo saiu errado' , erro)
            return 500

    def criar(self,dados):

        resposta = self.__verifica_cliente(dados['cpf'])

        match resposta:

            case 409:
                return 409

            case 200:
                try:
                    session = Session(bd.engine)

                    novo_cliente = md.Cliente( cpf = dados['cpf'], nome = dados['nome'], email = dados['email'] , data_nascimento = dados['nascimento'] , genero = dados['genero'] , telefone = dados['telefone'] )

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
            cliente = session.get(md.Cliente,cpf)

            if not cliente:
                return 404

            
            for k , v in dados.items():
                if hasattr(cliente, k):
                    setattr(cliente, k, v )
                    
            session.commit()

            session.close()

            return 201


        except Exception as erro:
            session.rollback()
            session.close()
            print('Algo saiu errado', erro)
            return 500






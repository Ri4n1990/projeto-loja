from app import app
from flask import render_template
from conexao_bd import engine
from sqlalchemy import select
from sqlalchemy.orm import Session
from models import Cliente, Produto, Compra



@app.route('/')
def inicio():

    try:
        conn  = Session(engine)
        stmt = (select(Cliente.nome, Cliente.cpf, Produto.nome_produto, Compra.qtd, Compra.valor_total)
                .select_from(Cliente)
                .join(Compra, Cliente.cpf == Compra.cpf_cliente)
                .join(Produto, Compra.cod_produto == Produto.cod_produto)
                
                
                
                
                
                )
        result = conn.execute(stmt)

        for row in result:
            print(row)
        
        conn.close()

    except Exception as erro:
        print(f'erro ao tentar executar a query {erro}')


    

    return render_template('pagina_inicial.html')



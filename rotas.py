from app import app
from flask import render_template
from banco import conexao_bd as bd
from sqlalchemy import select
from sqlalchemy.orm import Session
from banco import  models as md



@app.route('/')
def inicio():

    try:
        conn  = Session(bd.engine)
        stmt = (select(md.Cliente.nome, md.Cliente.cpf, md.Produto.nome_produto, md.Compra.qtd, md.Compra.valor_total)
                .select_from(md.Cliente)
                .join(md.Compra, md.Cliente.cpf == md.Compra.cpf_cliente)
                .join(md.Produto, md.Compra.cod_produto == md.Produto.cod_produto)
                
                
                
                )
        result = conn.execute(stmt)

        for row in result:
            print(row)
        
        conn.close()

    except Exception as erro:
        print(f'erro ao tentar executar a query {erro}')


    

    return render_template('pagina_inicial.html')



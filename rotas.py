from app import app
from flask import render_template, request
from banco import conexao_bd as bd
from sqlalchemy.orm import Session
from banco import  models as md
from atores import Adm


@app.route('/')
def inicio():

    return render_template('pagina_inicial.html')


@app.route('/clientes')
def obter_clientes():

    try:
        admin = Adm()
        clientes = admin.obter_clientes()

        if clientes == 500:
            return "Erro ao tentar obter os dados", 500
        
        return clientes, 200

    except Exception as erro:
        print('algo saiu errado' , erro)



@app.route('/cliente',methods = ['POST'])
def novo_cliente():

    try:
        dados = request.get_json()
        admin = Adm()
        resposta = admin.criar(dados)

        return "" , resposta
        
    except Exception as erro:
        print('algo saiu errado!', erro)
        return 500
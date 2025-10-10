from app import app
from flask import render_template, request
from banco import conexao_bd as bd
from sqlalchemy.orm import Session
from banco import  models as md
from atores import Adm
import re
from datetime import date

from time import sleep

@app.route('/')
def inicio():

    try:
        caminho = 'icones'
        caminho_visual = 'visuais'

        icones = [

            f'{caminho}/editar.png',
            f'{caminho}/add_cliente.png',
            f'{caminho}/delete.png'


        ]

        visuais = [
            f'{caminho_visual}/load.gif',
            f'{caminho_visual}/erro.gif'

        ]

        caminho_script = 'scripts/interacao_pg_inicial.js'
        
        
        return render_template('pagina_inicial.html', estilo = 'estilo_inicial.css', icones = icones, script = caminho_script, visuais = visuais)

        
    except Exception as erro:
        print('algo saiu errado', erro)
        return "", 500


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
        return 500



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



@app.route('/cliente/<cpf>', methods = ['PATCH'])
def atualizar_cliente(cpf):

    try:

        cpf = str(cpf)
        str_regex = r"^\d{11}$"
        teste = bool(re.search(str_regex , cpf))
        
        if not teste:
            return "", 400

        dados = request.get_json()

        admin = Adm()

        resposta = admin.atualizar(dados, cpf)

        return  "" , resposta


    except Exception as erro:
        print(f'Algo saiu errado {erro}')
        return "" , 500



@app.route('/cliente/<cpf>' , methods = ['DELETE'])
def excluir_cliente(cpf):

    try:
        cpf = str(cpf)
        rege = r'^\d{11}$'
        teste = re.search(rege, cpf)

        if not teste:
            return "" , 400
        
        admin = Adm()

        resposta = admin.excluir(cpf)

        return  "", resposta
        

    except Exception as erro:
        print('Algo saiu errado!')
        return "", 500



@app.route('/pagina_add_cliente')
def criacao_cliente():
    data = date.today().isoformat()
    estilo = 'estilo_criacao.css'
    verificacao = 'scripts/verificacao_add_cliente.js'
    return render_template('pagina_criar_cliente.html', estilo = estilo, data = data, verificacao = verificacao)



@app.route('/pg_atualizar_cliente/<cpf>')
def pg_atualizar(cpf):
    
    estilo = 'estilo_atualizacao.css'
    verificacao = 'scripts/verificacao_add_cliente.js'
    interacao = 'scripts/interacao_atualizar.js'

    return render_template('pagina_atualizar_cliente.html', estilo = estilo , verificacao = verificacao, interacao = interacao)


@app.errorhandler(404)
def erro404(e):
    estilo = 'estilo_pg_erro404.css'
    visual = 'visuais/erro404.jpg'
    return render_template('pg_erro404.html', estilo = estilo, visual = visual)
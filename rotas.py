from app import app
from flask import render_template
from conexao_bd import engine
from sqlalchemy import text


@app.route('/')
def inicio():

    conn =  engine.connect()
    result = conn.execute(text('select * from cliente'))

    for row in result:
        print(row)

    conn.close()

    return render_template('pagina_inicial.html')



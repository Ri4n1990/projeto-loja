from configuracoes_bd import var_bd
from sqlalchemy import create_engine



try:
    engine = create_engine(var_bd)
    with engine.connect() as conn:
        print('Banco conectado...')
        

except Exception as erro:
    print(f'ERRRO AO TENTAR SE CONECTAR COM O BANCO! {erro}')




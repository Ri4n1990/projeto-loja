from banco import configuracoes_bd as bd
from sqlalchemy import create_engine



try:
    engine = create_engine(bd.var_bd)
    with engine.connect() as conn:
        print('Banco conectado...')
        

except Exception as erro:
    print(f'ERRRO AO TENTAR SE CONECTAR COM O BANCO! {erro}')




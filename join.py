import mysql.connector

CONFIG = {
    "host": "localhost",
    "port": 3306,
    "user": "root",
    "password": "Eagleclub23.",
    "database": "imoveis_db",
}

QUERY = """
SELECT 
    p.id              AS id_venda,
    p.data_do_pagamento,
    p.valor_do_pagamento,
    i.codigo_imovel,
    i.descricao_imovel,
    t.nome            AS tipo_imovel
FROM pagamento p
JOIN imovel i      ON i.id = p.id_imovel
JOIN tipo_imovel t ON t.id = i.id_tipo
ORDER BY p.data_do_pagamento;
"""

def main():
    try:
        conn = mysql.connector.connect(**CONFIG)
        cur = conn.cursor(dictionary=True)
        cur.execute(QUERY)
        rows = cur.fetchall()

        # IMPRESSÃO
        print(f"Total de linhas: {len(rows)}")
        for r in rows[:10]:
            print(r)

        # Se caso eu quiser ver tudo, só retirar o "[:10]" como no exemplo abaixo:
        # for r in rows:
        #     print(r) 

        cur.close()
        conn.close()
    except Error as e:
        print("Erro:", e)

if __name__ == "__main__":
    main()

# 🏠 Hands On Work VII — Consulta a Banco de Dados com Python

Este repositório contém a entrega da **Parte 1** da atividade *Hands On Work VII* do curso de **Análise e Desenvolvimento de Sistemas** da **UNIVALI**.

O projeto implementa a criação de um banco de dados relacional (MySQL), a inserção de registros e a consulta via linguagem de programação (**Python**), conforme solicitado no enunciado da disciplina.

---

## 📑 Estrutura do Projeto

- **Banco de Dados (`imoveis_db`)**
  - `tipo_imovel` → guarda os tipos de imóveis (Apartamento, Casa, Sala Comercial, Galpão).
  - `imovel` → armazena os imóveis cadastrados, vinculados a um tipo.
  - `pagamento` → contém os registros de pagamentos realizados, vinculados a um imóvel.

- **Python**
  - Conexão com MySQL usando `mysql.connector`.
  - Execução da query com **JOIN** para retornar a estrutura solicitada no enunciado.
  - Impressão de resultados no terminal (limitando a 10 registros para demonstração).

---

## 🗄️ Estrutura das Tabelas

### Tabela `tipo_imovel`
| Campo | Tipo        | Descrição               |
|-------|-------------|-------------------------|
| id    | INT (PK)    | Identificador do tipo   |
| nome  | VARCHAR(50) | Nome do tipo de imóvel  |

### Tabela `imovel`
| Campo           | Tipo          | Descrição                        |
|-----------------|---------------|----------------------------------|
| id              | INT (PK)      | Identificador do imóvel          |
| codigo_imovel   | INT           | Código único do imóvel           |
| descricao_imovel| VARCHAR(255)  | Descrição do imóvel              |
| id_tipo         | INT (FK)      | Relaciona ao tipo de imóvel      |

### Tabela `pagamento`
| Campo            | Tipo           | Descrição                        |
|------------------|----------------|----------------------------------|
| id               | INT (PK)       | Identificador do pagamento       |
| data_do_pagamento| DATE           | Data em que o pagamento ocorreu  |
| valor_do_pagamento| DECIMAL(10,2) | Valor pago                       |
| id_imovel        | INT (FK)       | Relaciona ao imóvel              |

---

## 💾 População Inicial

- **8 imóveis cadastrados** em diferentes categorias.
- **30 pagamentos registrados** distribuídos em **5 meses distintos** (Agosto a Dezembro/2023).
- Cada imóvel possui ao menos um pagamento associado.

---

## 🔎 Consulta SQL (JOIN)

A consulta utilizada retorna a estrutura solicitada no enunciado:

```sql
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

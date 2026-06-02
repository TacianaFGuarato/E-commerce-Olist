# Modelagem de Dados

## Estrutura do Modelo

O projeto foi desenvolvido utilizando uma modelagem dimensional baseada em Star Schema, com algumas características de Snowflake Schema para suportar informações geográficas e relacionamentos auxiliares.

### Tabela Fato

**Fato Pedidos**

* order_id
* customer_id
* product_id
* seller_id
* order_purchase_timestamp
* freight_value
* price

### Tabelas Dimensão

**Dim Clientes**

* customer_id
* customer_city
* customer_state

**Dim Produtos**

* product_id
* product_category_name

**Dim Vendedores**

* seller_id
* seller_city
* seller_state

**Dim Calendário**

* Data
* Ano
* Mês
* Trimestre

## Relacionamentos

* Dim Clientes (1) → (N) Fato Pedidos
* Dim Produtos (1) → (N) Fato Pedidos
* Dim Vendedores (1) → (N) Fato Pedidos
* Dim Calendário (1) → (N) Fato Pedidos


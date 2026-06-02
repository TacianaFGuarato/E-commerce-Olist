#  Análise Logística e de Satisfação dos Clientes - Olist

##  Sobre o Projeto

Este projeto tem como objetivo analisar o desempenho logístico da Olist entre os anos de 2016 e 2018, identificando padrões de entrega, atrasos, participação regional, avaliações dos clientes e oportunidades de melhoria nos processos.

O dashboard foi desenvolvido no Power BI utilizando modelagem dimensional, transformações no Power Query e medidas DAX para construção dos indicadores de negócio.

---

##  Objetivos da Análise

* Avaliar a evolução dos pedidos ao longo do tempo.
* Identificar os principais estados e cidades em volume de vendas.
* Analisar o percentual de pedidos entregues dentro e fora do prazo.
* Mensurar o lead time total e suas etapas.
* Avaliar o impacto dos processos logísticos na satisfação dos clientes.
* Identificar oportunidades de melhoria operacional.

---

##  Principais Indicadores

* Total de Pedidos
* Clientes Atendidos
* Valor Total de Frete
* Lead Time Médio
* Pedidos Entregues no Prazo
* Pedidos Atrasados
* Avaliação Média dos Clientes
* Participação por Estado e Cidade

---

## Principais Insights

### Crescimento Operacional

Observou-se crescimento significativo do volume de pedidos entre 2016 e 2018, demonstrando a expansão da operação da Olist durante o período analisado.

### Performance Logística

A maior parcela do lead time está concentrada nas etapas de postagem e transporte até o cliente final, representando o maior impacto no tempo total do processo.

### Entregas

A maior parte dos pedidos foi entregue dentro do prazo prometido, indicando boa previsibilidade logística.

### Satisfação dos Clientes

Mesmo com um bom índice de entregas dentro do prazo, foram identificadas avaliações negativas associadas a etapas específicas do processo logístico, sugerindo oportunidades de melhoria na experiência do cliente.

### Distribuição Geográfica

Determinados estados concentram grande parte da demanda, influenciando diretamente o volume de fretes e a operação logística.

---

## Ferramentas Utilizadas

* Power BI
* Power Query (Linguagem M)
* DAX
* Modelagem Dimensional
* GitHub

---

## Estrutura do Projeto

```text
Projeto-Olist/
│
├── Dashboard/
│   └── Dashboard_Olist.pbix
│
├── Scripts/
│   ├── PowerQuery.md
│   ├── MedidasDAX.md
│   └── Modelagem.md
│
├── Imagens/
│   ├── dashboard.png
│   └── modelo_dados.png
│
└── README.md
```

---

## Modelagem de Dados

O modelo foi construído com abordagem dimensional baseada em Star Schema, contendo tabelas fato e dimensões para suportar análises temporais, geográficas e operacionais.

Principais entidades:

* Pedidos
* Clientes
* Produtos
* Vendedores
* Avaliações
* Calendário

---


##  Resultados

A análise permitiu identificar gargalos no processo logístico, compreender o comportamento dos clientes e apoiar decisões relacionadas à melhoria da eficiência operacional e da experiência de compra.

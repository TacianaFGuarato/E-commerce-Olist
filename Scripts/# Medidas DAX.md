# Medidas DAX

## Percentuais 
Calcula a participação de determinado critério sobre outro

### % Frete sobre Produto = 
DIVIDE(
    SUM(olist_order_items_dataset[valor_frete]),
    SUM(olist_order_items_dataset[preço])
)

### % Participação Frete = 
DIVIDE(
    SUM(olist_order_items_dataset[valor_frete]),
    CALCULATE(
        SUM(olist_order_items_dataset[valor_frete]),
        ALL(olist_order_items_dataset)
    )
)

### % Participação Pedidos = 
DIVIDE(
    DISTINCTCOUNT(olist_order_items_dataset[order_id]),
    CALCULATE(
        DISTINCTCOUNT(olist_order_items_dataset[order_id]),
        ALL(olist_order_items_dataset)
    )
)

### % Pedidos Adiantados = 
DIVIDE(
CALCULATE(
    COUNTROWS(olist_orders_dataset),
    olist_orders_dataset[Status Prazo] = "Adiantado"),
    COUNTROWS(olist_orders_dataset))

### % Pedidos Atrasados = 
DIVIDE(
CALCULATE(
    COUNTROWS(olist_orders_dataset),
    olist_orders_dataset[Status Prazo] = "Atrasado"), 
    COUNTROWS(olist_orders_dataset))

### % Variação Ano Anterior = 
VAR _AnoAnterior =
    CALCULATE(
        [Contagem Distinta de ID],
        SAMEPERIODLASTYEAR('Calendario'[Date])
    )

RETURN
DIVIDE(
    [Contagem Distinta de ID] - _AnoAnterior,
    _AnoAnterior
)

### Percentual do etapa 1 e lead time = 
DIVIDE([Média Segundos - Etapa 1],[Média Segundos - Lead Time])

### Percentual do etapa 2 e lead time = 
DIVIDE([Média Segundos - Etapa 2],[Média Segundos - Lead Time])

### Percentual do etapa 3 e lead time = 
DIVIDE([Média Segundos - Etapa 3],[Média Segundos - Lead Time])

## contagem de ID

### Contagem Distinta de ID = DISTINCTCOUNT(olist_order_items_dataset[order_id])

## medidas de tempo
Transfoma os segundo no formato desejado, como: horas e dias

### Média Segundos - Etapa 1 = 
AVERAGE(olist_orders_dataset[tempo duração - etapa 1])

### Média Segundos - Etapa 2 = 
AVERAGE(olist_orders_dataset[tempo duração - etapa 2])

### Média Segundos - Etapa 3 = 
AVERAGE(olist_orders_dataset[tempo duração - etapa 3])

### Média Segundos - Lead Time = 

IF(
    [Contagem Distinta de ID] >= 20,
    AVERAGE(olist_orders_dataset[Lead Time Total])
)

### Média Formato em Dias - Etapa 1 = 

VAR vTotal = [Média Segundos - Etapa 1]

VAR vDias =
    INT(vTotal / 86400)

VAR vHoras =
    INT(MOD(vTotal,86400) / 3600)

VAR vMinutos =
    INT(MOD(vTotal,3600) / 60)

VAR vSegundos =
    MOD(vTotal,60)

RETURN
FORMAT(vDias,"00")
& " dias "

### Média Formato em Dias - Etapa 2 = 

VAR vTotal = [Média Segundos - Etapa 2]

VAR vDias =
    INT(vTotal / 86400)

VAR vHoras =
    INT(MOD(vTotal,86400) / 3600)

VAR vMinutos =
    INT(MOD(vTotal,3600) / 60)

VAR vSegundos =
    MOD(vTotal,60)

RETURN
FORMAT(vDias,"00")
& " dias "

### Média Formato em Dias - Etapa 3 = 

VAR vTotal = [Média Segundos - Etapa 3]

VAR vDias =
    INT(vTotal / 86400)

VAR vHoras =
    INT(MOD(vTotal,86400) / 3600)

VAR vMinutos =
    INT(MOD(vTotal,3600) / 60)

VAR vSegundos =
    MOD(vTotal,60)

RETURN
FORMAT(vDias,"00")
& " dias "

### Média Formato em Dias - lead time = 

VAR vTotal = [Média Segundos - Lead Time]

VAR vDias =
    INT(vTotal / 86400)

VAR vHoras =
    INT(MOD(vTotal,86400) / 3600)

VAR vMinutos =
    INT(MOD(vTotal,3600) / 60)

VAR vSegundos =
    MOD(vTotal,60)

RETURN
FORMAT(vDias,"00")
& " dias "

## rankigs 

### Ranking Estados Clientes = 
RANKX(
    ALL(olist_customers_dataset[customer_state]),
    [Contagem Distinta de ID],
    ,
    DESC,
    DENSE
)

### Ranking Estados Vendedores = 
RANKX(
    ALL(olist_sellers_dataset[seller_state]),
    [Contagem Distinta de ID],
    ,
    DESC,
    DENSE
)
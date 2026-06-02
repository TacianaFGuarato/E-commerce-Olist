
# olist_orders_dataset #

let
    Fonte = Csv.Document(File.Contents("C:\Users\tacia\Downloads\Dados Olist\olist_orders_dataset.csv"),[Delimiter=",", Columns=8, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    #"Cabeçalhos Promovidos" = Table.PromoteHeaders(Fonte, [PromoteAllScalars=true]),
    #"Tipo Alterado" = Table.TransformColumnTypes(#"Cabeçalhos Promovidos",{{"order_id", type text}, {"customer_id", type text}, {"order_status", type text}, {"order_purchase_timestamp", type datetime}, {"order_approved_at", type datetime}, {"order_delivered_carrier_date", type datetime}, {"order_delivered_customer_date", type datetime}, {"order_estimated_delivery_date", type datetime}}),
    #"Colunas Renomeadas" = Table.RenameColumns(#"Tipo Alterado",{{"order_purchase_timestamp", "dt_compra_pedido"}, {"order_approved_at", "dt_pedido_aprovado"}, {"order_delivered_carrier_date", "dt_entrega_transportadora"}, {"order_delivered_customer_date", "dt_entrega_pedido_cliente"}, {"order_estimated_delivery_date", "dt_estimada_entrega"}}),
    #"Personalização Adicionada" = Table.AddColumn(#"Colunas Renomeadas", "tempo duração - etapa 1", each Duration.TotalSeconds([dt_pedido_aprovado] - [dt_compra_pedido])),
    #"Personalização Adicionada1" = Table.AddColumn(#"Personalização Adicionada", "tempo duração - etapa 2", each let
    Diferenca = try Duration.TotalSeconds([dt_entrega_pedido_cliente] - [dt_entrega_transportadora]) otherwise null
in
    if Diferenca = null or Diferenca < 0 
    then 0 
    else Diferenca),
    #"Personalização Adicionada2" = Table.AddColumn(#"Personalização Adicionada1", "tempo duração - etapa 3", each let
    Diferenca = try Duration.TotalSeconds ([dt_estimada_entrega] - [dt_entrega_pedido_cliente])otherwise null
in
    if Diferenca = null then 0
    else if Diferenca < 0 then -1
    else Diferenca),
    #"Tipo Alterado1" = Table.TransformColumnTypes(#"Personalização Adicionada2",{{"tempo duração - etapa 1", Int64.Type}, {"tempo duração - etapa 2", Int64.Type}, {"tempo duração - etapa 3", Int64.Type}}),
    #"Coluna Duplicada" = Table.DuplicateColumn(#"Tipo Alterado1", "dt_compra_pedido", "dt_compra_pedido - Copiar"),
    #"Tipo Alterado2" = Table.TransformColumnTypes(#"Coluna Duplicada",{{"dt_compra_pedido - Copiar", type date}}),
    #"Colunas Renomeadas1" = Table.RenameColumns(#"Tipo Alterado2",{{"dt_compra_pedido - Copiar", "Data link - calendário"}}),
    #"Colunas Reordenadas" = Table.ReorderColumns(#"Colunas Renomeadas1",{"order_id", "customer_id", "order_status", "Data link - calendário", "dt_compra_pedido", "dt_pedido_aprovado", "dt_entrega_transportadora", "dt_entrega_pedido_cliente", "dt_estimada_entrega", "tempo duração - etapa 1", "tempo duração - etapa 2", "tempo duração - etapa 3"}),
    #"Personalização Adicionada3" = Table.AddColumn(#"Colunas Reordenadas", "Lead Time Total", each [#"tempo duração - etapa 1"] + [#"tempo duração - etapa 2"] + [#"tempo duração - etapa 3"]),
    #"Tipo Alterado3" = Table.TransformColumnTypes(#"Personalização Adicionada3",{{"Lead Time Total", Int64.Type}})
in
    #"Tipo Alterado3"

# Olist_order_items_dataset #

let
    Fonte = Csv.Document(File.Contents("C:\Users\tacia\Downloads\Dados Olist\olist_order_items_dataset.csv"),[Delimiter=",", Columns=7, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Cabeçalhos Promovidos" = Table.PromoteHeaders(Fonte, [PromoteAllScalars=true]),
    #"Tipo Alterado" = Table.TransformColumnTypes(#"Cabeçalhos Promovidos",{{"order_id", type text}, {"order_item_id", Int64.Type}, {"product_id", type text}, {"seller_id", type text}, {"shipping_limit_date", type datetime}, {"price", Int64.Type}, {"freight_value", Int64.Type}}),
    #"Colunas Renomeadas" = Table.RenameColumns(#"Tipo Alterado",{{"shipping_limit_date", "dt_limite_envio"}, {"price", "preço"}, {"freight_value", "valor_frete"}}),
    #"Duplicatas Removidas" = Table.Distinct(#"Colunas Renomeadas", {"order_id"})
in
    #"Duplicatas Removidas"
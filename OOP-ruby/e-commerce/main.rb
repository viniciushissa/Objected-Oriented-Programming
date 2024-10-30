require_relative 'lib\carrinho_de_compras'
require_relative 'lib\cliente'
require_relative 'lib\metodo_de_pagamento'
require_relative 'lib\pagamento'
require_relative 'lib\pedido'
require_relative 'lib\produto'

produto1 = Produto.new("Celular", 1200.0, 10)
produto2 = Produto.new("Fone de Ouvido", 150.0, 20)

cliente = Cliente.new("João", "Rua A, 123")

carrinho = CarrinhoDeCompras.new(cliente)
carrinho.adicionar_produto(produto1, 1)
carrinho.adicionar_produto(produto2, 2)

pedido = Pedido.new(cliente)
carrinho.produtos.each {|item| pedido.adicionar_produto(item[:produto], item[:quantidade])}
cliente.adicionar_pedido(pedido)

metodo = MetodoDePagamento.new("Cartão de Crédito")
pagamento = Pagamento.new(pedido.calcular_total, metodo)
pagamento.realizar_pagamento

cliente.ver_historico
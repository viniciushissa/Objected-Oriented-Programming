require_relative 'lib/bebida'
require_relative 'lib/carne'
require_relative 'lib/carrinho'
require_relative 'lib/cliente'
require_relative 'lib/higiene'
require_relative 'lib/padaria'


produto1 = Higiene.new("Shampoo", 15.0, 20)
produto2 = Bebidas.new("Refrigerante", 5.0, 50)
produto3 = Padaria.new("Pão", 2.0, 100)
produto4 = Carnes.new("Carne Bovina", 30.0, 15)

cliente = Cliente.new("Vinicius", "vinicius@email.com")

cliente.adicionar_produto_carrinho(produto1, 2)
cliente.adicionar_produto_carrinho(produto2, 4)
cliente.ver_produtos_carrinho
cliente.finalizar_compra
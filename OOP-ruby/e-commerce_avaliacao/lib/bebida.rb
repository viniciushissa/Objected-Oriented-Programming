require_relative 'produto'

# Subclasse Bebida
class Bebidas < Produto
  def initialize(nome, preco, estoque)
    super(nome, preco, estoque)
  end
end
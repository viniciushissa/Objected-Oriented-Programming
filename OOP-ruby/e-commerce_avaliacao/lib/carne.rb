require_relative 'produto'

# Subclasse Carne
class Carnes < Produto
  def initialize(nome, preco, estoque)
    super(nome, preco, estoque)
  end
end
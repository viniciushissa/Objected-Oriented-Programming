require_relative 'produto'

# Subclasse Higiene
class Higiene < Produto
  def initialize(nome, preco, estoque)
    super(nome, preco, estoque)
  end
end
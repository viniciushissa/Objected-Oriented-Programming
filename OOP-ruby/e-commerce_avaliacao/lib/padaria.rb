require_relative 'produto'

# Subclasse Padaria
class Padaria < Produto
  def initialize(nome, preco, estoque)
    super(nome, preco, estoque)
  end
end
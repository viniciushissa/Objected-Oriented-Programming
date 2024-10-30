class Produto
  attr_accessor :nome, :preco, :estoque

  def initialize(nome, preco, estoque)
    @nome = nome
    @preco = preco
    @estoque = estoque
  end

  def verificar_estoque
    @estoque > 0
  end

  def atualizar_estoque(quantidade)
    @estoque -= quantidade if quantidade <= @estoque
  end
end
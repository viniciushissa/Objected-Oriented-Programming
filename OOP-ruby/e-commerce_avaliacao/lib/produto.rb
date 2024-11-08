# Classe abstrata Produto
class Produto
  attr_reader :nome, :preco, :estoque

  def initialize(nome, preco, estoque)
    @nome = nome
    @preco = preco
    @estoque = estoque
  end

  def verificar_estoque(quantidade)
    @estoque >= quantidade
  end

  def adicionar_estoque(quantidade)
    @estoque += quantidade
  end

  def remover_estoque(quantidade)
    if verificar_estoque(quantidade)
      @estoque -= quantidade
    else
      raise "Estoque insuficiente para #{@nome}"
    end
  end
end
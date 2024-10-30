class CarrinhoDeCompras
  attr_accessor :cliente, :produtos

  def initialize(cliente)
    @cliente = cliente
    @produtos = []
  end

  def adicionar_produto(produto, quantidade=1)
    @produtos << {produto: produto, quantidade: quantidade}
  end

  def remover_produto(produto)
    @produtos.delete_if {|item| item[:produto] == produto}
  end

  def calcular_total
    @produtos.sum {|item| item[:produto].preco.to_f * item[:quantidade].to_i}
  end
end
require_relative 'carrinho'

class Cliente
  def initialize(nome, email)
    @nome = nome
    @email = email
    @carrinho = Carrinho.new
  end

  def adicionar_produto_carrinho(produto, quantidade)
    @carrinho.adicionar_produto(produto, quantidade)
  end

  def remover_produto_carrinho(produto)
    @carrinho.remover_produto(produto)
  end

  def ver_produtos_carrinho
    @carrinho.listar_produtos
  end

  def finalizar_compra
    if @carrinho.produtos.empty?
      puts "Carrinho vazio! Adicione produtos antes de finalizar a compra."
    else
      @carrinho.finalizar_compra
      puts "Compra finalizada com sucesso!"
    end
  end
end
class Carrinho
  attr_reader :produtos

  def initialize
    @produtos = {}
  end

  def adicionar_produto(produto, quantidade)
    if produto.verificar_estoque(quantidade)
      @produtos[produto] = quantidade
      produto.remover_estoque(quantidade)
      puts "#{quantidade} unidade(s) de '#{produto.nome}' adicionada(s) ao carrinho."
    else
      puts "Estoque insuficiente para '#{produto.nome}'."
    end
  end

  def remover_produto(produto)
    if @produtos.key?(produto)
      produto.adicionar_estoque(@produtos[produto])
      @produtos.delete(produto)
      puts "'#{produto.nome}' removido do carrinho."
    else
      puts "'#{produto.nome}' não está no carrinho."
    end
  end

  def listar_produtos
    if @produtos.empty?
      puts "Carrinho vazio."
    else
      @produtos.each do |produto, quantidade|
        puts "Produto: #{produto.nome}, Quantidade: #{quantidade}, Preço total: R$ #{produto.preco * quantidade}"
      end
    end
  end

  def finalizar_compra
    if @produtos.empty?
      puts "Carrinho vazio. Não é possível finalizar a compra."
    else
      total = @produtos.sum { |produto, quantidade| produto.preco * quantidade }
      @produtos.clear
      puts "Compra finalizada. Total a pagar: R$ #{total}"
    end
  end
end
class Pedido
  attr_accessor :cliente, :produtos, :status, :data

  def initialize(cliente)
    @cliente = cliente
    @produtos = []
    @data = Time.now
    @status = 'Em andamento'
  end

  def adicionar_produto(produto, quantidade=1)
    if produto.verificar_estoque && produto.estoque >=quantidade
      produto.atualizar_estoque(quantidade)
      @produtos << {produto: produto, quantidade: quantidade}
    else
      puts "Estoque insuficiente parao produto #{produto.nome}"
    end
  end

  def calcular_total
    @produtos.sum {|item| item[:produto].preco.to_f * item[:quantidade].to_i}
  end

  def exibir_detalhes
    puts "Pedido de #{cliente.nome} - Data: #{@data} - Status: #{@status}"
    @produtos.each do |item|
      puts "#{item[:produto].nome} - Quantidade: #{item[:quantidade]} - Preço: R$#{item[:produto].preco}"
    end
    puts "Total: R$#{calcular_total}"
  end
end
class Cliente
  attr_accessor :nome, :endereco, :historico

  def initialize(nome, endereco)
    @nome = nome
    @endereco = endereco
    @historico = []
  end

  def adicionar_pedido(pedido)
    @historico << pedido
  end

  def ver_historico
    @historico.each {|pedido| pedido.exibir_detalhes}
  end
end

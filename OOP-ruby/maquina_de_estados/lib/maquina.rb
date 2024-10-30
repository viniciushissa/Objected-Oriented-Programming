class Maquina
  attr_reader :estado_atual

  def initialize(estado_inicial, transicoes)
    @estado_atual = estado_inicial
    @transicoes = transicoes
  end

  def mudar_estado(evento)
    transicoes_possiveis = @transicoes[@estado_atual]
    if transicoes_possiveis && transicoes_possiveis[evento]
      @estado_atual = transicoes_possiveis[evento]
    else
      raise "Transição não autorizada do estado '#{@estado_atual} com o evento #{evento}'"
    end
  end
end
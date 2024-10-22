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

transicoes_porta = {
  "aberta" => {"fechar" => "fechada"},
  "fechada" => {"abrir" => "aberta", "arrombar" => "quebrada"},
  "quebrada" => {}
}

porta = Maquina.new("fechada", transicoes_porta)

begin 
  puts "Estado atual: #{porta.estado_atual}"
  porta.mudar_estado("abrir")
  puts "Estado atual: #{porta.estado_atual}"
  porta.mudar_estado("fechar")
  puts "Estado atual: #{porta.estado_atual}"
  porta.mudar_estado("arrombar")
  puts "Estado atual: #{porta.estado_atual}"

  porta.mudar_estado("abrir")
rescue => e
  puts e.message
end
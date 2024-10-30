require_relative 'lib\maquina'

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
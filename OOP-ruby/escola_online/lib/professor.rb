require_relative 'usuario'

class Professor < Usuario
  attr_accessor :cursos_que_leciona

  def initialize(nome, id)
    super
    @cursos_que_leciona = []
  end

  def adicionar_curso(curso)
    @cursos_que_leciona << curso
    puts "#{@nome} está agora lecionando: #{curso.nome}"
  end
end
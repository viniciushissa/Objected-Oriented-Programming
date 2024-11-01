require_relative 'usuario'

class Estudante < Usuario
  attr_accessor :cursos_matriculados

  def initialize(nome, id)
    super
    @cursos_matriculados = []
  end

  def matricular(curso)
    @cursos_matriculados << curso
    puts "#{@nome} foi matriculado: #{curso.nome}"
  end

  def ver_cursos_matriculados
    puts "Estudante #{@nome} matriculado nos cursos:"
    @cursos_matriculados.each do |item|
      puts "#{item}"
    end
  end

  def submeter_avaliacao(avaliacao)
    puts "#{@nome} submeteu a avaliação #{avaliacao.titulo}"
  end
end
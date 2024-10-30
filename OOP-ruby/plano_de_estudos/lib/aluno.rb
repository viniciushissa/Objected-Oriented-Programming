class Aluno
  attr_reader :disciplinas_cursadas
  
  def initialize
    @disciplinas_cursadas = []
  end

  def adicionar_disciplina_cursada(disciplina)
    @disciplinas_cursadas << disciplina
  end

  def cursou?(disciplina)
    @disciplinas_cursadas.include?(disciplina)
  end
end
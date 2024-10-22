class Disciplina
  attr_reader :nome, :creditos, :pre_requisitos

  def initialize(nome, creditos, pre_requisitos = [])
    @nome = nome
    @creditos = creditos
    @pre_requisitos = pre_requisitos
  end
end

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

class PlanoDeEstudo
  attr_reader :disciplinas_selecionadas

  def initialize(aluno, min_creditos, max_creditos)
    @aluno = aluno
    @min_creditos = min_creditos
    @max_creditos = max_creditos
    @disciplinas_selecionadas = []
  end

  def adicionar_disciplina(disciplina)
    if pode_cursar?(disciplina)
      @disciplinas_selecionadas << disciplina
    else 
      raise "Pré-requisitos não atendidos para a disciplina #{disciplina.nome}."
    end
  end

  def total_creditos
    @disciplinas_selecionadas.sum(&:creditos)
  end
  
  def plano_valido?
    total_creditos >= @min_creditos && total_creditos <= @max_creditos
  end

  private

  def pode_cursar?(disciplina)
    disciplina.pre_requisitos.all? {|pre_req| @aluno.cursou?(pre_req)}
  end
end

calculo = Disciplina.new("Cálculo", 5)
fisica = Disciplina.new("Fisica", 4, [calculo])
algebra = Disciplina.new("Algebra", 3)
programacao = Disciplina.new("Programacao", 4)

aluno = Aluno.new
aluno.adicionar_disciplina_cursada(calculo)

plano = PlanoDeEstudo.new(aluno, 7, 12)

begin 
  plano.adicionar_disciplina(fisica)
  plano.adicionar_disciplina(algebra)
  puts "Total de creditos no plano: #{plano.total_creditos}"
  puts "Plano de estudo válido? #{plano.plano_valido?}"
rescue => e
  puts e.message
end
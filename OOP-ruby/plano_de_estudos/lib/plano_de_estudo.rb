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
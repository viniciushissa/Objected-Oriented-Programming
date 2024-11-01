class Curso
  attr_accessor :nome, :codigo, :duracao, :aulas, :avaliacoes
  
  def initialize(nome, codigo, duracao)
    @nome = nome
    @codigo = codigo
    @duracao = duracao
    @aulas = []
    @avaliacoes = []
  end

  def adicionar_aula(aula)
    @aulas << aula
  end

  def adicionar_avaliacao(avaliacao)
    @avaliacoes << avaliacao
  end
end
class Aula
  attr_accessor :titulo, :conteudo, :duracao

  def initialize(titulo, conteudo, duracao)
    @titulo = titulo
    @conteudo = conteudo
    @duracao = duracao
  end
end
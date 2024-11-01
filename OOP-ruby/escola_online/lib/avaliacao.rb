class Avaliacao
  attr_accessor :titulo, :prazo, :pontuacao_maxima

  def initialize(titulo, prazo, pontuacao_maxima)
    @titulo = titulo
    @prazo = prazo
    @pontuacao_maxima = pontuacao_maxima
  end
end
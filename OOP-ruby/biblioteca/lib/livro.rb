class Livro
  attr_accessor :titulo, :autor, :isbn, :disponibilidade

  def initialize(titulo, autor, isbn)
    @titulo = titulo
    @autor = autor
    @isbn = isbn
    @disponibilidade = true
  end

  def disponivel?
    @disponibilidade
  end

  def emprestar
    @disponibilidade = false
  end

  def devolver
    @disponibilidade = true
  end
end
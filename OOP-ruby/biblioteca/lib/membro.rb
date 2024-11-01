require_relative 'usuario'

class Membro < Usuario
  attr_accessor :livros_emprestados

  def initialize(nome, id, endereco)
    super
    @livros_emprestados = []
  end

  def emprestar_livro(livro)
    @livros_emprestados << livro
    livro.emprestar
  end

  def devolver_livro(livro)
    @livros_emprestados.delete(livro)
    livro.devolver
  end
end
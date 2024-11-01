require 'date'

class Emprestimo
  attr_accessor :livro, :membro, :data_emprestimo, :data_devolucao
  
  def initialize(livro, membro)
    @livro = livro
    @membro = membro
    @data_emprestimo = Date.today
    @data_devolucao = nil
  end

  def devolucao
    @data_devolucao = Date.today
  end
end
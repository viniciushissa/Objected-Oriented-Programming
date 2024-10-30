class Disciplina
  attr_reader :nome, :creditos, :pre_requisitos

  def initialize(nome, creditos, pre_requisitos = [])
    @nome = nome
    @creditos = creditos
    @pre_requisitos = pre_requisitos
  end
end
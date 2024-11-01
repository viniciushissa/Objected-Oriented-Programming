class Usuario
  attr_accessor :nome, :id, :endereco

  def initialize(nome, id, endereco)
    @nome = nome
    @id = id
    @endereco = endereco
  end
  
  def ver_cadastro
    puts "Nome: #{@nome}\nID: #{@id}\nEndereço: #{@endereco}"
  end
end
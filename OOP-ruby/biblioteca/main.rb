require_relative 'lib\membro'
require_relative 'lib\funcionario'
require_relative 'lib\livro'
require_relative 'lib\emprestimo'

emprestimos = []

livro1 = Livro.new('O Senhor dos Anéis', 'Tolkien', '123456789')
livro2 = Livro.new('1984', 'George', '987654321')

membro1 = Membro.new('Vinícius', 'V007', 'Rua João Maria')
membro2 = Membro.new('Romarinho', 'R009', 'Travessa 3')

funcionario1 = Funcionario.new('Tia Paula', 'S998', 'Rua Plebeu')

funcionario1.registrar_emprestimo(membro1, livro1, emprestimos)
funcionario1.registrar_emprestimo(membro2, livro1, emprestimos)
funcionario1.registrar_emprestimo(membro2, livro2, emprestimos)
funcionario1.registrar_devolucao(membro1, livro1, emprestimos)
funcionario1.registrar_devolucao(membro2, livro1, emprestimos)
funcionario1.registrar_devolucao(membro2, livro2, emprestimos)

emprestimos.each do |emprestimo|
  puts "Emprestimo-> Livro: #{emprestimo.livro.titulo} - Membro: #{emprestimo.membro.nome}\n"\
        "Data de emprestimo/devolução: #{emprestimo.data_emprestimo}/#{emprestimo.data_devolucao}\n\n"
end
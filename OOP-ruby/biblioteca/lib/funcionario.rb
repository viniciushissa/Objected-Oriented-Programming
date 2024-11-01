require_relative 'usuario'

class Funcionario < Usuario
  def initialize(nome, id, endereco)
    super
  end

  def registrar_emprestimo(membro, livro, emprestimos)
    if livro.disponivel?
      emprestimo = Emprestimo.new(livro, membro)
      emprestimos << emprestimo
      membro.emprestar_livro(livro)
      puts "Emprestimo registrado por #{@nome}: #{livro.titulo} para #{membro.nome} em #{emprestimo.data_emprestimo}"
      puts
    else
      puts "O livro #{livro.titulo} não pode ser emprestado!"
      puts
    end
  end

  def registrar_devolucao(membro, livro, emprestimos)
    if membro.livros_emprestados.include?(livro)
      membro.devolver_livro(livro)
      emprestimos.each do |emprestimo|
        if membro == emprestimo.membro && livro == emprestimo.livro
          emprestimo.devolucao
          puts "Devolução registradapor #{@nome}: #{livro.titulo} devolvido por #{membro.nome}"
          puts
          break
        end
      end
    else
      puts "Esse livro não está emprestado!"
      puts
    end
  end
end
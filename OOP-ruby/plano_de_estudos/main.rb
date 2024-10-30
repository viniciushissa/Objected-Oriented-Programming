require_relative 'lib\aluno'
require_relative 'lib\disciplina'
require_relative 'lib\plano_de_estudo'

calculo = Disciplina.new("Cálculo", 5)
fisica = Disciplina.new("Fisica", 4, [calculo])
algebra = Disciplina.new("Algebra", 3)
programacao = Disciplina.new("Programacao", 4)

aluno = Aluno.new
aluno.adicionar_disciplina_cursada(calculo)

plano = PlanoDeEstudo.new(aluno, 7, 12)

begin 
  plano.adicionar_disciplina(fisica)
  plano.adicionar_disciplina(algebra)
  puts "Total de creditos no plano: #{plano.total_creditos}"
  puts "Plano de estudo válido? #{plano.plano_valido?}"
rescue => e
  puts e.message
end
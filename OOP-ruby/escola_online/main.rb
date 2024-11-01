require_relative 'lib\aula'
require_relative 'lib\avaliacao'
require_relative 'lib\curso'
require_relative 'lib\estudante'
require_relative 'lib\professor'


curso1 = Curso.new('Curso de Ruby', 'RUBY101', '8 semanas')
aula1 = Aula.new('Introdução a Ruby','Conteúdo Básico 1', '2h')
avaliacao1 = Avaliacao.new('Teste POO em Ruby', '05/11/2024', 10)

curso1.adicionar_aula(aula1)
curso1.adicionar_avaliacao(avaliacao1)

estudante1 = Estudante.new('Vinicius', '20231100014')
professor1 = Professor.new('Profa. Annabell', '999888777')

estudante1.matricular(curso1)
professor1.adicionar_curso(curso1)

estudante1.submeter_avaliacao(avaliacao1)
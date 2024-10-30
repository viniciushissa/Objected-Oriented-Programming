require_relative 'lib\funcionario'

def calcular_folha_pagamento(funcionarios)
  folha = {}

  funcionarios.each do |funcionario|
      folha[funcionario.nome] = funcionario.calcular_salario_liquido
  end

  folha
end

funcionarios = [
  Funcionario.new("Maria", 5000, "gerente", 2),
  Funcionario.new("João", 3000, "diretor", 1),
  Funcionario.new("Ana", 2000, "analista", 3),
]

folha_pagamento = calcular_folha_pagamento(funcionarios)

folha_pagamento.each do |nome, salario_liquido|
  puts "#{nome} - Salário a receber: R$#{salario_liquido}"
end
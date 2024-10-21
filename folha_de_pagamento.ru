class Funcionario
    attr_accessor :nome, :salario_base, :cargo, :filhos

    def initialize(nome, salario_base, cargo, filhos)
        @nome = nome
        @salario_base = salario_base
        @cargo = cargo
        @filhos = filhos
    end

    def calcular_salario_liquido
        salario = @salario_base
        salario += calcular_bonus_cargo
        salario -= calcular_desconto_previdencia
        salario += calcular_auxilio_creche
        salario += calcular_auxilio_alimentacao
    end

    private

    def calcular_desconto_previdencia
        @salario_base * 0.1
    end

    def calcular_bonus_cargo
        case @cargo.downcase
        when "gerente"
            @salario_base * 0.3
        when "diretor"
            @salario_base * 0.4
        else
            0
        end
    end

    def calcular_auxilio_creche
        [@filhos, 3].min * 400
    end

    def calcular_auxilio_alimentacao
        280
    end
end

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
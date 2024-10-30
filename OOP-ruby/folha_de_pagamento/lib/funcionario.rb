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
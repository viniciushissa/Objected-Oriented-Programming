class MetodoDePagamento
  attr_reader :tipo

  def initialize(tipo)
    @tipo = tipo
  end

  def processar(valor)
    puts "Processando pagamento de R$#{valor} via #{@tipo}"
  end
end
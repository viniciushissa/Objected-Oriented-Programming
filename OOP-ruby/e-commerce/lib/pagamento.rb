class Pagamento
  attr_accessor :valor, :status_pagamento, :data_pagamento, :metodo_pagamento

  def initialize(valor, metodo_pagamento)
    @valor = valor
    @metodo_pagamento = metodo_pagamento
    @status_pagamento = "Pendente"
    @data_pagamento = Time.now
  end

  def realizar_pagamento
    @metodo_pagamento.processar(@valor)
    @status_pagamento = "Pago"
    puts "Pagamento realizado com sucesso!"
  end
end
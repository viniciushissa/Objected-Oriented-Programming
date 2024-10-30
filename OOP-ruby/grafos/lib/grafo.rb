class Grafo
  attr_accessor :vertices, :arestas

  def initialize
    @vertices = []
    @arestas = {}
  end

  def adicionar_vertice(vertice)
    @vertices << vertice
    @arestas[vertice] = []
  end

  def adicionar_aresta(origem, destino, peso)
    @arestas[origem] << {destino: destino, peso: peso}
  end
end
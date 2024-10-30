require_relative 'menor_caminho'

class BellmanFord < MenorCaminho
  def calcular(grafo, origem)
    distancias = {}
    anterior = {}
    grafo.vertices.each {|v| distancias[v] = Float::INFINITY}
    distancias[origem] = 0

    (grafo.vertices.size - 1).times do
      grafo.vertices.each do |u|
        grafo.arestas[u].each do |aresta|
          v = aresta[:destino]
          peso = aresta[:peso]
          if distancias[u] + peso < distancias[v]
            distancias[v] = distancias[u] + peso
            anterior[v] = u
          end
        end
      end
    end

    grafo.vertices.each do |u|
      grafo.arestas[u].each do |aresta|
        v = aresta[:destino]
        peso = aresta[:peso]
        if distancias[u] + peso < distancias[v]
          raise 'Grafo contém ciclos de peso negativo'
        end
      end
    end
    distancias
  end
end
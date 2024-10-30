require_relative 'menor_caminho'

class Dijkstra < MenorCaminho
  def calcular(grafo, origem)
    distancias = {}
    anterior = {}
    grafo.vertices.each {|v| distancias[v] = Float::INFINITY}
    distancias[origem] = 0
    fila = grafo.vertices.clone

    while !fila.empty?
      u = fila.min_by {|vertice| distancias[vertice]}
      fila.delete(u)

      grafo.arestas[u].each do |aresta| 
        v = aresta[:destino]
        peso = aresta[:peso]
        alt = distancias[u] + peso
        if alt < distancias[v]
          distancias[v] = alt
          anterior[v] = u
        end
      end
    end
    distancias
  end
end
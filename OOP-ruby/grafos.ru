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

class MenorCaminho
  protected
  def calcular(grafo, origem)
    raise NotImplementedError, "Este método deve ser implementado em Subclasses"
  end
end

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

grafo = Grafo.new
grafo.adicionar_vertice('A')
grafo.adicionar_vertice('B')
grafo.adicionar_vertice('C')
grafo.adicionar_vertice('D')

grafo.adicionar_aresta('A', 'B', 1)
grafo.adicionar_aresta('A', 'C', 4)
grafo.adicionar_aresta('B', 'C', 2)
grafo.adicionar_aresta('B', 'D', 6)
grafo.adicionar_aresta('C', 'D', 3)

puts "Escolha o algoritmo (1 para Dijkstra, 2 para Bellman-Ford): "
escolha = gets.chomp.to_i

algoritmo = escolha == 1 ? Dijkstra.new : BellmanFord.new

resultado = algoritmo.calcular(grafo, 'A')
puts "Menor caminho a partir de A: #{resultado}"
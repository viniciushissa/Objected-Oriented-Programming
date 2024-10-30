require_relative 'lib\grafo'
require_relative 'lib\dijkstra'
require_relative 'lib\bellmanford'

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
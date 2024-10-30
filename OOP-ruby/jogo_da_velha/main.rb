require_relative 'lib\jogador'
require_relative 'lib\jogo_da_velha'
require_relative 'lib\tabuleiro'

jogador1 = Jogador.new("Jogador 1", "X")
jogador2 = Jogador.new("Jogador 2", "O")

jogo = JogoDaVelha.new(jogador1, jogador2)
jogo.jogar
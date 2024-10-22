class Jogador
  attr_reader :nome, :simbolo

  def initialize(nome, simbolo)
    @nome = nome
    @simbolo = simbolo
  end
end

class Tabuleiro
  def initialize
    @tabuleiro = Array.new(3) { Array.new(3, ' ') }
  end
  
  def exibir
    puts "  0   1   2"
    puts "0 #{@tabuleiro[0][0]} | #{@tabuleiro[0][1]} | #{@tabuleiro[0][2]} "
    puts " ---+---+---"
    puts "1 #{@tabuleiro[1][0]} | #{@tabuleiro[1][1]} | #{@tabuleiro[1][2]} "
    puts " ---+---+---"
    puts "2 #{@tabuleiro[2][0]} | #{@tabuleiro[2][1]} | #{@tabuleiro[2][2]} "
  end

  def fazer_jogada(linha, coluna, simbolo)
    if @tabuleiro[linha][coluna] == ' '
      @tabuleiro[linha][coluna] = simbolo
      true
    else
      false
    end
  end

  def vencedor?(simbolo)
    linhas = @tabuleiro.any? {|linha| linha.all? {|celula| celula == simbolo}}
    colunas = @tabuleiro.transpose.any? {|coluna| coluna.all? {|celula| celula == simbolo}}
    diagonal1 = (0..2).all? {|i| @tabuleiro[i][i] == simbolo}
    diagonal2 = (0..2).all? {|i| @tabuleiro[i][2-i] == simbolo}

    linhas || colunas || diagonal1 || diagonal2
  end

  def cheio?
    @tabuleiro.flatten.none? {|celula| celula == ' '}
  end
end

class JogoDaVelha
  def initialize(jogador1, jogador2)
    @tabuleiro = Tabuleiro.new
    @jogador1 = jogador1
    @jogador2 = jogador2
    @jogador_atual = jogador1
  end

  def jogar
    loop do
      @tabuleiro.exibir
      linha, coluna = obter_jogada
      if @tabuleiro.fazer_jogada(linha, coluna, @jogador_atual.simbolo)
        if @tabuleiro.vencedor?(@jogador_atual.simbolo)
          @tabuleiro.exibir
          puts "#{@jogador_atual.nome} venceu!"
          break
        elsif @tabuleiro.cheio?
          @tabuleiro.exibir
          puts "Empate!"
          break
        else
          trocar_jogador
        end
      else
        puts "Posição inválida, tente novamente"
      end
    end
  end

  private

  def obter_jogada
    puts "#{@jogador_atual.nome}, insira sua jogada (linha e coluna de 0 a 2, separadas por espaço): "
    gets.chomp.split.map(&:to_i)
  end

  def trocar_jogador
    @jogador_atual = @jogador_atual == @jogador1 ? @jogador2 : @jogador1
  end
end

jogador1 = Jogador.new("Jogador 1", "X")
jogador2 = Jogador.new("Jogador 2", "O")

jogo = JogoDaVelha.new(jogador1, jogador2)
jogo.jogar
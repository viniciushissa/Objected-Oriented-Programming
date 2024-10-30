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
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
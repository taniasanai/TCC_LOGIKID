
class Painel2 extends Painel {
  BotTrataEvento b = new BotTrataEvento("Clique aqui para esconder", this, 20, 90, 160, 25);
  Entrada e;
  
  Painel2(Painel pai, int x, int y) {
    super(pai, x, y, 250, 150);
    Rotulo r = new Rotulo("Digite: ", this, 5, 45, 50, 20);
    e = new Entrada("?????", this, r.x + r.larg, 45, 100, 20);
  }

  class BotTrataEvento extends Botao {
    BotTrataEvento(String texto, Componente pai, int x, int y, int larg, int altu) {
      super(texto, pai, x, y, larg, altu);
    }

    void acao() {
      println("Tratamento diferente do botão: " + e.texto());
      pai.visivel(false);
    }
  }
}

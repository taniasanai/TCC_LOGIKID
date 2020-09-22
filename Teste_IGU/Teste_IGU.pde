Botao b;
Entrada e;
Painel2 p2, p3;

class Principal extends IGU {
  void acao(Componente c) {
    if (c instanceof Botao) {
      if (c == b) {
        println("Botao pressionado. Texto digitado na extrada: " + e.texto());
        p2.move(300,150);
        p3.move(100,400);
        p3.desenha();
      }
    } else if (c instanceof Entrada) {
      if (c == e) {
        println("Texto digitado na extrada: " + e.texto());
      }
    }
  }
}

Principal principal;

void setup() {
  size(1024, 768);

  principal = new Principal();

  Painel p = new Painel(principal, 5, 5, width - 10, height - 10);

  new Rotulo("Digite um texto e presione o botao: ", p, 5, 5, 220, 30);

  b = new Botao("Aperte aqui para mover os paineis", p, 5, 35, 220, 30);

  Rotulo r = new Rotulo("Digite aqui um texto e pressione <enter>: ", p, 5, 75, 260, 20);
  e = new Entrada("texto", p, r.x+r.larg, 75, 100, 20);

  //-------------- Segundo painel
  p2 = new Painel2(p, 100, 120);
  p3 = new Painel2(p, 350, 120);
}

class Painel2 extends Painel {
  BotTrataEvento b = new BotTrataEvento("Clique aqui para esconder", this, 20, 90, 160, 25);
  Entrada e;
  
  Painel2(Painel pai, int x, int y) {
    super(pai, x, y, 200, 150);
    Rotulo r = new Rotulo("Digite: ", this, 5, 45, 50, 20);
    e = new Entrada("?????", this, r.x + r.larg, 45, 100, 20);
  }

  class BotTrataEvento extends Botao {
    BotTrataEvento(String texto, Componente pai, int x, int y, int larg, int altu) {
      super(texto, pai, x, y, larg, altu);
    }

    void acao() {
      println("Tratamento diferente do botão: " + e.texto());
      pai.visivel = false;
      pai.desenha();
    }
  }
}

void draw() {
  principal.redesenha();
}

class PainelPosXY extends PainelPergunta {
  String comando;
  Entrada e, e2;
  PainelPosXY(Painel pai, int x, int y) {
    super(pai, x, y, 200, 200);
    new Rotulo("Qual ponto?", this, 0, 0, 200, 30);
    //Entradas de x e de y
    e = new Entrada("Digite o X", this, 5, 25, 100, 20);
    e.frente(principal.corFundo);
    e.fundo(color(249, 245, 228));

    e2 = new Entrada("Digite o Y", this, 5, 46, 100, 20);
    e2.frente(principal.corFundo);
    e2.fundo(color(249, 245, 228));
    
    textoPerguntaLinha1="Digite a posição X e Y";
    textoPerguntaLinha2="do seu destino.";
  } 
  void acao(Componente c) {
    if (!(e.texto().equals("Digite o X")) && !(e2.texto().equals("Digite o Y"))) { 
      String comandoNovo = comando+" "+ e.texto() + " " + e2.texto();
      painelProg.adiciona(comandoNovo);
      painelBalao.pergunta("Já escolheu o ponto(x,y)?", "Sim?! Então, confirme sua instrução.");
    }
  }
  void comando(String cmd) {
    comando = cmd;
  }
}

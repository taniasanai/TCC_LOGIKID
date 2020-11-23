class PainelVirarGrau extends PainelPergunta {
  Entrada e;
  PainelVirarGrau(Painel pai, int x, int y, int flag) {
    super(pai, x, y, 150, 200);
    new Rotulo("Quantos graus?", this, 0, 0, 150, 30);
    //Entrada de graus
    e = new Entrada("", this, 10, 25, 100, 20);
    e.frente(principal.corFundo);
    e.fundo(color(249, 245, 228));
    
    textoPerguntaLinha1="Agora digite em quantos";
    textoPerguntaLinha2="graus você deseja virar.";
  }  
  void acao(Componente c) {
    painelBalao.pergunta("Instrução pronta! Não se", "esqueça de confirmá-la.");
  }
}

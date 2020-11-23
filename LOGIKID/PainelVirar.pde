class PainelVirar extends PainelPergunta {
  PainelEstados pe;
  PainelVirar(Painel pai, int x, int y) {
    super(pai, x, y, 200, 200);
    new Rotulo("Virar para qual lado?", this, 0, 0, 200, 30);
    //comboBox posicao
    pe = new PainelEstados(this, 10, 30, 150, 40);
    BotaoEstado be1 = new BotaoEstado("Direita", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Esquerda", pe, 0, be1.y + be1.altu, 150, 20);
    
    textoPerguntaLinha1="Você deseja virar para qual";
    textoPerguntaLinha2="lado? Direita ou esquerda?";
  }  
  void acao(Componente c) {
    switch(pe.idSelecionado()) {
    case 0: 
      perguntaProxima(pVirarDir);
      //painelBalao.pergunta("Deseja virar para a direita", "em graus ou radianos?");
      //pVirarEsq.visivel(false); 
      //pVirarGrau.visivel(false); 
      //pVirarRad.visivel(false);
      //pVirar.visivel(false); 
      break;
    case 1: 
      //pVirarDir.visivel(false); 
      perguntaProxima(pVirarEsq);
      //painelBalao.pergunta("Deseja virar para a esquerda", "em graus ou radianos?");
      //pVirarGrau.visivel(false); 
      //pVirarRad.visivel(false);
      //pVirar.visivel(false); 
      break;
    }
  }
}

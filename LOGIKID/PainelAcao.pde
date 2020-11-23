class PainelAcao extends PainelPergunta {
  PainelEstados pe;
  PainelAcao(Painel pai, int x, int y) {
    super(pai, x, y, 200, 200);
    new Rotulo("Ação:", this, 0, 0, 100, 30);

    pe = new PainelEstados(this, 10, 30, 150, 60);
    BotaoEstado be1 = new BotaoEstado("Ir para", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Andar", pe, 0, be1.y + be1.altu, 150, 20);
    BotaoEstado be3 = new BotaoEstado("Virar", pe, 0, be2.y + be2.altu, 150, 20);
    // BotaoEstado be4 = new BotaoEstado("Pega objeto", pe, 0, be3.y + be3.altu, 150, 20);
    textoPerguntaLinha1="O que eu devo fazer agora?";
    textoPerguntaLinha2="Selecione uma instrução!";
  }  
  void acao(Componente c) {

    switch(pe.idSelecionado()) {
    case 0: 
      perguntaProxima(pPosicao); //<>//
      pPosicao.comando("irPara");
      //painelBalao.pergunta("Você deseja ir para onde?", "Até um ponto ou objeto?");
      //pAndar.visivel(false);
      //pVirar.visivel(false); 
      //pPosXY.visivel(false); 
      //pPosObj.visivel(false);
      //pAndarCm.visivel(false); 
      //pAndarPix.visivel(false);
      //pVirarDir.visivel(false); 
      //pVirarEsq.visivel(false);
      //pVirarGrau.visivel(false); 
      //pVirarRad.visivel(false);
      //pAcao.visivel(false);
      
      break;
    case 1: 
      perguntaProxima(pAndar);
      //pAndar.comando("");
      //painelBalao.pergunta("Você deseja andar em", "centímetros ou pixels?");
      //pVirar.visivel(false);
      //pPosicao.visivel(false);
      //pPosXY.visivel(false); 
      //pPosObj.visivel(false);
      //pAndarCm.visivel(false); 
      //pAndarPix.visivel(false);
      //pVirarDir.visivel(false); 
      //pVirarEsq.visivel(false);
      //pVirarGrau.visivel(false); 
      //pVirarRad.visivel(false);
      //pAcao.visivel(false);
      break;
    case 2: 
      pVirar.visivel(true);
      perguntaProxima(pVirar);
      //pVirar.comando("");
      //painelBalao.pergunta("Você deseja virar para qual", "lado? Direita ou esquerda?");
      //pAndar.visivel(false);
      //pPosicao.visivel(false); 
      //pPosXY.visivel(false); 
      //pPosObj.visivel(false);
      //pAndarCm.visivel(false); 
      //pAndarPix.visivel(false);
      //pVirarDir.visivel(false); 
      //pVirarEsq.visivel(false);
      //pVirarGrau.visivel(false); 
      //pVirarRad.visivel(false);
      //pAcao.visivel(false);
      break;
    }
  }
}

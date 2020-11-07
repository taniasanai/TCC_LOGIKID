class PainelAcao extends Painel {
  PainelEstados pe;
  PainelAcao(Painel pai, int x, int y) {
    super(pai, x, y, 200, 200);
    new Rotulo("Ação:", this, 0, 0, 100, 30);

    pe = new PainelEstados(this, 10, 30, 150, 60);
    BotaoEstado be1 = new BotaoEstado("Ir para", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Andar", pe, 0, be1.y + be1.altu, 150, 20);
    BotaoEstado be3 = new BotaoEstado("Virar", pe, 0, be2.y + be2.altu, 150, 20);
    // BotaoEstado be4 = new BotaoEstado("Pega objeto", pe, 0, be3.y + be3.altu, 150, 20);
  }  
  void acao(Componente c) {

    switch(pe.idSelecionado()) {
    case 0: 
      pPosicao.visivel(true);
      pAndar.visivel(false);
      pVirar.visivel(false); 
      pPosXY.visivel(false); 
      pPosObj.visivel(false);
      pAndarCm.visivel(false); 
      pAndarPix.visivel(false);
      pVirarDir.visivel(false); 
      pVirarEsq.visivel(false);
      pVirarGrau.visivel(false); 
      pVirarRad.visivel(false);
      break;
    case 1: 
      pAndar.visivel(true);
      pVirar.visivel(false);
      pPosicao.visivel(false);
      pPosXY.visivel(false); 
      pPosObj.visivel(false);
      pAndarCm.visivel(false); 
      pAndarPix.visivel(false);
      pVirarDir.visivel(false); 
      pVirarEsq.visivel(false);
      pVirarGrau.visivel(false); 
      pVirarRad.visivel(false);
      break;
    case 2: 
      pVirar.visivel(true);
      pAndar.visivel(false);
      pPosicao.visivel(false); 
      pPosXY.visivel(false); 
      pPosObj.visivel(false);
      pAndarCm.visivel(false); 
      pAndarPix.visivel(false);
      pVirarDir.visivel(false); 
      pVirarEsq.visivel(false);
      pVirarGrau.visivel(false); 
      pVirarRad.visivel(false);
      break;
    }
  }
}

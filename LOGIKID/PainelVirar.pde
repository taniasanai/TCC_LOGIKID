class PainelVirar extends Painel {
  PainelEstados pe;
  PainelVirar(Painel pai, int x, int y) {
    super(pai, x, y, 200, 200);
    new Rotulo("Virar para qual lado?", this, 0, 0, 200, 30);
    //comboBox posicao
    pe = new PainelEstados(this, 10, 30, 150, 40);
    BotaoEstado be1 = new BotaoEstado("Direita", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Esquerda", pe, 0, be1.y + be1.altu, 150, 20);
  }  
  void acao(Componente c) {
    switch(pe.idSelecionado()) {
    case 0: 
      pVirarDir.visivel(true); 
      pVirarEsq.visivel(false); 
      pVirarGrau.visivel(false); 
      pVirarRad.visivel(false);
      break;
    case 1: 
      pVirarDir.visivel(false); 
      pVirarEsq.visivel(true);
      pVirarGrau.visivel(false); 
      pVirarRad.visivel(false);
      break;
    }
  }
}

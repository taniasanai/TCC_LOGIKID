class PainelPosicao extends Painel {
  String comando;
  PainelEstados pe;
  PainelPosicao(Painel pai, int x, int y) {
    super(pai, x, y, 200, 200);
    new Rotulo("Posição:", this, 0, 0, 100, 30);
    //comboBox posicao
    pe = new PainelEstados(this, 10, 30, 150, 40);
    BotaoEstado be1 = new BotaoEstado("Ponto (x, y)", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Objeto", pe, 0, be1.y + be1.altu, 150, 20);
  }  
  
  void comando(String cmd){
    comando = cmd;
  }

  void acao (Componente c) {
    switch(pe.idSelecionado()) {
    case 0: 
      pPosXY.visivel(true);
      pPosXY.comando(comando);
      pPosObj.visivel(false); 
      break;
    case 1: 
      pPosXY.visivel(false); 
      pPosObj.visivel(true); 
      break;
    }
  }
}

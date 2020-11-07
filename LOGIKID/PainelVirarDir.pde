class PainelVirarDir extends Painel {
  PainelEstados pe;
  PainelVirarDir(Painel pai, int x, int y) {
    super(pai, x, y, 200, 200);
    new Rotulo("Virar à direita em qual unidade?", this, 0, 0, 200, 30);
    //comboBox unidade
    pe = new PainelEstados(this, 10, 30, 150, 40);
    BotaoEstado be1 = new BotaoEstado("Graus", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Radianos", pe, 0, be1.y + be1.altu, 150, 20);
  }  
  void acao(Componente c) {
    switch(pe.idSelecionado()) {
      case 0: pVirarGrau.visivel(true); pVirarRad.visivel(false); break;
      case 1: pVirarGrau.visivel(false); pVirarRad.visivel(true); break;
    }
  }
}

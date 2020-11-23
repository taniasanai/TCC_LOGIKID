class PainelAndar extends PainelPergunta {
  PainelEstados pe;
  PainelAndar(Painel pai, int x, int y) {
    super(pai, x, y, 200, 200);
    new Rotulo("Andar em:", this, 0, 0, 100, 30);
    //comboBox andar em
    pe = new PainelEstados(this, 10, 30, 150, 40);
    BotaoEstado be1 = new BotaoEstado("Centímetros", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Pixels", pe, 0, be1.y + be1.altu, 150, 20);
    
    textoPerguntaLinha1="Você deseja andar em";
    textoPerguntaLinha2="centímetros ou pixels?";
  }  
  void acao(Componente c) {
    switch(pe.idSelecionado()) {
    case 0: 
      perguntaProxima(pAndarCm);
      //painelBalao.pergunta("Por quantos cm você deseja", "andar? Digite no campo!");
      //pAndarPix.visivel(false); 
      //pAndar.visivel(false); 
      break;
    case 1: 
      //pAndarCm.visivel(false); 
      perguntaProxima(pAndarPix);
      //pAndar.visivel(false); 
      //painelBalao.pergunta("Por quantos pixels você", "deseja andar? Digite no campo!");
      break;
    }
  }
}

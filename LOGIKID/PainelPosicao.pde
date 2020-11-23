class PainelPosicao extends PainelPergunta {
  String comando;
  PainelEstados pe;
  PainelPosicao(Painel pai, int x, int y) {
    super(pai, x, y, 200, 200);
    new Rotulo("Posição:", this, 0, 0, 100, 30);
    //comboBox posicao
    pe = new PainelEstados(this, 10, 30, 150, 40);
    BotaoEstado be1 = new BotaoEstado("Ponto (x, y)", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Objeto", pe, 0, be1.y + be1.altu, 150, 20);
    textoPerguntaLinha1="Você deseja ir para onde?";
    textoPerguntaLinha2="Até um ponto ou objeto?";
  }  
  
  void comando(String cmd){
    comando = cmd;
  }

  void acao (Componente c) {
    switch(pe.idSelecionado()) {
    case 0: 
      perguntaProxima(pPosXY);
      //pPosicao.visivel(false);
      //painelBalao.pergunta("Digite a posição X e Y", "do seu destino.");
      pPosXY.comando(comando);
      //pPosObj.visivel(false); 
      break;
    case 1: 
      perguntaProxima(pPosObj);
      //pPosXY.visivel(false); 
      //pPosicao.visivel(false);
      //painelBalao.pergunta("Até qual objeto", "você deseja ir?");
      break;
    }
  }
}

class painelBotao extends Painel{
  painelBotao(Painel pai, int x, int y){
    super(pai, x, y,  280, 300);
    bPlay = new BotaoFigura("robogif.png",this,5,5);
    bPlay.fundo(super.corFundo);
    bPlay.frente(painelProg.corFundo);
    
    //bStop = new BotaoFigura("https://img.icons8.com/plasticine/50/000000/stop.png",this,200,5, 50,50);
    //bStop.fundo(super.corFundo);
    //bStop.frente(painelProg.corFundo);
  }  
}

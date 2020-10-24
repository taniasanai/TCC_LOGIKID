class PainelBotao extends Painel{
  PainelBotao(Painel pai, int x, int y){
    super(pai, x, y,  300, 110);
    bPlay = new BotaoFigura("play.png",this,5,5);
    bPlay.fundo(pai.pai.corFundo);
    bPlay.frente(pai.pai.corFundo);
    
    bStop = new BotaoFigura("stop.png",this,225,5);
    bStop.fundo(pai.pai.corFundo);
    bStop.frente(pai.pai.corFundo);
  }  
}

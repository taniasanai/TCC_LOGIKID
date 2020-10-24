class PainelBotao2 extends Painel{
  PainelBotao2(Painel pai, int x, int y){
    super(pai, x, y,  90, 180);
    bConfirmar = new BotaoFigura("confirmar.png",this,5,100);
    bConfirmar.fundo(pai.pai.corFundo);
    bConfirmar.frente(pai.pai.corFundo);
    
    bLimpar = new BotaoFigura("limpar.png",this,5,5);
    bLimpar.fundo(pai.pai.corFundo);
    bLimpar.frente(pai.pai.corFundo);
  }  
}

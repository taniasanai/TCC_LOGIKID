class PainelBotaoMenu extends Painel{
  PainelBotaoMenu(Painel pai, int x, int y){
    super(pai, x, y,  300, 110);
    bFechar= new BotaoFigura("fechar.png", this, 5,5);
    bFechar.fundo(pai.corFundo);
    bFechar.frente(pai.corFundo);
    
    bPlayM = new BotaoFigura("play.png",this,115,5);
    bPlayM.fundo(pai.corFundo);
    bPlayM.frente(pai.corFundo);
    
    bSobre = new BotaoFigura("sobre.png",this,225,5);
    bSobre.fundo(pai.corFundo);
    bSobre.frente(pai.corFundo);
  }
  void acao(Componente c){
    if(c==bFechar) exit();
    else if(c==bPlayM){
      pai.visivel(false);
    }
    else if(c==bSobre){
      new DlgSobre(this);
    }
  }
  
}

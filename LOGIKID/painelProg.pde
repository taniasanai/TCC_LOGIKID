class PainelProg extends Painel{
  PainelProg(Painel pai, int x, int y){
    super(pai, x, y,  300, 738);
    pBotao = new PainelBotao(this, 0, 655);
    pBotao.fundo(pai.corFundo);
    pBotao.frente(pai.pai.corFundo);
  }  
}

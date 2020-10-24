class PainelInst extends Painel{
  PainelInst(Painel pai, int x, int y){
    super(pai, x, y,  680, 400);
    pBotaoInst = new PainelBotao2(this, 590, 215);
    pBotaoInst.fundo(pai.corFundo);
    pBotaoInst.frente(pai.corFundo);
    
    pAcao = new PainelAcao(this,5,5);
    pAcao.fundo(pai.corFundo);
    pAcao.frente(pai.corFundo);
    pPosicao = new PainelPosicao(this,5,105);
    pPosicao.fundo(pai.corFundo);
    pPosicao.frente(pai.corFundo);
  }  
  
}

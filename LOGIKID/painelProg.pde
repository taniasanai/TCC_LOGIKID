class painelProg extends Painel{
  painelProg(Painel pai, int x, int y){
    super(pai, x, y,  300, 738);
    pBotao = new painelBotao(this, 10, 80);
  }  
}

class PainelMenu extends Painel{
  PainelMenu(Componente pai, int x, int y){
    super(pai,x,y,1014,758);
    this.fundo(color(254,225,210));
    painelRoboM = new PainelRoboM(this, 230,30);
    painelRoboM.fundo(this.corFundo);
    painelRoboM.frente(painelRoboM.corFundo);
    painelBalaoM = new PainelBalaoMenu(this, 500,0);
    painelBalaoM.fundo(this.corFundo);
    painelBalaoM.frente(painelBalaoM.corFundo);
    
    //colocar um painel com botoes sobre, sair, começar
    pBotaoM = new PainelBotaoMenu(this, 380, 450);
    pBotaoM.fundo(this.corFundo);
    pBotaoM.frente(this.corFundo);
  }
}

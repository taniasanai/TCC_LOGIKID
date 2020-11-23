class PainelInterno extends Painel {
  PainelInterno(Componente pai, int x, int y) {
    super(pai, x, y, 1014, 758);
    //colocar os componentes aqui
    this.fundo(color(254, 225, 210));
    painelRobo = new PainelRobo(this, 0, 30);
    painelRobo.fundo(this.corFundo);
    painelRobo.frente(painelRobo.corFundo);
    
    painelBalao = new PainelBalao(this, 310, 0);
    painelBalao.fundo(this.corFundo);
    painelBalao.frente(painelBalao.corFundo);

    painelProg = new PainelProg(this, 700, 210);
    painelProg.frente(principal.corFundo);
    painelProg.fundo(this.corFundo);

    painelInst = new PainelInst(this, 10, 350);
    painelInst.frente(principal.corFundo);
    painelInst.fundo(this.corFundo);

    pComando = new PainelComando(this, 700, 10);
    pComando.fundo(pai.corFundo);
    pComando.frente(pai.corFundo);
  }
}

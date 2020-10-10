class painelInst extends Painel{
  painelInst(Painel pai, int x, int y){
    super(pai, x, y,  350, 300);
    
  }  
  
  void desenha(){
    pRobo = new PainelFigura("robogif.png",painelInst,5,5, 280,230);
    pRobo.fundo(super.corFundo);
    pRobo.frente(pRobo.corFundo);
    Rotulo r = new RotTexto("LogiKid", painelInst,77 , 240, 220, 45);
    r.frente(color(4, 163, 143)); //mudar a cor da fonte
    r.fundo(color(255,0,0));
  }

}

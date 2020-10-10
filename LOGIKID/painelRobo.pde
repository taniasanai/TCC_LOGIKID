class painelRobo extends Painel{
  painelRobo(Painel pai, int x, int y){
    super(pai, x, y,  280, 300);
    
  }  
  
  void desenha(){
    pRobo = new PainelFigura("robogif.png",painelRobo,5,5, 280,230);
    pRobo.fundo(super.corFundo);
    pRobo.frente(pRobo.corFundo);
    Rotulo r = new RotTexto("LogiKid", painelRobo,77 , 240, 220, 45);
    r.frente(color(4, 163, 143)); //mudar a cor da fonte
    r.fundo(color(255,0,0));
  }

}

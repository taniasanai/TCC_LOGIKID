class PainelRoboM extends Painel{
  PainelRoboM(Painel pai, int x, int y){
    super(pai, x, y,  280, 300);
    
  }  
  
  void desenha(){
    pRobo = new PainelFigura("robogif.png",painelRoboM,5,5, 280,230);
    pRobo.fundo(super.corFundo);
    pRobo.frente(pRobo.corFundo);
    Rotulo r = new RotTexto("LogiKid", painelRoboM,77 , 210, 220, 75);
    r.frente(color(4, 163, 143)); //mudar a cor da fonte
    r.fundo(color(255,0,0));
  }

}

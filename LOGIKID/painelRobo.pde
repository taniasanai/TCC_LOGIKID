class painelRobo extends Painel{
  painelRobo(Painel pai, int x, int y){
    super(pai, x, y,  280, 300);
    
  }  
  
  void desenha(){
    pRobo = new PainelFigura("robogif.png",painelRobo,5,5, 280,230);
    Rotulo r = new RotTexto("LogiKid", painelRobo,85 , 240, 220, 45);
    r.frente(color(36, 164, 155)); //mudar a cor da fonte
    r.fundo(color(255,0,0));
  }

}

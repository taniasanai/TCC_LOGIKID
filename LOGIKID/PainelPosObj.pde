class PainelPosObj extends Painel{
  PainelPosObj(Painel pai, int x, int y){
    super(pai, x, y,  200, 200);
    new Rotulo("Qual objeto?",this,0,0,200,30);
    //comboBox posicao objeto
    PainelEstados pe = new PainelEstados(this, 10, 30, 150, 40);
    BotaoEstado be1 = new BotaoEstado("Bola", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Cubo", pe, 0, be1.y + be1.altu, 150, 20);
    
    
  }  
  
}

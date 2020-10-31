class PainelAndar extends Painel{
  PainelAndar(Painel pai, int x, int y){
    super(pai, x, y,  200, 200);
    new Rotulo("Andar em:",this,0,0,100,30);
    //comboBox andar em
    PainelEstados pe = new PainelEstados(this, 10, 30, 150, 40);
    BotaoEstado be1 = new BotaoEstado("Centímetros", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Pixels", pe, 0, be1.y + be1.altu, 150, 20);
    
    
  }  
  
}

class PainelVirar extends Painel{
  PainelVirar(Painel pai, int x, int y){
    super(pai, x, y,  200, 200);
    new Rotulo("Virar para qual lado?",this,0,0,200,30);
    //comboBox posicao
    PainelEstados pe = new PainelEstados(this, 10, 30, 150, 40);
    BotaoEstado be1 = new BotaoEstado("Direita", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Esquerda", pe, 0, be1.y + be1.altu, 150, 20);
    
    
  }  
  
}

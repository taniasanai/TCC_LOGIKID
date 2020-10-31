class PainelVirarEsq extends Painel{
  PainelVirarEsq(Painel pai, int x, int y){
    super(pai, x, y,  200, 200);
    new Rotulo("Virar à esquerda em qual unidade?",this,0,0,200,30);
    //comboBox unidade
    PainelEstados pe = new PainelEstados(this, 10, 30, 150, 40);
    BotaoEstado be1 = new BotaoEstado("Graus", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Radianos", pe, 0, be1.y + be1.altu, 150, 20);
    
  }  
  
}

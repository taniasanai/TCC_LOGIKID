class PainelPosicao extends Painel{
  PainelPosicao(Painel pai, int x, int y){
    super(pai, x, y,  100, 100);
    new Rotulo("Posição:",this,0,0,100,30);
    //comboBox posicao
    
  }  
  
}

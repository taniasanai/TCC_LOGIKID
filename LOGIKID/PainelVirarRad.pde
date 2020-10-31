class PainelVirarRad extends Painel{
  PainelVirarRad(Painel pai, int x, int y, int flag){
    super(pai, x, y,  200, 200);
    new Rotulo("Quantos radianos?",this,0,0,200,30);
    //Entrade de radianos
    e = new Entrada("", this, 1, 25, 100, 20);
    e.frente(principal.corFundo);
    e.fundo(color(249, 245, 228));
    
  }  
  
}

class PainelVirarGrau extends Painel{
  PainelVirarGrau(Painel pai, int x, int y, int flag){
    super(pai, x, y,  200, 200);
    new Rotulo("Quantos graus?",this,0,0,200,30);
    //Entrada de graus
    e = new Entrada("", this, 1, 25, 100, 20);
    e.frente(principal.corFundo);
    e.fundo(color(249, 245, 228));
    
  }  
  
}

class PainelAndarPix extends Painel{
  PainelAndarPix(Painel pai, int x, int y){
    super(pai, x, y,  200, 200);
    new Rotulo("Quantos pixels?",this,5,5,200,30);
    //entrada pixels
    e = new Entrada("", this, 5, 25, 100, 20);
    e.frente(principal.corFundo);
    e.fundo(color(249, 245, 228));
    
  }  
  
}

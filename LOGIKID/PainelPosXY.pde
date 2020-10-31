class PainelPosXY extends Painel{
  PainelPosXY(Painel pai, int x, int y){
    super(pai, x, y,  200, 200);
    new Rotulo("Qual ponto?",this,5,5,200,30);
    //Entradas de x e de y
    e = new Entrada("Digite o X", this, 5, 25, 100, 20);
    e.frente(principal.corFundo);
    e.fundo(color(249, 245, 228));
    
    e2 = new Entrada("Digite o Y", this, 5, 40, 100, 20);
    e2.frente(principal.corFundo);
    e2.fundo(color(249, 245, 228));
    
  }  
  
}

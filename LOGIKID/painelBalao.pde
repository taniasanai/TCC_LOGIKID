class PainelBalao extends Painel{
  PainelBalao(Painel pai, int x, int y){
    super(pai, x, y,  350, 200);
    
  }  
  
  void desenha(){
    pBalao = new PainelFigura("balao.png",painelBalao,5,5, 350,230);
    pBalao.fundo(super.corFundo);
    pBalao.frente(pRobo.corFundo);
    //Rotulo r = new RotTexto("LogiKid", painelBalao,77 , 240, 220, 45);
    //r.frente(color(4, 163, 143)); //mudar a cor da fonte
    //r.fundo(color(255,0,0));
  }

}

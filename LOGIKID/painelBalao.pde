class PainelBalao extends Painel{
  PainelBalao(Painel pai, int x, int y){
    super(pai, x, y,  350, 200);
    
  }  
  
  void desenha(){
    pBalao = new PainelFigura("balao.png",painelBalao,5,5, 350,230);
    pBalao.fundo(super.corFundo);
    pBalao.frente(pRobo.corFundo);
    
    Rotulo r = new RotTexto2("Selecione os botões para", painelBalao,35 , 45, 250, 45);
    r.frente(color(0,0,0)); //mudar a cor da fonte
    r.fundo(color(255,0,0));
    r = new RotTexto2("montar sua instrução!", painelBalao,35 , 65, 250, 45);
    r.frente(color(0, 0, 0)); //mudar a cor da fonte
    r.fundo(color(255,0,0));
     
  }

}

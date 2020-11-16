class PainelBalao extends Painel{
  String texto1="Selecione os botões para", texto2="montar sua instrução!";
  Rotulo r1, r2;
  PainelBalao(Painel pai, int x, int y){
    super(pai, x, y,  350, 200);
    
    pBalao = new PainelFigura("balao.png",this,5,5, 350,230);
    pBalao.fundo(super.corFundo);
    pBalao.frente(pai.corFundo);
    
    r1 = new RotTexto2(texto1, this,35 , 45, 250, 45);
    r1.frente(color(0,0,0)); //mudar a cor da fonte
    r1.fundo(color(255,0,0));
    r1.alinhamento(CENTER);
    r2 = new RotTexto2(texto2, this,35 , 65, 250, 45);
    r2.frente(color(0, 0, 0)); //mudar a cor da fonte
    r2.fundo(color(255,0,0));
    r2.alinhamento(CENTER);
  }  
  
  void pergunta(String t1, String t2){
    r1.texto(t1);
    r2.texto(t2);
    redesenha();
  }
}

class PainelProg extends Painel{
  final int posYInicial=5;
  int indSelecao=0;
  ArrayList <String> comandos = new ArrayList<String>();
  PainelProg(Painel pai, int x, int y){
    super(pai, x, y,  300, 738);
    pBotao = new PainelBotao(this, 0, 655);
    pBotao.fundo(pai.corFundo);
    pBotao.frente(pai.pai.corFundo);
    
    
  } 
  
  void adiciona(int indice, String comando){
    comandos.set(indice, comando);
    redesenha();
  }
  
  void adiciona(String comando){
    comandos.add(comando);
    redesenha();
  }
  
  void desenha(){
    int posY=posYInicial;
    for(String s:comandos){
      text(s, 25, posY);
      posY+=textAscent()+textDescent();
    }
    posY=posYInicial+(int(textAscent()+textDescent()))*indSelecao;
    text(">> ",5,posY);
  }
  
  void mouseClicou(int botao, int x, int y){
    indSelecao=int((y-posYInicial)/(textAscent()+textDescent()));
    if(indSelecao>=comandos.size()){
      indSelecao = comandos.size();
    }
  }
}

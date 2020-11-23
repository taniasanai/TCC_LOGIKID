class PainelAndarPix extends PainelPergunta{
  Entrada e;
  PainelAndarPix(Painel pai, int x, int y){
    super(pai, x, y,  200, 200);
    new Rotulo("Quantos pixels?",this,0,0,200,30);
    //entrada pixels
    e = new Entrada("", this, 10, 25, 100, 20);
    e.frente(principal.corFundo);
    e.fundo(color(249, 245, 228));
    
    textoPerguntaLinha1="Por quantos pixels você";
    textoPerguntaLinha2="deseja andar? Digite no campo!";
  }  
  void acao(Componente c){
    painelBalao.pergunta("Pronto! Agora só falta", "confrimar a instrução!");
  }
  
}

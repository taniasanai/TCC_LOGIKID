class PainelComando extends Painel {
  String texto1="Comando aqui";
  Rotulo r1;
  PainelComando(Painel pai, int x, int y) {
    super(pai, x, y, 300, 200);
    new Rotulo("Instrução até agora:", this, 5, 5, 150, 30);
  } 
  
  void desenha(){
    r1 = new RotTexto2(texto1, this, 5, 35, 250, 45);
    r1.frente(color(0, 0, 0)); //mudar a cor da fonte
    r1.fundo(color(255, 0, 0));
    r1.alinhamento(CENTER);
  }
}

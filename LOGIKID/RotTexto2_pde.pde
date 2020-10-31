class RotTexto2 extends Rotulo {
  RotTexto2(String texto, Componente pai, int x, int y, int larg, int altu) {
    super(texto, pai, x, y, larg, altu);
  }
  
  void desenha() {
    PFont f = createFont("Arial", 20);
    textFont(f);
    super.desenha();
  }
}

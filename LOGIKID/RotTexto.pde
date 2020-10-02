class RotTexto extends Rotulo {
  RotTexto(String texto, Componente pai, int x, int y, int larg, int altu) {
    super(texto, pai, x, y, larg, altu);
  }
  
  void desenha() {
    PFont f = createFont("Arial", 32);
    textFont(f);
    super.desenha();
  }
}

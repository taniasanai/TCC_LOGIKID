class PainelFigura extends Painel {
  PImage img;
  
  PainelFigura(String nomeArquivoFigura, Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    img = loadImage(nomeArquivoFigura, "png");
     //carrega figura
  }
  
  void desenha() {
    //super.desenha();
    image(img, 0, 0);
  }
}

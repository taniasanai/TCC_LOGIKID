class BotaoFigura extends Botao {
  PImage img;
  
  BotaoFigura(String nomeArquivoFigura, Componente pai, int x, int y) {
    super("", pai, x, y, 100, 100);
  // Load image from a web server
  
    String ext = extensao(nomeArquivoFigura);
    img = loadImage(nomeArquivoFigura, ext);
    forma(pai, x, y, img.width, img.height);
    //carrega figura
    fundo(color(255,255,0));
  }
  
  void desenha() {
    desenhaFundo();
    if (pressionado) {
      //fundo(color(255, 0, 0));
      //desenha o botão quando pressionarmage
      image(img, 1, 1);
    } else if (preparado) {
      //fundo(color(0, 255, 0));
      image(img, -1, -1);
      //desenha o botão quando o mouse setá sobre o botao
    } else {
      //fundo(color(0, 0, 255));
      image(img, 0, 0);
      //desenhar a imagem do botao na situação de espera se o mouse sobre ele
    }
  }
}

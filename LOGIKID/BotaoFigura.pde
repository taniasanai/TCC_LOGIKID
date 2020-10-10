class BotaoFigura extends Botao {
  PImage webImg;
  
  BotaoFigura(String nomeArquivoFigura, Componente pai, int x, int y) {
    super("", pai, x,y, 100,100);
  // Load image from a web server
    webImg = loadImage(nomeArquivoFigura, "png");
    //carrega figura
  }
  
  void desenha() {
    desenhaFundo();
    if (pressionado) {
      //fundo(color(255, 0, 0));
      //desenha o botão quando pressionarmage
      image(webImg, 1, 1, larg, altu);
    } else if (preparado) {
      //fundo(color(0, 255, 0));
      image(webImg, -1, -1, larg, altu);
      //desenha o botão quando o mouse setá sobre o botao
    } else {
      //fundo(color(0, 0, 255));
      image(webImg, 0, 0, larg, altu);
      //desenhar a imagem do botao na situação de espera se o mouse sobre ele
    }
  }
}

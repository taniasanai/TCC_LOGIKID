Botao b;
Entrada e;
Painel2 p2, p3;

class Principal extends IGU {
  void acao(Componente c) {
    if (c instanceof Botao) {
      if (c == b) {
        println("Botao pressionado. Texto digitado na extrada: " + e.texto());
        p2.move(300,150);
        p3.move(100,400);
        p2.visivel(true);
        p3.visivel(true);
        p3.desenha();
        new Dialogo("Titulo", this).visivel(true);
        new Dlg(this);
      }
    } else if (c instanceof Entrada) {
      if (c == e) {
        println("Texto digitado na extrada: " + e.texto());
      }
    }
  }
}

class Dlg extends Dialogo {
  Botao bt;
  Dlg(Componente pai) {
    super("Teste do Dialogo", pai);
    bt = new Botao("Botao de teste", this, 10, 10, 150, 20);
    visivel(true);
  }
  
  void acao(Componente c) {
    if (c == bt) {
      fecha();
    }
  }
}

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

class PainelFigura extends Painel {
  PImage img;
  
  PainelFigura(String nomeArquivoFigura, Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    img = loadImage(nomeArquivoFigura, "jpg");
     //carrega figura
  }
  
  void desenha() {
    //super.desenha();
    image(img, 0, 0);
  }
}

class BotaoFigura extends Botao {
  PImage webImg;
  
  BotaoFigura(String nomeArquivoFigura, Componente pai, int ... ptosXY) {
    super("", pai, ptosXY);
  // Load image from a web server
    webImg = loadImage(nomeArquivoFigura, "jpg");
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

Principal principal;

void setup() {
  size(1024, 768);

  principal = new Principal();

  Painel p = new PainelFigura("https://s2.glbimg.com/c1tS_axTjV_qDkmMeMs3wYZCgGY=/0x0:5472x3648/1008x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2017/H/v/pTatikTlSIWRuTzd0JwA/j9a6180.jpg", 
                               principal, 55, 55, width - 100, height - 100);
    //Painel p = new Painel(//"https://s2.glbimg.com/c1tS_axTjV_qDkmMeMs3wYZCgGY=/0x0:5472x3648/1008x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2017/H/v/pTatikTlSIWRuTzd0JwA/j9a6180.jpg", 
    //                           principal, 55, 55, width - 100, height - 100);
  
  new Rotulo("Digite um texto e presione o botao: ", p, 5, 5, 220, 30);

  b = new Botao("Aperte aqui para mover os paineis", p, 5, 35, 220, 30);
  int red = 255;
  int green = 128;
  int blue = 128;
  b.frente(color(red, green, blue));
  b.fundo(color(255, 210, 210));

  Rotulo r = new RotTexto("Digite aqui um texto e pressione <enter>: ", p, 5, 75, 260, 50);
  r.frente(color(255,0,0));
  r.fundo(color(0,255,0));
  e = new Entrada("texto", p, r.x+r.larg, 75, 100, 20);
  e.frente(color(255,0,0));
  e.fundo(color(0,255,0));

  //-------------- Segundo painel
  p2 = new Painel2(p, 100, 120);
  p3 = new Painel2(p, 350, 120);
}

class Painel2 extends Painel {
  BotTrataEvento b = new BotTrataEvento("Clique aqui para esconder", this, 15, 110, 170, 25);
  Entrada e;
  
  Painel2(Painel pai, int x, int y) {
    super(pai, x, y, 200, 150);
    Rotulo r = new Rotulo("Digite: ", this, 5, 45, 50, 20);
    Botao bf = new BotaoFigura("http://pt.naturewallpaperfree.com/c%C3%A9u/natureza-papel-de-parede-128x128-4129-e51cf332.jpg", this, 10, 10, 10, 80, 80, 80, 50, 20);
    //bf.fundo(color(0, 255,0));
    e = new Entrada("?????", this, r.x + r.larg, 45, 100, 20);
    
    frente(color(255,0,0));
    fundo(color(0,255,0));
  }

  class BotTrataEvento extends Botao {
    BotTrataEvento(String texto, Componente pai, int x, int y, int larg, int altu) {
      super(texto, pai, x, y, larg, altu);
    }

    void acao() {
      println("Tratamento diferente do botão: " + e.texto());
      pai.visivel(false);
    }
  }
}

void draw() {
  principal.redesenha();
}

Botao b;
Entrada e;
Painel2 p2, p3;

Principal principal;

class Principal extends IGU {
  void acao(Componente c) {
    if (c instanceof Botao) {
      if (c == b) {
        println("Botao pressionado. Texto digitado na extrada: " + e.texto());
        p2.move(300, 150);
        p3.move(100, 400);
        p2.visivel(true);
        p3.visivel(true);
        p3.desenha();
        new Dialogo("Titulo").visivel(true);
        new Dlg();
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
  PainelEstados pe, pe2;

  Dlg() {
    super("Teste do Dialogo");
    pe = new PainelEstados(this, 10, 10, 150, 80);
    BotaoEstado be1 = new BotaoEstado("Opção 1", pe, 0, 0, 150, 20);
    BotaoEstado be2 = new BotaoEstado("Opção dois", pe, 0, be1.y + be1.altu, 150, 20);
    BotaoEstado be3 = new BotaoEstado("Opção III", pe, 0, be2.y + be2.altu, 150, 20);
    BotaoEstado be4 = new BotaoEstado("Opção 4", pe, 0, be3.y + be3.altu, 150, 20);

    String opcoes[] = {"um", "dois", "três", "quatro"};
    pe2 = new PainelEstados(opcoes, this, pe.x + pe.larg + 10, 10, 150, 80);

    bt = new Botao("Botao de teste", this, 10, pe.y + pe.altu + 10, 150, 20);
    new Entrada("", this, 100, bt.y + bt.altu + 10, 100, 20);
    frente(color(255,0,0));// fundo do dialogo
    fundo(color(0,255,0));
    painelTitulo().frente(color(255,255,0));// painel de titulo (Roturo) da janela 
    painelTitulo().fundo(color(0,0,255));
    botaoFechar().frente(color(155,155,0));// botao fechar
    botaoFechar().fundo(color(0,0,155));
    visivel(true);
  }

  void acao(Componente c) {
    if (c == bt) {
      fecha();
    } else if (c.pai == pe) {
      BotaoEstado bs = (BotaoEstado)c;
      if (bs.id() == 2) {
        println("O terceiro botão " + bs.texto + " foi pressionado");
      }
    } else if (c.pai == pe2) {
      BotaoEstado bs = (BotaoEstado)c;
      PainelEstados pe = (PainelEstados)c.pai;
      println(bs.id() + " " + pe.idSelecionado() + "  " + pe.selecionado().texto);
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
  r.frente(color(255, 0, 0));
  r.fundo(color(0, 255, 0));
  e = new Entrada("texto", p, r.x+r.larg, 75, 100, 20);
  e.frente(color(255, 0, 0));
  e.fundo(color(0, 255, 0));

  Painel p1 = new Painel(p, 150, 150, 400, 300);

  p2 = new Painel2(p1, -50, 120);
  p3 = new Painel2(p, 350, 120);
}

class Painel2 extends Painel {
  BotTrataEvento b = new BotTrataEvento("Clique aqui para esconder", this, 15, 130, 170, 25);
  Entrada e;

  Painel2(Painel pai, int x, int y) {
    super(pai, x, y, 200, 200);
    Rotulo r = new Rotulo("Digite: ", this, 5, 95, 50, 20);
    e = new Entrada("?????", this, r.x + r.larg, 95, 100, 20);

    Botao bf = new BotaoFigura("http://pt.naturewallpaperfree.com/c%C3%A9u/natureza-papel-de-parede-128x128-4129-e51cf332.jpg", this, 10, 10, 10, 80, 80, 80, 50, 20);
    //bf.fundo(color(0, 255,0));

    Painel pa = new Painel(this, -10, -10, 20, 20);
    pa.fundo(color(255, 128, 0));
    Painel pb = new Painel(this, larg-10, altu-10, 20, 20);
    pb.fundo(color(255, 128, 0));

    frente(color(0, 0, 255));
    fundo(color(0, 255, 0));
  }

  class BotTrataEvento extends Botao {
    BotTrataEvento(String texto, Componente pai, int x, int y, int larg, int altu) {
      super(texto, pai, x, y, larg, altu);
    }

    void acao() {
      println("Tratamento diferente do botão: " + e.texto());
      pai.visivel(false);
    }

    void forma(Componente pai, int x, int y, int larg, int altu) {
      formaPoli(pai, x, y+6, x+1, y+3, x+3, y+1, x+6, y, // Primeiro canto 
        x + larg -6, y, x + larg-3, y+1, x + larg-1, y+3, x + larg, y+6, // Segundo
        x + larg, y + altu-6, x + larg-1, y + altu-3, x + larg-3, y + altu-1, x + larg -6, y + altu, //Terceiro  
        x + 6, y + altu, x + 3, y + altu-1, x + 1, y + altu-3, x, y + altu-6);
    }

    void desenhaContorno() {
      strokeWeight(1); 
      super.desenhaContorno();
    }
  }
}

void draw() {
  principal.redesenha();
}

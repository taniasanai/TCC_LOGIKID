final int END = 35;
final int SHIFT = 16;

class Componente {

  Componente pai;
  ArrayList<Componente> componentes = new ArrayList<Componente>();
  Ponto2D ptos[];
  Poligono poli;
  int xAbs, yAbs;
  int x, y, larg, altu;
  color corFundo = color(128, 128, 128);
  color corFrente = color(0, 0, 0);
  boolean podeReceberFoco = true;
  int tamanhoTexto = 12;
  Componente proxTabComponente = null;
  Componente anteTabComponente = null;
  boolean visivel = true;

  Componente(Componente pai, int x, int y, int larg, int altu) {
    init(pai, x, y, x + larg, y, x + larg, y + altu, x, y + altu);
    init();
  }

  Componente(Componente pai, int ... ptos) {
    init(pai, ptos);
    init();
  }

  void init() {
    pai.componentes.add(this);
    redraw();
  }

  Componente(int x, int y, int larg, int altu) {
    init(null, x, y, x + larg, y, x + larg, y + altu, x, y + altu);
  }

  Componente(int ... ptos) {
    init(null, ptos);
  }

  void minMax(Ponto2D min, Ponto2D max, int ... ptosXY) {
    ptos = new Ponto2D[ptosXY.length/2];
    min.x = min.y = Integer.MAX_VALUE;
    max.x = max.y = Integer.MIN_VALUE;
    for (int i = 0; i < ptosXY.length; i += 2) {
      min.x = min(min.x, ptosXY[i]);
      min.y = min(min.y, ptosXY[i + 1]);
      max.x = max(max.x, ptosXY[i]);
      max.y = max(max.y, ptosXY[i + 1]);
    }
  }
  
  void init(Componente pai, int ... ptosXY) {
    Ponto2D min = new Ponto2D();
    Ponto2D max = new Ponto2D();
    minMax(min, max, ptosXY);
    for (int i = 0; i < ptosXY.length; i += 2) {
      ptos[i / 2] = new Ponto2D(ptosXY[i] - min.x, ptosXY[i + 1] - min.y);
    }
    larg = max.x - min.x;
    altu = max.y - min.y;
    if (pai != null) {
      this.pai = pai;
      xAbs = pai.xAbs + min.x;
      yAbs = pai.yAbs + min.y;
    } else {
      xAbs = min.x;
      yAbs = min.y;
    }
    x = min.x;
    y = min.y;
    poli = new Poligono(ptos);
  }

  void fundo(color c) {
    corFundo = c;
    redraw();
  }

  void frente(color c) {
    corFrente = c;
    redraw();
  }

  void move(int x, int y) {
    xAbs = pai.xAbs + x;
    yAbs = pai.yAbs + y;
    this.x = x;
    this.y = y;
    for (Componente c : componentes)
      c.move(c.x, c.y); //<>//
    redraw();
  }

  void reforma(int ... ptos) {
    init(null, ptos);
    redraw();
  }

  boolean dentroDoComponente(int x, int y) {
    x -= xAbs;
    y -= yAbs;
    return poli.contem(x, y);
  }

  void redesenha() {
    if (visivel) {
    clip(xAbs, yAbs, larg+1, altu+1); //<>//
    pushMatrix();
    translate(xAbs, yAbs);
      atualiza();
    popMatrix();
    for (Componente c : componentes)
      c.redesenha();
    }
  }

  void atualiza() {
    strokeWeight(1); 
    stroke(0);
    poli.corPreenchimento(corFundo);
    textSize(tamanhoTexto);
    stroke(corFrente);
    desenha();
  }

  void desenha() {
    poli.desenha();
    poli.desenhaContorno();
  }

  void acao() {
    acao(this);
  }

  void acao(Componente c) {
    if (pai != null)
      pai.acao(c);
  }

  void mouseEntrou(int x, int y) {
  }

  void mouseSaiu() {
  }

  void mouseApertou(int botao, int x, int y) {
  }

  void mouseSoltou(int botao, int x, int y) {
  }

  void mouseClicou(int botao, int x, int y) {
  }

  void perdeuFoco(Componente receberaFoco) {
  }

  void ganhouFoco(Componente perdeuFoco) {
  }

  void teclaPressionada(int tecla, int codigo) {
  }

  void teclaLiberada(int tecla, int codigo) {
  }

  void teclaDigitada(int tecla, int codigo) {
  }
}

class Rotulo extends Componente {
  String texto;
  int alinha = LEFT;

  Rotulo(String texto, Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    init(texto);
  }

  Rotulo(String texto, Componente pai, int ... ptos) {
    super(pai, ptos);
    init(texto);
  }

  void init(String texto) {
    this.texto = texto;
    podeReceberFoco = false;
  }

  void alinhamento(int alinha) {
    this.alinha = alinha;
  }  

  String texto() {
    return texto;
  }

  void desenha() {
    int x = 2;
    fill(0);
    textAlign(LEFT, BOTTOM);
    switch (alinha) {
    case CENTER:
      x = (larg - (int)textWidth(texto)) / 2;
      break;
    case RIGHT:
      x = larg - (int)textWidth(texto) - 2;
      break;
    }
    text(texto, x, (altu + (textAscent() + textDescent()))/2);
  }
}

class Botao extends Componente {
  String texto;
  boolean pressionado = false;
  boolean preparado = false;

  Botao(String texto, Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    init(texto);
  }

  Botao(String texto, Componente pai, int ... ptosXY) {
    super(pai, ptosXY);
    init(texto);
  }

  void init(String texto) {
    this.texto = texto;
    corFundo = color(192, 192, 192);
  }

  void mouseApertou(int botao, int x, int y) {
    pressionado = true;
    redraw();
  }

  void mouseSoltou(int botao, int x, int y) {
    pressionado = false;
    redraw();
  }

  void mouseEntrou(int x, int y) {
    pressionado = false;
    preparado = true;
    redraw();
  }
  
  void mouseSaiu() {
    pressionado = false;
    preparado = false;
    redraw();
  }

  void mouseClicou(int botao, int x, int y) {
    acao();
    redraw();
  }

  void desenhaFundo() {
      noStroke();
      poli.corPreenchimento(corFundo);
      poli.desenha();
  }
  
  void desenhaFrente(int dx, int dy) {
      stroke(corFrente);
      poli.desenhaContorno();
      fill(corFrente);
      text(texto, (larg - (int)textWidth(texto)) / 2 + dx, (altu - (textAscent() + textDescent()))/2 + dy);
  }

  void desenha() {
    textSize(tamanhoTexto);
    textAlign(LEFT, TOP);
    desenhaFundo();
    if (pressionado) {
      stroke(lerpColor(corFundo, color(0,0,0), 0.5)); 
      poli.desenhaContorno(1, 1);
      desenhaFrente(1, 1);
    } else if (preparado) {
      stroke(lerpColor(corFundo, color(0,0,0), 0.5));
      poli.desenhaContorno(-1, -1); 
      stroke(lerpColor(corFrente, color(255,255,255), 0.5));
      poli.desenhaContorno(1, 1);
      desenhaFrente(0, 0);
    } else {
      desenhaFrente(1, 1);
    }
  }
}

class Entrada extends Componente {
  String texto;
  int xPosTexto = 2;
  int yPosTexto;
  int alinha = LEFT;
  boolean botaoPressionado = false;
  boolean comFoco = false;
  int selecaoInicio;
  int selecaoFim;
  color corSelecao = 255;

  /** valores da variavel selecionando */
  final int NAO = 0;
  final int SIM = 1; // selecionando, mas sem direcao definida
  final int INICIO = 2;
  final int FIM = 3;
  int selecionando = NAO;

  Entrada(String texto, Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    init(texto);
  }

  Entrada(String texto, Componente pai, int ... ptos) {
    super(pai, ptos);
    init(texto);
  }

  void init(String texto) {
    this.texto = texto;
    textSize(tamanhoTexto);
    int altuTexto = int(textAscent() + textDescent());
    yPosTexto = (altu - altuTexto)/2;
    corFundo = 224;
    selecionaTudo();
  }

  void texto(String texto) {
    int compr = texto.length();
    if (selecaoInicio > compr)
      selecaoInicio = compr;
    if (selecaoFim >= selecaoInicio)
      selecaoFim = selecaoInicio - 1;
    this.texto = texto;
  }

  String texto() {
    return texto;
  }

  void selecionaTudo() {
    selecaoInicio = 0;
    selecaoFim = texto.length()-1;
  }

  void alinhamento(int alinha) {
    this.alinha = alinha;
    redraw();
  }

  void perdeuFoco(Componente receberaFoco) {
    comFoco = false;
    redraw();
  }

  void ganhouFoco(Componente perdeuFoco) {
    comFoco = true;
    selecionaTudo();
    redraw();
  }

  void corFundoTexto(color c) {
    corSelecao = c;
  }

  void desenha() {
    int xTexto = xPosTexto;
    int xCarete;
    noStroke();
    poli.corPreenchimento(corFundo);
    poli.desenha();
    stroke(0);
    poli.desenhaContorno();
    textAlign(LEFT, TOP);
    switch (alinha) {
    case CENTER:
      xTexto += (larg - (int)textWidth(texto)) / 2;
      break;
    case RIGHT:
      xTexto += larg - (int)textWidth(texto) - 2;
      break;
    }
    textSize(tamanhoTexto);
    //println("selecaox ini: "+selecaoInicio+" fin: "+selecaoFim+" \""+texto+"\"");
    int altuTexto = int(textAscent() + textDescent());
    int xTam = (int)textWidth(texto.substring(selecaoInicio, selecaoFim + 1));
    xCarete = xTexto + (int)textWidth(texto.substring(0, selecaoInicio));
    if (comFoco) {
      fill(color(corSelecao));
      rectMode(CORNER);
      rect(xCarete, yPosTexto, xTam, altuTexto);
    }
    fill(corFrente);
    text(texto, xTexto, yPosTexto);
  }

  String substituiSelecao(String carac) {
    String s = "";
    if (selecaoInicio > 0)
      s = texto.substring(0, selecaoInicio);
    s += carac;
    if (selecaoFim < texto.length() - 1)
      s += texto.substring(selecaoFim + 1);
    return s;
  }

  void teclaDigitada(int tecla, int codigo) {  
    switch (tecla) {
    case CODED:
      return;
    case DELETE:
    case BACKSPACE:
      if (selecaoInicio > selecaoFim)
        if (tecla == DELETE) 
          selecaoFim = selecaoInicio;
        else 
        selecaoInicio = selecaoFim;
      texto = substituiSelecao("");
      if (selecaoInicio >= 0)
        selecaoInicio--;
      selecaoFim = selecaoInicio++;
      break;
    case ENTER:
    case RETURN:
      acao();
      break;
    default:
      textSize(tamanhoTexto);
      String s = substituiSelecao(str((char)tecla));
      if (textWidth(s) < larg - 4) {
        texto = s;
        selecaoFim = selecaoInicio++;
      }
    }
    redraw();
  } 

  void teclaPressionada(int tecla, int codigo) {
    if (Raiz.shift)
      selecionando = SIM;
    switch (codigo) {
    case RIGHT:
      if (selecionando == NAO) {
        if (selecaoFim < texto.length() - 1) 
          selecaoFim ++;
        selecaoInicio = selecaoFim + 1;
      } else {
        if (selecionando == SIM)
          selecionando = FIM;
        if (selecionando == FIM) 
          if (selecaoFim < texto.length() - 1) 
            selecaoFim ++;        
        if (selecionando == INICIO) {
          if (selecaoInicio < selecaoFim + 1) 
            selecaoInicio ++;
          if (selecaoInicio == selecaoFim + 1)
            selecionando = SIM;
        }
      }
      break;
    case LEFT:
      if (selecionando == NAO) {
        if (selecaoInicio > 0) 
          selecaoInicio --;
        selecaoFim = selecaoInicio - 1;
      } else {
        if (selecionando == SIM)
          selecionando = INICIO;
        if (selecionando == INICIO) 
        if (selecaoInicio > 0) 
          selecaoInicio --;        
        if (selecionando == FIM) {
          if (selecaoInicio < selecaoFim + 1) 
            selecaoFim --;
          if (selecaoInicio == selecaoFim + 1)
            selecionando = SIM;
        }
      }
      break;
    }
    //println(selecaoInicio, selecaoFim);
    redraw();
  }

  void teclaLiberada(int tecla, int codigo) {
    if (!Raiz.shift)
      selecionando = NAO;
  }

  void mouseClicou(int botao, int x, int y) {
    redraw();
  }
}

class Painel extends Componente { 
  Painel(Componente pai, int x, int y, int larg, int altu) {
    super(pai, x, y, larg, altu);
    corFundo = color(224,224,224);
  }

  void desenha() {
    noStroke();
    poli.corPreenchimento(corFundo);
    poli.desenha();
    stroke(0);
    poli.desenhaContorno();
  }
}

class IGU extends Componente {
  IGU() {
    super(0, 0, width - 1, height - 1);
    Raiz.igu = this;
  }

  Componente componenteNoPonto(Componente cAtual, int x, int y) {
    if (cAtual.dentroDoComponente(x, y) && cAtual.visivel) {
      for (Componente c : cAtual.componentes) {
        Componente result = componenteNoPonto(c, x, y);
        if (result != null)
          cAtual = result;
      }
      return cAtual;
    }
    return null;
  }
}

class AtalhoTeclado {
  void trata(int tecla, int codigo) {
  }
}

static class Raiz {
  static IGU igu = null;
  static Componente mouseNoComponente = null;
  static Componente componenteComFoco; 
  static AtalhoTeclado atalhoTeclado = null;
  static boolean shift = false;
  static boolean alt = false;
  static boolean control = false;

  static void mudaFoco(Componente c) {
    if (c != null && componenteComFoco != c && c.podeReceberFoco && c.visivel) {
      if (componenteComFoco != null)
        componenteComFoco.perdeuFoco(c);
      c.ganhouFoco(componenteComFoco);
      componenteComFoco = c;
    }
  }

  static void mouseApertou(int botao, int x, int y) {
    Componente c = igu.componenteNoPonto(igu, x, y);
    if (c == null) 
      return;
    c.mouseApertou(botao, x - c.xAbs, y - c.yAbs);
    mudaFoco(c);
  }

  static void mouseClicou(int botao, int x, int y) {
    Componente c = igu.componenteNoPonto(igu, x, y);
    if (c == null) 
      return;
    c.mouseClicou(botao, x - c.xAbs, y - c.yAbs);
  }

  static void mouseSoltou(int botao, int x, int y) {
    Componente c = igu.componenteNoPonto(igu, x, y);
    if (c == null) 
      return;
    c.mouseSoltou(botao, x - c.xAbs, y - c.yAbs);
  }

  static void mouseMoveu(int x, int y) {
    Componente c = igu.componenteNoPonto(igu, x, y);
    if (c != null) {
      if (mouseNoComponente != c) {
        if (mouseNoComponente != null)
          mouseNoComponente.mouseSaiu();
        c.mouseEntrou(x - c.xAbs, y - c.yAbs);
        mouseNoComponente = c;
      }
    }
  }
}

public void keyPressed(KeyEvent event) {
  Raiz.shift = event.isShiftDown();
  Raiz.alt = event.isAltDown();
  Raiz.control = event.isControlDown();
  if (Raiz.atalhoTeclado != null) 
    Raiz.atalhoTeclado.trata(event.getKey(), event.getKeyCode());
  if (Raiz.componenteComFoco != null)
    Raiz.componenteComFoco.teclaPressionada(event.getKey(), event.getKeyCode());
  if (key==27)
    key=0;
}

void keyTyped(KeyEvent event) {
  if (Raiz.componenteComFoco != null) {
    if (key == TAB) {
      Componente c;
      if (Raiz.shift) {
        c = Raiz.componenteComFoco.anteTabComponente; // anterior
      } else {
        c = Raiz.componenteComFoco.proxTabComponente; // proximo
      }
      Raiz.mudaFoco(c);
    } else
      Raiz.componenteComFoco.teclaDigitada(event.getKey(), event.getKeyCode());
  }
}

void keyReleased(KeyEvent event) {
  Raiz.shift = event.isShiftDown();
  Raiz.alt = event.isAltDown();
  Raiz.control = event.isControlDown();
  if (Raiz.componenteComFoco != null)
    Raiz.componenteComFoco.teclaLiberada(event.getKey(), event.getKeyCode());
}

void mousePressed(MouseEvent event) {
  Raiz.mouseApertou(event.getButton(), event.getX(), event.getY());
}

void mouseClicked(MouseEvent event) {
  Raiz.mouseClicou(event.getButton(), event.getX(), event.getY());
}

void mouseReleased(MouseEvent event) {
  Raiz.mouseSoltou(event.getButton(), event.getX(), event.getY());
}

void mouseMoved(MouseEvent event) {
  Raiz.mouseMoveu(event.getX(), event.getY());
}

/** ##################
 *  Classes auxiliares 
 *  ##################
 */

class Ponto2D {
  Ponto2D() {
    x = 0;
    y = 0;
  }
  Ponto2D(int x, int y) {
    this.x = x;
    this.y = y;
  }
  int x, y;
};

public class Poligono {
  PShape shape;
  Ponto2D[] ptos;
  color corPreenchimento;

  Poligono(Ponto2D[] ptos) {
    this.ptos = ptos;
    shape = createShape();
    renova();
  }

  int acimaDoSegmentoDeReta(int x, int y, Ponto2D p0, Ponto2D p1) {
    float yl, m;
    if (min(p0.x, p1.x) < x && x <= max(p0.x, p1.x)) {
      int dy = p0.y - p1.y;
      if (dy == 0) {
        if (p0.y > y) {
          return 1;
        } else {
          return 0;
        }
      }
      int dx = p0.x - p1.x;
      if (dx != 0) {
        m = (float)dx/dy;
        yl = p0.y - (p0.x - x) / m;
        if (round(yl) > y) {
          return 1;
        }
      }
    }
    return 0;
  }

  int aDireitaDoSegmentoDeReta(int x, int y, Ponto2D p0, Ponto2D p1) {
    float xl, m;
    x--;
    if (min(p0.y, p1.y) < y && y <= max(p0.y, p1.y)) {
      int dx = p0.x - p1.x;
      if (dx == 0) {
        if (p0.x > x) {
          return 1;
        } else {
          return 0;
        }
      }
      int dy = p0.y - p1.y;
      if (dy != 0) {
        m = (float)dy/dx;
        xl = p0.x - (p0.y - y) / m;
        if (round(xl) > x) {
          return 1;
        }
      }
    }
    return 0;
  }

  boolean contem(int x, int y) {
    int contX = 0, contY = 0;
    for (int i = 1; i < ptos.length; i++) {
      contX+=acimaDoSegmentoDeReta(x, y, ptos[i - 1], ptos[i]);
      contY+=aDireitaDoSegmentoDeReta(x, y, ptos[i - 1], ptos[i]);
    }
    contX+=acimaDoSegmentoDeReta(x, y, ptos[ptos.length - 1], ptos[0]);
    contY+=aDireitaDoSegmentoDeReta(x, y, ptos[ptos.length - 1], ptos[0]);

    //println(contX, contY);
    return (contX & 1) == 1 && (contY & 1) == 1;
  }

  boolean contem(Ponto2D pto) {
    return contem(pto.x, pto.y);
  }

  void renova() {
    shape.beginShape();
    shape.noStroke();
    shape.fill(corPreenchimento);
    for (Ponto2D p : ptos) {
      shape.vertex(p.x, p.y);
    }
    shape.endShape();
  }

  public void desenhaContorno() {
    desenhaContorno(0, 0);
  }
  
  public void desenhaContorno(int dx, int dy) {
    for (int i = 1; i < ptos.length; i++) {
      line(ptos[i - 1].x+dx, ptos[i - 1].y+dy, ptos[i].x+dx, ptos[i].y+dy);
    }
    line(ptos[ptos.length - 1].x+dx, ptos[ptos.length - 1].y+dy, ptos[0].x+dx, ptos[0].y+dy);
  }

  void corPreenchimento(color cor) {
    if (cor != corPreenchimento) {
      corPreenchimento = cor;
      renova();
    }
  }

  public void desenha() {
    shape(shape);
  }
}

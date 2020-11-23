class PainelBalaoMenu extends Painel {
  PainelBalaoMenu(Painel pai, int x, int y) {
    super(pai, x, y, 350, 200);
  }  

  void desenha() {
    pBalao = new PainelFigura("balao.png", painelBalaoM, 5, 5, 350, 230);
    pBalao.fundo(super.corFundo);
    pBalao.frente(pRobo.corFundo);

    Rotulo r = new RotTexto2("Olá! Bem-vindo ao LogiKid!", painelBalaoM, 35, 45, 250, 45);
    r.frente(color(0, 0, 0)); //mudar a cor da fonte
    r.fundo(color(255, 0, 0));
    r.alinhamento(CENTER);
    r = new RotTexto2("Vamos começar?", painelBalaoM, 35, 65, 250, 45);
    r.frente(color(0, 0, 0)); //mudar a cor da fonte
    r.fundo(color(255, 0, 0));
    r.alinhamento(CENTER);
  }
}

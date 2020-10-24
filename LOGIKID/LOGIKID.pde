Botao bPlay, bStop, bLimpar, bConfirmar;
Entrada e;
Painel2 p2, p3;
PainelFigura pRobo, pBalao;
Painel painelRobo, painelBalao, painelProg, pBotao, painelInst, pBotaoInst,pAcao, pPosicao;
Principal principal;

void setup() {
  size(1024, 768);

  principal = new Principal();
  principal.fundo(color(162, 99, 5));

  Painel p = new Painel(principal, 5, 5, width - 10, height - 10);
  p.fundo(color(254,225,210));
  

  //b = new Botao("Aperte aqui para mover os paineis", p, 5, 35, 220, 30);
  int red = 255;
  int green = 128;
  int blue = 128;
  //b.frente(color(red, green, blue));
  //b.fundo(color(255, 210, 210));

  //Rotulo r1 = new Rotulo("Digite aqui um texto e pressione <enter>: ", p, 800, 75, 260, 20);
 // r1.fundo(color(255,0,0));
  //e = new Entrada("texto", p, r.x+r.larg, 75, 100, 20);

  //-------------- Segundo painel
  //p2 = new Painel2(p, 10, 10);
  //p3 = new Painel2(p, 350, 120);
  
  //--------Painel Robo ----- isso deveria ficar em uma outra classe -> PainelInterno
  painelRobo = new PainelRobo(p, 10,50);
  painelRobo.frente(painelRobo.corFundo);
  painelBalao = new PainelBalao(p, 310,0);
  painelBalao.frente(painelBalao.corFundo);
  painelProg = new PainelProg(p,700,10);
  painelProg.frente(principal.corFundo);
  painelProg.fundo(p.corFundo);
  painelInst = new PainelInst(p,10,350);
  painelInst.frente(principal.corFundo);
  painelInst.fundo(p.corFundo);
}

void draw() {
  principal.redesenha();
}


String extensao(String nomeDoArquivo) {
  int pos = nomeDoArquivo.lastIndexOf('.');
  return nomeDoArquivo.substring(pos+1);
}

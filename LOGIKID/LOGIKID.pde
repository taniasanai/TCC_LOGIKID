Botao bPlay, bStop, bLimpar, bConfirmar;
Entrada e, e2;
Painel2 p2, p3;
PainelFigura pRobo, pBalao;
Painel painelRobo, painelBalao, painelProg, pBotao, painelInst, pBotaoInst,pAcao, pPosicao,pPosObj,pPosXY, pVirar, pAndar,pAndarCm,pAndarPix,pVirarDir,pVirarEsq;
Painel pVirarGrau,pVirarRad;
Principal principal;
//PARSE INT COM EXCEPTION
void setup() {
  size(1024, 768);

  principal = new Principal();
  principal.fundo(color(162, 99, 5));

  Painel p = new PainelInterno(principal, 5, 5);
  p.fundo(color(254,225,210));
  
  //Painel pMenu = new PainelMenu(principal, 5, 5);
  //pMenu.fundo(color(254,225,210));



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
  
  
  
}

void draw() {
  principal.redesenha();
}


String extensao(String nomeDoArquivo) {
  int pos = nomeDoArquivo.lastIndexOf('.');
  return nomeDoArquivo.substring(pos+1);
}

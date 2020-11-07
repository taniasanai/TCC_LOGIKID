class PainelInst extends Painel {
  PainelInst(Painel pai, int x, int y) {
    super(pai, x, y, 680, 400);
    pBotaoInst = new PainelBotao2(this, 590, 215);
    pBotaoInst.fundo(pai.corFundo);
    pBotaoInst.frente(pai.corFundo);

    int xParam=5, yParam=5;

    pAcao = new PainelAcao(this, xParam, yParam);
    pAcao.fundo(pai.corFundo);
    pAcao.frente(pai.corFundo);
    yParam+=95;
    //se for opcao ir Para, faz:
    pPosicao = new PainelPosicao(this, xParam, yParam);
    pPosicao.fundo(pai.corFundo);
    pPosicao.frente(pai.corFundo);
    pPosicao.visivel(false);
    //---se for pra posição (x,y), faz:
    pPosXY = new PainelPosXY(this, 200, yParam);
    pPosXY.fundo(pai.corFundo);
    pPosXY.frente(pai.corFundo);
    pPosXY.visivel(false);
    //---se for opção objeto, faz:
    pPosObj = new PainelPosObj(this, 200, yParam);
    pPosObj.fundo(pai.corFundo);
    pPosObj.frente(pai.corFundo);
    pPosObj.visivel(false);
    yParam+=75;
    //se for andar, faz:
    pAndar = new PainelAndar(this, xParam, yParam);
    pAndar.fundo(pai.corFundo);
    pAndar.frente(pai.corFundo);
    pAndar.visivel(false);

    //---se for centimetros, faz: (anda pra trás se for parametro negativo)
    pAndarCm = new PainelAndarCm(this, 200, yParam);
    pAndarCm.fundo(pai.corFundo);
    pAndarCm.frente(pai.corFundo);
    pAndarCm.visivel(false);
    //---se for pixels, faz:
    pAndarPix = new PainelAndarPix(this, 200, yParam);
    pAndarPix.fundo(pai.corFundo);
    pAndarPix.frente(pai.corFundo);
    pAndarPix.visivel(false);
    yParam+=75;
    //se for virar, faz:
    pVirar = new PainelVirar(this, xParam, yParam);
    pVirar.fundo(pai.corFundo);
    pVirar.frente(pai.corFundo);
    pVirar.visivel(false);
    //yParam+=75;
    //---se for direita, faz:
    pVirarDir = new PainelVirarDir(this, 200, yParam);
    pVirarDir.fundo(pai.corFundo);
    pVirarDir.frente(pai.corFundo);
    pVirarDir.visivel(false);
    //yParam=5;
    xParam+=210;
    //OS DOIS PODEM IR PARA O MESMO PAINEL COM UMA VARIAVEL DE
    //IDENTIFICAÇÃO PARA SABER SE FOI DIREITA OU ESQUERDA
    //------se for graus, faz:
    pVirarGrau = new PainelVirarGrau(this, xParam, yParam, 0);//4° param 0 indica direita e 1= esquerda
    pVirarGrau.fundo(pai.corFundo);
    pVirarGrau.frente(pai.corFundo);
    pVirarGrau.visivel(false);
    //------se for rad, faz:
    pVirarRad = new PainelVirarRad(this, xParam, yParam, 0);//4° param 0 indica direita e 1= esquerda
    pVirarRad.fundo(pai.corFundo);
    pVirarRad.frente(pai.corFundo);
    pVirarRad.visivel(false);

    //---se for esquerda, faz:
    pVirarEsq = new PainelVirarEsq(this, 200, yParam);
    pVirarEsq.fundo(pai.corFundo);
    pVirarEsq.frente(pai.corFundo);
    pVirarEsq.visivel(false);
    //yParam=5;
    xParam+=210;
    //------se for graus, faz:
    pVirarGrau = new PainelVirarGrau(this, xParam, yParam, 1);//4° param 0 indica direita e 1= esquerda
    pVirarGrau.fundo(pai.corFundo);
    pVirarGrau.frente(pai.corFundo);
    pVirarGrau.visivel(false);

    //------se for rad, faz:
    pVirarRad = new PainelVirarRad(this, xParam, yParam, 1);//4° param 0 indica direita e 1= esquerda
    pVirarRad.fundo(pai.corFundo);
    pVirarRad.frente(pai.corFundo);
    pVirarRad.visivel(false);

    //QUANDO SAIR DE TODOS OS IFs, APRESENTAR UM LABEL "Voce deve confirmar ou limpar"
    yParam+=95;
    new Rotulo("*Não se esqueça de confirmar para salvar essa instrução!*", this, 30, yParam, 350, 30);
  }
}

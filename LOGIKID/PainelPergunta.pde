class PainelPergunta extends Painel { //<>// //<>//
  String textoPerguntaLinha1="", textoPerguntaLinha2="";
  PainelPergunta(Componente pai, int x, int y, int larg, int comp) {
    super(pai, x, y, larg, comp);
  }
  void perguntaProxima(PainelPergunta p) {
    p.visivel(true);
    int ultimo=ordemComandos.size()-1;
    if (ultimo>=0) {
      ordemComandos.get(ultimo).visivel(false);
    }
    ordemComandos.add(p);
    painelBalao.pergunta(p.textoPerguntaLinha1, p.textoPerguntaLinha2);
  }
  void perguntaAnterior() {
    int ultimo=ordemComandos.size()-1;
    if(ultimo<0) return;
    PainelPergunta pAtual = ordemComandos.get(ultimo);
    if (ultimo >=1) {
      pAtual.visivel(false);
      ordemComandos.remove(ultimo);
      ultimo--;
      pAtual=ordemComandos.get(ultimo);
      pAtual.visivel(true);
    }
    painelBalao.pergunta(pAtual.textoPerguntaLinha1, pAtual.textoPerguntaLinha2);
  }
}

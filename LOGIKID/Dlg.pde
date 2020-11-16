class Dlg extends Dialogo {
  Botao bt,bt2;
  Dlg(Componente pai) {
    super("Confirmar instrução?");
    
    new Rotulo("A nova instrução é ",this,0,0,300,30);
    
    new Rotulo("Deseja confirmar?",this,0,20,200,30);
    bt = new Botao("Não", this, 10, 50, 100, 20);
    bt2 = new Botao("Sim", this, 190,50,100,20);
    new Rotulo(" ",this,0,55,100,30);
    fundo(color(165,213,230));
    //frente(color(255,0,0));
    painelTitulo.fundo(color(99,161,218));
    painelTitulo.frente(color(0,0,0));//linha entre titulo e corpo
    visivel(true);
  }

  void acao(Componente c) {
    if (c == bt) {
      fecha();
    }
    else if(c==bt2){
      //mandar instrução pro painel de programa
      //colocar a instrução no painelProg
      //limpa todos os campos
      fecha();
    }
  }
}

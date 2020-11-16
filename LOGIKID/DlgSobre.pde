class DlgSobre extends Dialogo {
  Botao bt,bt2;
  DlgSobre(Componente pai) {
    super("Sobre - LogiKid");
    
    new Rotulo("      ---Sobre--- ",this,0,0,300,30);
    new Rotulo("Desenvolvido por Tania Sanai",this,0,30,300,30);
    new Rotulo("RA 171025717",this,0,60,300,30);
    new Rotulo("Prof. Dr. Rene Pegoraro",this,0,90,300,30);
    new Rotulo("Unesp Bauru - DCo - 2020",this,0,120,300,30);
    
    //new Rotulo("Deseja confirmar?",this,0,20,200,30);
    bt = new Botao("Voltar", this, 100, 150, 100, 20);
    //bt2 = new Botao("Sim", this, 190,50,100,20);
    new Rotulo(" ",this,0,155,100,30);
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
  }
}

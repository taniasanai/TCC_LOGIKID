class Dlg extends Dialogo {
  Botao bt;
  Dlg(Componente pai) {
    super("Confirmar instrução?", pai);
    
    bt = new Botao("Sim", this, 10, 10, 150, 20);
    visivel(true);
  }

  void acao(Componente c) {
    if (c == bt) {
      fecha();
    }
  }
}

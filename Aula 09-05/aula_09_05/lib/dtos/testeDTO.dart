class TesteDTO{
  String? CEP;
  String? CPF;
  String? TentativaXY;
  String? Produto;

  TesteDTO(this.CEP, this.CPF, this.TentativaXY, this.Produto);

  @override
  String toString() {
    return "CEP: ${CEP}\nCPF: ${CPF}\nTentativa de Digitar XY: ${TentativaXY}\nProduto: ${Produto} ";
  }
}
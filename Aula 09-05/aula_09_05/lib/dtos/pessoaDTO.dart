class PessoaDTO {
  String? nome;
  String? sobrenome;
  String? cpf;

  PessoaDTO(this.nome, this.sobrenome, this.cpf);

  @override
  String toString() {
    return "Nome: ${nome} ${sobrenome}\nCPF: ${cpf}";
  }
}
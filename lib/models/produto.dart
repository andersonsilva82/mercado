class Produto {
  final String nome;
  final String valor;
  final int? quantidade;

  Produto(
    this.nome,
    this.valor,
    this.quantidade,
  );

  @override
  String toString() {
    return 'Produto{nome: $nome, valor: $valor, quantidade: $quantidade}';
  }
}

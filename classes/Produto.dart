class Produto {
  String descricao;
  late double _valorVenda;
  late double _valorCompra;
  double quantidadeEstoque;

  double get valorVenda {
    return this._valorVenda;
  }

  set valorVenda(double valorVenda) {
    if (valorVenda > _valorCompra) {
      this._valorVenda = valorVenda;
    }
  }

  double get valorCompra {
    return this._valorCompra;
  }

  set valorCompra(double valorCompra) {
    if (valorCompra > 0) {
      this._valorCompra = valorCompra;
    }
  }

  Produto({required this.descricao, required this.quantidadeEstoque});
}

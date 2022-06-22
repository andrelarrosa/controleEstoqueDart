import 'Funcionario.dart';
import 'Produto.dart';

class Venda {
  Funcionario funcionario;
  Produto produto;
  late double _valorVenda;

  double get valorVenda {
    return this._valorVenda;
  }

  set valorVenda(double valorVenda) {
    if (valorVenda > 0) {
      this._valorVenda = valorVenda;
    }
  }

  Venda({required this.funcionario, required this.produto});
}

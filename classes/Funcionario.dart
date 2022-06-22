class Funcionario {
  String nome;
  String sobrenome;
  String CPF;
  late double _salario;

  double get salario {
    return this._salario;
  }

  set salario(double salario) {
    if (salario > 0) {
      this._salario = salario;
    }
  }

  Funcionario({
    required this.nome,
    required this.sobrenome,
    required this.CPF,
  });
}

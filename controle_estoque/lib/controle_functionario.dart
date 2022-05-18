import 'dart:io';

void show() {
  // interface, função complementar
  print('''Informe o que deseja fazer: 
 ''');
}

String interfaceFuncionario(double salario, double valor, Function function) {
  return function();
}

// O bonus do funcionário não pode ser maior do que o limite de bonus definido,
// se for, pega o máximo possível
double bonificarSalarioFuncionario(double salario, double valorBonus,
    [double valorLimiteBonus = 0.5]) {
  double limite = salario * valorLimiteBonus;
  if (valorBonus > limite) {
    valorBonus = limite;
    return salario + valorBonus;
  } else {
    return salario + valorBonus;
  }
}

// O salário do funcionário não pode ser menor do que o salário mínimo,
// se for, pega o salário mínimo
double descontarSalarioFuncionario(double salario, double valorDesconto,
    [double salarioMinimo = 1212]) {
  double salarioDescontado = salario - valorDesconto;
  if (salarioDescontado < salarioMinimo) {
    return salarioMinimo;
  } else {
    return salarioDescontado;
  }
}

// soma a comissao do funcionário sobre o valor que ele vendeu no mês
double somarComissao(
    {required double salario,
    required double valorVendidoFuncionario,
    double percentualComissao = 0.1}) {
  double valorComissao = valorVendidoFuncionario * percentualComissao;
  return valorComissao + salario;
}

// soma a comissão ao salário quando o funcionário bate a meta, ou seja, tem
// 2 comissões, eles vão ter comissão por valor vendido e se tiver batido a meta
// tem um adicional no salário dessa meta, fora a comissão sobre o valor vendido
double somarComissaoMetaBatida(double salario, double valorVendidoFuncionario,
    double valorMeta, double percentualComissao) {
  double valorComissaoMeta = valorMeta * percentualComissao;
  if (valorVendidoFuncionario >= valorMeta) {
    return salario + valorComissaoMeta;
  } else {
    return salario;
  }
}

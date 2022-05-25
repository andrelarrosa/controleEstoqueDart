import 'dart:io';

void show() {
  // interface, função complementar
  print('''Informe o que deseja fazer: 
  01 - Bonificar salário do funcionário
  02 - Descontar salário do funcionário
  03 - Somar comissão ao salário do funcionário
  04 - Somar comissão de meta batida ao salário do funcionário
 ''');
  int opcao = int.parse(stdin.readLineSync()!);
  if (opcao != null) {
    print("Informe o salário do funcionário:");
    double salario = double.parse(stdin.readLineSync()!);
    switch (opcao) {
      case 1:
        print("Informe o valor da bonificação do salário do funcionário:");
        double valorBonus = double.parse(stdin.readLineSync()!);
        print("Informe o limite de bonificação que o funcionário pode ter:");
        double valorLimiteBonus = double.parse(stdin.readLineSync()!);
        double resultado =
            bonificarSalarioFuncionario(salario, valorBonus, valorLimiteBonus);
        print("O salário do funcionário é: ${resultado}");
        break;
      case 2:
        print("Informe o valor do desconto do salário funcionário:");
        double valorBonus = double.parse(stdin.readLineSync()!);
        print("Informe o limite de desconto que o funcionário pode ter:");
        double valorLimiteBonus = double.parse(stdin.readLineSync()!);
        double resultado =
            descontarSalarioFuncionario(salario, valorBonus, valorLimiteBonus);
        print("O salário do funcionário é: ${resultado}");
        break;
      case 3:
        print("Informe o valor que o funcionário vendeu:");
        double valorVendidoFuncionario = double.parse(stdin.readLineSync()!);
        print("Informe o percentual da comissão: ");
        double percentualComissao = double.parse(stdin.readLineSync()!);
        double resultado = somarComissao(
            salario: salario,
            valorVendidoFuncionario: valorVendidoFuncionario,
            percentualComissao: percentualComissao,
            validacao: (salario, valorVendidoFuncionario, percentualComissao) {
              if (salario < 0 ||
                  valorVendidoFuncionario < 0 ||
                  percentualComissao < 0) {
                return true;
              } else {
                return false;
              }
            });
        print("O salário do funcionário é: ${resultado}");
        break;
      case 4:
        print("Informe o valor que o funcionário vendeu:");
        double valorVendidoFuncionario = double.parse(stdin.readLineSync()!);
        print("Informe o valor da meta: ");
        double valorMeta = double.parse(stdin.readLineSync()!);
        print("Informe o percentual da comissão: ");
        double percentualComissao = double.parse(stdin.readLineSync()!);
        double resultado = somarComissaoMetaBatida(
            salario, valorVendidoFuncionario, valorMeta, percentualComissao,
            validacao: (double salario, double valorVendidoFuncionario,
                double valorMeta, double percentualComissao) {
          if (salario < 0 ||
              valorVendidoFuncionario < 0 ||
              valorMeta < 0 ||
              percentualComissao < 0) {
            return true;
          } else {
            return false;
          }
        });
        print("O salário do funcionário é: ${resultado}");
        break;
    }
  } else {
    throw new Exception("Selecione uma opção válida!");
  }
}

// O bonus do funcionário não pode ser maior do que o limite de bonus definido,
// se for, pega o máximo possível
double bonificarSalarioFuncionario(double salario, double valorBonus,
    [double valorLimiteBonus = 0.5]) {
  double limite = salario * valorLimiteBonus;
  if (valorBonus > limite) {
    return salario + limite;
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
    required Function validacao,
    double percentualComissao = 0.1}) {
  if (validacao(salario, valorVendidoFuncionario, percentualComissao)) {
    throw new Exception("Valores não podem ser negativos");
  }
  double valorComissao = valorVendidoFuncionario * percentualComissao;
  return valorComissao + salario;
}

// soma a comissão ao salário quando o funcionário bate a meta, ou seja, tem
// 2 comissões, eles vão ter comissão por valor vendido e se tiver batido a meta
// tem um adicional no salário dessa meta, fora a comissão sobre o valor vendido
double somarComissaoMetaBatida(double salario, double valorVendidoFuncionario,
    double valorMeta, double percentualComissao,
    {required Function validacao}) {
  if (validacao(
      salario, valorVendidoFuncionario, valorMeta, percentualComissao)) {
    throw new Exception("Valores não podem ser negativos");
  }
  double valorComissaoMeta = valorMeta * percentualComissao;
  if (valorVendidoFuncionario >= valorMeta) {
    return salario + valorComissaoMeta;
  } else {
    return salario;
  }
}

import 'dart:io';

void show() {
  // interface, função complementar
  print('''Informe o que deseja fazer: 
  01 - Saber a rentabilidade de um produto em valor
  02 - Saber a rentabilidade de um produto em porcentagem
  03 - Adicionar desconto em produto
  04 - Acrescer o valor de um produto
  05 - Acrescentar quantidade de um produto em estoque
  06 - Diminuir quantidade de um produto em estoque''');
  int opcao = int.parse(stdin.readLineSync()!);
  if (opcao != null) {
    switch (opcao) {
      case 1:
        print("Informe o valor da compra do produto: ");
        double valorCompra = double.parse(stdin.readLineSync()!);
        print("Informe o valor de venda do produto: ");
        double valorVenda = double.parse(stdin.readLineSync()!);
        double resultado = calculoRentabilidadeProdutoSobreValor(
            valorVenda, valorCompra,
            validacao: (double valorVenda, double valorCompra) =>
                (valorVenda < 0 && valorCompra < 0) ? false : true);
        print("A rentabilidade do produto é: ${resultado}");
        break;
      case 2:
        print("Informe o valor da compra do produto: ");
        double valorCompra = double.parse(stdin.readLineSync()!);
        print("Informe o valor de venda do produto: ");
        double valorVenda = double.parse(stdin.readLineSync()!);
        double resultado =
            calculoRentabilidadeProdutoPercentual(valorCompra, valorVenda);
        print("A rentabilidade do produto é: ${resultado}");
        break;
      case 3:
        print("Informe o valor da venda do produto: ");
        double valorVendaProduto = double.parse(stdin.readLineSync()!);
        print("Informe o valor do desconto do produto: ");
        double valorDesconto = double.parse(stdin.readLineSync()!);
        print("Informe o percentual máximo de desconto do produto: ");
        double percentualValorLimite = double.parse(stdin.readLineSync()!);
        double resultado = adicionarDescontoValorVenda(
            valorVendaProduto, valorDesconto, percentualValorLimite);
        print("O valor do produto agora é: ${resultado}");
        break;
      case 4:
        print("Informe o valor da venda do produto: ");
        double valorVendaProduto = double.parse(stdin.readLineSync()!);
        print("Informe o valor de acréscimo do produto: ");
        double valorAcrescimo = double.parse(stdin.readLineSync()!);
        print("Informe o percentual máximo de acréscimo do produto: ");
        double percentualValorLimite = double.parse(stdin.readLineSync()!);
        double resultado = adicionarAcrescimoValorVenda(
            valorVendaProduto, valorAcrescimo, percentualValorLimite);
        print("O valor do produto agora é: ${resultado}");
        break;
      case 5:
        print("Informe a quantidade atual de itens no estoque: ");
        double quantidadeAtual = double.parse(stdin.readLineSync()!);
        print("Informe a quantidade que deseja acrescentar no estoque: ");
        double quantidadeAcrescentada = double.parse(stdin.readLineSync()!);
        double resultado = acrescentarQuantidadeEstoque(
            quantidadeAtual, quantidadeAcrescentada,
            validacao:
                (double quantidadeAtual, double quantidadeAcrescentada) =>
                    (quantidadeAtual < 0 && quantidadeAcrescentada < 0)
                        ? false
                        : true);
        print("A quantidade em estoque do produto agora é: ${resultado}");
        break;
      case 6:
        print("Informe a quantidade atual de itens no estoque: ");
        double quantidadeAtual = double.parse(stdin.readLineSync()!);
        print("Informe a quantidade que deseja acrescentar no estoque: ");
        double quantidadeDiminuicao = double.parse(stdin.readLineSync()!);
        double resultado =
            diminuirQuantidadeEstoque(quantidadeAtual, quantidadeDiminuicao);
        print("A quantidade em estoque do produto agora é: ${resultado}");
        break;
    }
  } else {
    throw new Exception("Selecione uma opção válida!");
  }
}

// Rentabilidade do produto com o valor em dinheiro
double calculoRentabilidadeProdutoSobreValor(
    double valorCompra, double valorVenda,
    {required Function validacao}) {
  if (validacao(valorVenda, valorCompra)) {
    return valorCompra - valorVenda;
  } else {
    throw new Exception("Um dos valores é negativo!");
  }
}

// Rentabilidade do produto com o valor em percentual
double calculoRentabilidadeProdutoPercentual(
    double valorCompra, double valorVenda) {
  double percentual = ((valorCompra / valorVenda) - 1) * 100;
  return percentual;
}

// adiciona desconto no valor da venda de um produto, se passar do valor limite
// de desconto, pega o máximo de desconto possível
double adicionarDescontoValorVenda(
    double valorVendaProduto, double valorDesconto,
    [double percentualValorLimite = 0.20]) {
  double valorLimiteDesconto = valorDesconto * percentualValorLimite;
  if (valorDesconto <= valorLimiteDesconto) {
    return valorVendaProduto - valorDesconto;
  } else {
    return valorVendaProduto - valorLimiteDesconto;
  }
}

// O acrescimo no valor da venda de um produto, não pode passar do valor limite,
// se passar, acrescenta o limite do valor
double adicionarAcrescimoValorVenda(
    double valorVendaProduto, double valorAcrescimo,
    [double percentualValorLimite = 0.20]) {
  if (percentualValorLimite > 1)
    percentualValorLimite = percentualValorLimite / 100;
  double valorLimiteAcrescimo = valorAcrescimo * percentualValorLimite;
  if (valorAcrescimo <= valorLimiteAcrescimo) {
    return valorVendaProduto + valorAcrescimo;
  } else {
    return valorVendaProduto + valorLimiteAcrescimo;
  }
}

// acrescenta produtos em estoque
double acrescentarQuantidadeEstoque(
    double quantidadeAtual, double quantidadeAcrescentada,
    {required Function validacao}) {
  if (validacao(quantidadeAtual, quantidadeAcrescentada)) {
    throw Exception("As quantidades tem que ser positivas");
  }
  if (quantidadeAtual == null || quantidadeAcrescentada == null) {
    throw new Exception("Todos os valores devem ser preenchidos!");
  }
  return quantidadeAcrescentada + quantidadeAtual;
}

// diminui produtos em estoque
double diminuirQuantidadeEstoque(
    double quantidadeAtual, double quantidadeDiminuicao) {
  if (quantidadeAtual == null || quantidadeDiminuicao == null) {
    throw new Exception("Todos os valores devem ser preenchidos!");
  }
  return quantidadeAtual - quantidadeDiminuicao;
}

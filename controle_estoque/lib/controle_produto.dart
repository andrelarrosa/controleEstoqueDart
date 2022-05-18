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
}

String interfaceProduto(double salario, double valor, Function function) {
  return function();
}

double calculoRentabilidadeProdutoSobreValor(
    double valorCompra, double valorVenda) {
  return valorCompra - valorVenda;
}

double calculoRentabilidadeProdutoPercentual(
    double valorCompra, double valorVenda) {
  double percentual = ((valorCompra / valorVenda) - 1) * 100;
  return percentual;
}

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

double adicionarAcrescimoValorVenda(
    double valorVendaProduto, double valorAcrescimo,
    [double percentualValorLimite = 0.20]) {
  double valorLimiteAcrescimo = valorAcrescimo * percentualValorLimite;
  if (valorAcrescimo <= valorLimiteAcrescimo) {
    return valorVendaProduto + valorAcrescimo;
  } else {
    return valorVendaProduto + valorLimiteAcrescimo;
  }
}

double acrescentarQuantidadeEstoque(
    double quantidadeAtual, double quantidadeAcrescentada) {
  if (quantidadeAtual == null || quantidadeAcrescentada == null) {
    throw new Exception("Todos os valores devem ser preenchidos!");
  }
  return quantidadeAcrescentada + quantidadeAtual;
}

double diminuirQuantidadeEstoque(
    double quantidadeAtual, double quantidadeDiminuicao) {
  if (quantidadeAtual == null || quantidadeDiminuicao == null) {
    throw new Exception("Todos os valores devem ser preenchidos!");
  }
  return quantidadeDiminuicao + quantidadeAtual;
}

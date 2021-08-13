import 'produto.dart';

class Sobremesa extends Produto{
  String tipo = "";
  int qtdUn = 0;

  @override
  String toString() {
    return ("Codigo: ${codigo} \nNome: ${nome} \nPreço: ${preco} \nTipo: ${tipo} \nQuantidade: ${qtdUn}");
  }
}
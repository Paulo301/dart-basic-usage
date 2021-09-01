import 'produto.dart';

class Sobremesa extends Produto{
  String tipo = "";

  @override
  String toString() {
    return ("Codigo: ${codigo} \nNome: ${nome} \nPreço: ${preco} \nTipo: ${tipo}\n");
  }
}
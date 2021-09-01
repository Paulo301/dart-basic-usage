import 'produto.dart';

class Bebida extends Produto{
  String marca = "";

  @override
  String toString() {
    return ("Codigo: ${codigo} \nNome: ${nome} \nPreço: ${preco} \nMarca: ${marca}\n");
  }
}
import 'produto.dart';

class Bebida extends Produto{
  String marca = "";
  int qtdMl = 0;

  @override
  String toString() {
    return ("Codigo: ${codigo} \nNome: ${nome} \nPreço: ${preco} \nMarca: ${marca} \nQuantidade: ${qtdMl}ml");
  }
}
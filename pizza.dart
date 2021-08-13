import 'produto.dart';

class Pizza extends Produto{
  List<int> numPedacos = [];

  @override
  String toString() {
    return ("Codigo: ${codigo} \nNome: ${nome} \nPreço: ${preco} \nTamanhos: ${numPedacos.toString()} pedaços");
  }
}
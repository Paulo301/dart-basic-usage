import 'produto.dart';

class Pizza extends Produto{
  List<int> numPedacos = [];

  @override
  String toString() {
    String tamanhos = "";
    numPedacos.forEach((element) {
      tamanhos = tamanhos + "\n>>>${element} pedaço(s)";
    });
    return ("Codigo: ${codigo} \nNome: ${nome} \nPreço: ${preco} \nTamanhos: ${tamanhos} \n");
  }
}
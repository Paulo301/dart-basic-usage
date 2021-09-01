import 'produto.dart';

class Pedido{
  int codigo = 0;
  List<Produto> itensPedido = [];
  double valor = 0.0;
  String date = DateTime.now().toString();

  @override
  String toString() {
    String itens = "";
    itensPedido.forEach((element) {
      itens = itens + "\n>>>${element.toString()}";
    });
    return ("Codigo: ${codigo} \nItens: ${itens} \nValor: ${valor} \nData e Hora: ${date} \n");
  }
}
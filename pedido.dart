import 'produto.dart';

class Pedido{
  int codigo = 0;
  List<Produto> itensPedido = [];
  double valor = 0.0;
  String date = DateTime.now().toString();
}
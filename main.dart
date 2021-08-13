import 'dart:io';

import 'produto.dart';
import 'pedido.dart';
void main(){
  List<Produto> bancoProdutos;
  List<Pedido> bancoPedidos;

  String chosenOption;

  while(true){
    print("Digite o número correspondente a opção que deseja utilizar:"+
            "\n>>> 1 - Para registrar um produto"+
            "\n>>> 2 - Para listar os produtos registrados"+
            "\n>>> 3 - Para remover um produto"+
            "\n>>> 4 - Para registrar um pedido"+
            "\n>>> 5 - Para listar os pedidos registrados"+
            "\n>>> 6 - Para encerrar a execução");
    chosenOption = stdin.readLineSync() ?? "";

    if(chosenOption == "1"){

    } else if(chosenOption == "2"){

    } else if(chosenOption == "3"){
      
    } else if(chosenOption == "4"){
      
    } else if(chosenOption == "5"){
      
    } else if(chosenOption == "6"){
      break;
    } else{
      print("Não foi digitado uma opção válida");
    }
  }
}
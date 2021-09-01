import 'dart:io';

import 'bebida.dart';
import 'pizza.dart';
import 'produto.dart';
import 'pedido.dart';
import 'sobremesa.dart';

void listarProdutos(Produto produto){
  print(">>> "+produto.toString());
}

void listarPedidos(Pedido pedido){
  print(">> "+pedido.toString());
}

void main(){
  List<Produto> bancoProdutos = [];
  List<Pedido> bancoPedidos = [];

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
      String chosenProdutctType;
      int nextCode = 0;

      print("Digite o número correspondente ao tipo de produto que deseja cadastrar:"+
            "\n>>> 1 - Para registrar uma pizza"+
            "\n>>> 2 - Para registrar uma bebida"+
            "\n>>> 3 - Para registrar uma sobremesa");
      chosenProdutctType = stdin.readLineSync() ?? "";

      if(bancoProdutos.length != 0){
        nextCode = bancoProdutos.last.codigo + 1;
      }

      if(chosenProdutctType == "1"){
        Pizza newProduct = new Pizza();

        print("Digite o nome do produto");
        newProduct.nome = stdin.readLineSync() ?? "";
        print("Digite o preço do produto (o preço será o mesmo para todos os tamanhos)");
        newProduct.preco = double.parse(stdin.readLineSync() ?? "");
        print("Digite o número de pedaços de cada tamanho da pizza, separados por vírgula");
        (stdin.readLineSync() ?? "").split(",").forEach((element) {
          newProduct.numPedacos.add(int.parse(element));
        });
        newProduct.codigo=nextCode;
        bancoProdutos.add(newProduct);
        print("O produto: \n"+newProduct.toString()+"\nFoi cadastrado");
      } else if(chosenProdutctType == "2"){
        Bebida newProduct = new Bebida();

        print("Digite o nome do produto");
        newProduct.nome = stdin.readLineSync() ?? "";
        print("Digite o preço do produto");
        newProduct.preco = double.parse(stdin.readLineSync() ?? "");
        print("Digite a marca da bebida");
        newProduct.marca = stdin.readLineSync() ?? "";
        newProduct.codigo=nextCode;
        bancoProdutos.add(newProduct);
        print("O produto: \n"+newProduct.toString()+"\nFoi cadastrado");

      } else if(chosenProdutctType == "3"){
        Sobremesa newProduct = new Sobremesa();

        print("Digite o nome do produto");
        newProduct.nome = stdin.readLineSync() ?? "";
        print("Digite o preço do produto");
        newProduct.preco = double.parse(stdin.readLineSync() ?? "");
        print("Digite o tipo da sobremesa");
        newProduct.tipo = stdin.readLineSync() ?? "";
        newProduct.codigo=nextCode;
        bancoProdutos.add(newProduct);
        print("O produto: \n"+newProduct.toString()+"\nFoi cadastrado");

      } else{
        print("Não foi digitado uma opção válida, voltando ao menu principal");
      }
    } else if(chosenOption == "2"){
      print("\nProdutos: \n");
      bancoProdutos.forEach(listarProdutos);
    } else if(chosenOption == "3"){
      print("Digite o codigo do produto a ser deletado");
      String id = stdin.readLineSync() ?? "";
      int index =  bancoProdutos.indexWhere((produto) => produto.codigo.toString() == id);
      if(index != -1){
        bancoProdutos.removeAt(index);
        print("Produto deletado com sucesso!");
      } else{
        print("O codigo digitado não foi encontrado");
      }
    } else if(chosenOption == "4"){
      Pedido newOrder = new Pedido();
      int nextCode = 0;

      if(bancoPedidos.length != 0){
        nextCode = bancoPedidos.last.codigo + 1;
      }

      print("Digite os codigos dos produtos do pedido, separados por vírgula");
      List<String> cods = (stdin.readLineSync() ?? "").split(",");
      cods.forEach((codigo) {
        int index = bancoProdutos.indexWhere((produto) => produto.codigo == int.parse(codigo));
        if(index != -1){
          newOrder.itensPedido.add(bancoProdutos.elementAt(index));
        } else{
          print("O código ${codigo} não corresponde a um produto");
        }
      });
      if(cods.length != newOrder.itensPedido.length){
        String option = "";
        while((option != "1") && (option != "2")){
          if(option == ""){
            print("Um ou mais produtos digitados não foram encontrado(s), "+ 
                  "digite 1 para continuar com o pedido mesmo assim ou 2 para voltar ao menu principal");
          } else{
            print("Opção invalida digitada, digite 1 para continuar com o pedido ou "+
                  "2 para voltar ao menu principal");
          }
          option = stdin.readLineSync() ?? "";
        }
        if(option == "1"){
          newOrder.valor = newOrder.itensPedido.map((produto) => produto.preco)
                                                .reduce((value, element) => value + element);
          newOrder.codigo = nextCode;
          bancoPedidos.add(newOrder);
          print("Pedido salvo");
        }
      } else{
        newOrder.valor = newOrder.itensPedido.map((produto) => produto.preco)
                                                .reduce((value, element) => value + element);
        newOrder.codigo = nextCode;
        bancoPedidos.add(newOrder);
        print("Pedido salvo");
      }
    } else if(chosenOption == "5"){
      print("Pedidos: \n");
      bancoPedidos.forEach(listarPedidos);
    } else if(chosenOption == "6"){
      break;
    } else{
      print("Não foi digitado uma opção válida");
    }
  }
}
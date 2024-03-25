import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lotus_food_totem/common/components/menu_variables.dart';

import '../collections/complemento.dart';
import '../collections/grupo.dart';
import '../collections/produto.dart';
import '../page/complement/complement_page.dart';

class MenuPageController extends GetxController {
  TextEditingController informationTextController = TextEditingController();

  var mealOption = 0.obs;
  var grupos = [].obs;
  var produtos = [].obs;
  var complementos = [].obs;
  var grupoSelecionado = 0.obs;
  var produtosEscolhidos = [].obs;
  var complementosFiltrados = [].obs;
  var complementosSelecionados = [].obs;
  var carrinho = [].obs;
  var total = 0.0.obs;

  // Modifica a opção da refeição ( 0 - levar, 1 - comer aqui)
  void setMealOption(int value) {
    mealOption.value = value;
    update();
  }

  // Modifica o total
  void setTotal(double value) {
    total.value = value;
    update();
  }

  // Retorna a opção da refeição
  String getMealOption() {
    return mealOption.value == MenuVariables.COMER_AQUI
        ? 'COMER AQUI'
        : 'LEVAR';
  }

  // Adiciona "grupos" vindos do banco de dados local na variavel grupos
  void setGrupos(List<grupo> grupos) {
    this.grupos.clear();
    this.grupos.addAll(grupos);
    update();
  }

  // Atualiza a variável do grupo
  void updateGrupoSelecionado(int index) {
    grupoSelecionado.value = index;
    grupoSelecionado.refresh();
    update();
  }

  // atualiza a lista de produtos escolhidos de acordo com o id_grupo escolhido
  void updateProdutosEscolhidos() {
    produtosEscolhidos.clear();
    var newProdutos = produtos.where(
        (prod) => prod.id_grupo == grupos[grupoSelecionado.value].id_grupo);
    produtosEscolhidos.addAll(newProdutos.toList());
    update();
  }

  // Adiciona "produtos" vindos do banco de dados local na variavel produtos
  void setProdutos(List<produto> produtos) {
    this.produtos.clear();
    this.produtos.addAll(produtos);
    update();
  }

  // Adiciona "complementos" vindos do banco de dados local na variavel complementos
  void setComplementos(List<complemento>? complementos) {
    this.complementos.clear();
    if (complementos != null && complementos.isNotEmpty) {
      this.complementos.addAll(complementos);
    } else {
      this.complementos.clear();
    }
    update();
  }

  // Atualiza a lista de complementos filtrados de acordo com o id_grupo do produto escolhido
  void updateComplementosFiltrados(produto produto) {
    var newComplementos =
        complementos.where((comp) => comp.id_grupo == produto.id_grupo);
    complementosFiltrados.addAll(newComplementos.toList());
    update();
  }

  // Atualiza a lista de complementos escolhidos
  void updateComplementosSelecionados(complemento complemento) {
    try {
      var exist = complementosSelecionados
          .firstWhere((item) => item.item == complemento.item);
      if (exist != null) {
        complementosSelecionados.remove(exist);
      } else {
        complementosSelecionados.add(complemento);
      }
    } catch (e) {
      complementosSelecionados.add(complemento);
    }
    update();
  }

  // Atualiza a lista de complementos escolhidos
  void updateComplementosSelecionadosFromCartShop(complemento? itens) {
    if (itens != null) {
      complementosSelecionados.add(itens);
    }
    update();
  }

  // Adiciona itens ao carrinho
  void updateCarrinho(produto produtoEscolhido) {
    var comp = [];
    for (complemento element in complementosSelecionados) {
      comp.add(element);
    }

    carrinho.add({
      'produto': produtoEscolhido,
      'complementos': comp,
      'info': informationTextController.text
    });
  }

  // Atualiza o carrinho de acordo com o item escolhido
  void updateCarrinhoCartShop(produto produtoEscolhido, int index) {
    var newItem = {
      'produto': produtoEscolhido,
      'complementos': List.from(complementosSelecionados),
      'info': informationTextController.text
    };

    carrinho[index] = newItem;
    update();
    clearComplementoSelecionado();
    clearInformationTextController();
  }

  // Edita o item do carrinho
  void editItemCarrinho(Map<String, dynamic> item, int index) {
    updateComplementosFiltrados(item['produto']);
    if (item['complementos'].isNotEmpty) {
      complementosSelecionados.clear();
      for (var element in item['complementos']) {
        updateComplementosSelecionadosFromCartShop(element);
      }
    }
    informationTextController.text = item['info'];
    Get.dialog(
      barrierDismissible: false,
      ComplementPage(
        produtoEscolhido: item['produto'],
        itemCarrinho: item,
        isEdit: true,
        index: index,
      ),
    );
  }

  // Remove o complemento selecionado
  void removeComplementoSelecionado(complemento complemento) {
    complementosSelecionados.remove(complemento);
    update();
  }

  // Remove o item do carrinho
  void removeItemCarrinho(int index) {
    carrinho.removeAt(index);
    update();
  }

  // Limpa a lista de Complementos Selecionados
  void clearComplementoSelecionado() {
    complementosSelecionados.clear();
    update();
  }

  // Limpa a lista de Grupos
  void clearGrupos() {
    grupos.clear();
    update();
  }

  // Limpa a lista de Produtos
  void clearProdutos() {
    produtos.clear();
    update();
  }

  // Limpa a lista de Complementos
  void clearComplementos() {
    complementos.clear();
    update();
  }

  // Limpa a lista do carrinho
  void clearCarrinho() {
    carrinho.clear();
    update();
  }

  // Limpa o controlador do campo de texto InformationTextController
  void clearInformationTextController() {
    informationTextController.clear();
    update();
  }

  // Limpa as listas de Grupos, Produtos e Complementos
  void clearAll() {
    grupoSelecionado.value = 0;
    produtosEscolhidos.clear();
    complementosFiltrados.clear();
    complementosSelecionados.clear();
    carrinho.clear();
    total.value = 0.0;
    update();
  }
}

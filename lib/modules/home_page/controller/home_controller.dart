import 'dart:developer';

import 'package:bazar365/modules/home_page/model/card_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  RxInt cartCount = 0.obs;
  RxInt totalCost = 0.obs;

  int addCartVariable = 0;

  List<CardModel> checkOutList = <CardModel>[].obs;

  void cartCountadd() {
    cartCount = cartCount + 1;
  }

  void addCheckOutList(CardModel cardModel) {
    checkOutList.add(cardModel);
    log(checkOutList.length.toString());
    // update();
  }
}

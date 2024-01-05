import 'package:bazar365/modules/home_page/controller/home_controller.dart';
import 'package:bazar365/modules/home_page/model/card_model.dart';
import 'package:bazar365/modules/home_page/view/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Shopping Cart'),
        ),
        body: ListView.builder(
            itemCount: homeController.checkOutList!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading:
                    Image.asset(homeController.checkOutList![index].image!),
                title: Text(homeController.checkOutList![index].name!),
                subtitle: Row(
                  children: [
                    Container(
                      width: 115,
                      height: 34,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 2),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFF5F5F5),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF444444)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            '-',
                            style: TextStyle(
                              color: Color(0xFF001E00),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                              letterSpacing: -0.32,
                            ),
                          ),
                          SizedBox(width: 27),
                          Text(
                            '2',
                            style: TextStyle(
                              color: Color(0xFF001E00),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              height: 0.10,
                              letterSpacing: -0.28,
                            ),
                          ),
                          SizedBox(width: 27),
                          Text(
                            '+',
                            style: TextStyle(
                              color: Color(0xFF001E00),
                              fontSize: 16,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w400,
                              height: 0.08,
                              letterSpacing: -0.32,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                trailing: Column(
                  children: [
                    Text(
                      homeController.checkOutList![index].price!,
                      style: const TextStyle(
                        color: Color(0xFF001E00),
                        fontSize: 20,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w700,
                        height: 0.05,
                        letterSpacing: -0.40,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        for (CardModel cardModel in cardModelList) {
                          if (!homeController.checkOutList!
                              .any((element) => element.id == cardModel.id)) {
                            homeController.checkOutList!.remove(cardModel);
                            setState(() {});
                          }
                        }
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

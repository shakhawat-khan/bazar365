import 'dart:developer';
import 'dart:ffi';

import 'package:bazar365/main.dart';
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
  HomeController homeController = Get.put(HomeController());
  Future<List<CardModel>> cartListAll() async {
    // Get a reference to the database.
    final database = await db;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await database.query('cart');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return CardModel(
        id: maps[i]['id'] as int,
        name: maps[i]['name'] as String,
        image: maps[i]['image'] as String,
        price: maps[i]['price'] as String,
        discount: maps[i]['discount'] as String,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: ListView.builder(
          itemCount: homeController.checkOutList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(homeController.checkOutList[index].image!),
              title: Text(homeController.checkOutList[index].name!),
              subtitle: Row(
                children: [
                  Container(
                    width: 115,
                    height: 34,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFF5F5F5),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFF444444)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Text(
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
                        ),
                        const SizedBox(width: 27),
                        const Text(
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
                        const SizedBox(width: 27),
                        InkWell(
                          onTap: () {},
                          child: const Text(
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              trailing: Column(
                children: [
                  Text(
                    homeController.checkOutList[index].price!,
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
                    onTap: () async {
                      Future<void> deleteList(int id) async {
                        // Get a reference to the database.
                        final database = await db;

                        // Remove the Dog from the database.
                        await database.delete(
                          'cart',
                          // Use a `where` clause to delete a specific dog.
                          where: 'id = ?',
                          // Pass the Dog's id as a whereArg to prevent SQL injection.
                          whereArgs: [id],
                        );
                      }

                      await deleteList(homeController.checkOutList[index].id!);

                      homeController.checkOutList.value = await cartListAll();
                      Future<List<CardModel>> cartList() async {
                        // Get a reference to the database.
                        final database = await db;

                        // Query the table for all The Dogs.
                        final List<Map<String, dynamic>> maps =
                            await database.query('cart');

                        // Convert the List<Map<String, dynamic> into a List<Dog>.
                        return List.generate(maps.length, (i) {
                          return CardModel(
                            id: maps[i]['id'] as int,
                            name: maps[i]['name'] as String,
                            image: maps[i]['image'] as String,
                            price: maps[i]['price'] as String,
                            discount: maps[i]['discount'] as String,
                          );
                        });
                      }

                      homeController.checkOutList.value = await cartList();

                      setState(() {});

                      // Future<List<CardModel>> dogs() async {
                      //   // Get a reference to the database.
                      //   final database = await db;

                      //   // Query the table for all The Dogs.
                      //   final List<Map<String, dynamic>> maps =
                      //       await database.query('cart');

                      //   // Convert the List<Map<String, dynamic> into a List<Dog>.
                      //   return List.generate(maps.length, (i) {
                      //     log(maps.length.toString());
                      //     return CardModel(
                      //       id: maps[i]['id'] as int,
                      //       name: maps[i]['name'] as String,
                      //       image: maps[i]['image'] as String,
                      //       price: maps[i]['price'] as String,
                      //       discount: maps[i]['discount'] as String,
                      //     );
                      //   });
                      // }

                      // List<CardModel> test = [];

                      // test = await dogs();
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
      persistentFooterButtons: <Widget>[
        Column(
          children: [
            const Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Subtotal',
                  style: TextStyle(
                    color: Color(0xFF001E00),
                    fontSize: 18,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: -0.36,
                  ),
                ),
                Spacer(),
                Text(
                  'Tk. 641',
                  style: TextStyle(
                    color: Color(0xFF001E00),
                    fontSize: 18,
                    fontFamily: 'Proxima Nova',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: -0.36,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 398,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 5),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFF0DB04B),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Color(0xFF11823B)),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w700,
                      height: 0.07,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        )
      ],
    );
  }
}

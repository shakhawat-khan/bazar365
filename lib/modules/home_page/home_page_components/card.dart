import 'dart:developer';

import 'package:bazar365/main.dart';
import 'package:bazar365/modules/home_page/controller/home_controller.dart';
import 'package:bazar365/modules/home_page/model/card_model.dart';
import 'package:bazar365/modules/home_page/view/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sqflite/sqflite.dart';

class CardComponent extends StatefulWidget {
  final int id;
  final String image;
  final String price;
  final String name;
  final String discount;
  final int quantity;

  const CardComponent(
      {super.key,
      required this.id,
      required this.image,
      required this.price,
      required this.name,
      required this.discount,
      required this.quantity});

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  Future<void> insertCart(CardModel cardModel) async {
    // Get a reference to the database.
    final database = await db;

    // Insert the Dog into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same dog is inserted twice.
    //
    // In this case, replace any previous data.
    await database.insert(
      'cart',
      cardModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return SizedBox(
      width: 195,
      height: 269,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            bottom: 14,
            right: 16,
          ),
          child: Column(
            children: [
              SizedBox(
                width: 180,
                height: 100,
                child: Stack(
                  children: [
                    Positioned(
                      right: 15,
                      top: 10,
                      child: Image.asset(widget.image),
                    ),
                    Positioned(
                      left: 0,
                      child: InkWell(
                        onTap: () async {
                          homeController.cartCountadd();

                          if (homeController.checkOutList.isEmpty) {
                            // homeController.addCheckOutList(
                            //   CardModel(
                            //     id: widget.id,
                            //     discount: widget.discount,
                            //     image: widget.image,
                            //     name: widget.name,
                            //     price: widget.price,
                            //   ),
                            // );
                            insertCart(
                              CardModel(
                                  id: widget.id,
                                  discount: widget.discount,
                                  image: widget.image,
                                  name: widget.name,
                                  price: widget.price,
                                  quantity: widget.quantity),
                            );
                          } else {
                            for (int i = 0;
                                i < homeController.checkOutList.length;
                                i++) {
                              if (homeController.checkOutList[i].id! !=
                                  widget.id) {
                                // homeController.addCheckOutList(
                                //   CardModel(
                                //     id: id,
                                //     discount: discount,
                                //     image: image,
                                //     name: name,
                                //     price: price,
                                //   ),
                                // );

                                homeController.addCartVariable++;
                              }
                            }

                            if (homeController.addCartVariable ==
                                homeController.checkOutList.length) {
                              homeController.addCheckOutList(
                                CardModel(
                                  id: widget.id,
                                  discount: widget.discount,
                                  image: widget.image,
                                  name: widget.name,
                                  price: widget.price,
                                  quantity: widget.quantity,
                                ),
                              );
                            }
                            homeController.addCartVariable = 0;
                          }

                          // for (CardModel cardModel in cardModelList) {
                          //   if (!homeController.checkOutList!
                          //       .any((element) => element.id == id)) {
                          //     homeController.checkOutList!.add(cardModel);
                          //   }
                          // }
                          insertCart(
                            CardModel(
                                id: widget.id,
                                discount: widget.discount,
                                image: widget.image,
                                name: widget.name,
                                price: widget.price,
                                quantity: widget.quantity),
                          );

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
                                  quantity: maps[i]['quantity'] as int);
                            });
                          }

                          homeController.checkOutList.value = await cartList();

                          log(homeController.checkOutList.length.toString());

                          setState(() {});
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 38,
                              height: 38,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: -25,
                      top: -12,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(0.31),
                        child: Container(
                          width: 110,
                          height: 50,
                          decoration: const ShapeDecoration(
                            color: Color(0xFF89CF6E),
                            shape: StarBorder(
                              points: 20,
                              innerRadiusRatio: 0.85,
                              pointRounding: .50,
                              valleyRounding: 0,
                              rotation: 0,
                              squash: .5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 6,
                      top: 10,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(0.38),
                        child: Text(
                          widget.discount,
                          style: const TextStyle(
                            color: Color(0xFF744210),
                            fontSize: 14,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 93,
                    height: 16,
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFB2F5EA),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'PLASTIC FREE',
                          style: TextStyle(
                            color: Color(0xFF234E52),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0.11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'IN STOCK',
                    style: TextStyle(
                      color: Color(0xFF0DB04B),
                      fontSize: 12,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: -0.48,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: const Color(0xFF1D1D21),
                      fontSize: 16.sp,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: -0.32,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              const Row(
                children: [
                  Text(
                    '1kg',
                    style: TextStyle(
                      color: Color(0xFF828282),
                      fontSize: 12,
                      fontFamily: 'Proxima Nova',
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: -0.24,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 140.w,
                    height: 25.h,
                    child: Row(
                      children: [
                        Text(
                          widget.price,
                          style: const TextStyle(
                            color: Color(0xFF1D1D21),
                            fontSize: 18,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: -0.40,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 42.w,
                          height: 20.h,
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  '৳ 300',
                                  style: TextStyle(
                                    color: Color(0xFF11823B),
                                    fontSize: 16,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                    letterSpacing: -0.32,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1,
                                top: 8,
                                child: Container(
                                  width: 41,
                                  height: 1,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFEB5757)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

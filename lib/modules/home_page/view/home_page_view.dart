import 'package:bazar365/main.dart';
import 'package:bazar365/modules/home_page/controller/home_controller.dart';
import 'package:bazar365/modules/home_page/home_page_components/card.dart';
import 'package:bazar365/modules/home_page/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

List<CardModel> cardModelList = [
  CardModel(
      id: 1,
      image: 'assets/product/image 3.png',
      discount: '40% OFF',
      name: 'Orange Fruit Fresh',
      price: '৳ 220',
      quantity: 1),
  CardModel(
      id: 2,
      image: 'assets/product/image 6.png',
      discount: '20% OFF',
      name: 'Apple Fruit Fresh',
      price: '৳ 320',
      quantity: 1),
  CardModel(
      id: 3,
      image: 'assets/product/image 8.png',
      discount: '30% OFF',
      name: 'Potato  Fresh',
      price: '৳ 420',
      quantity: 1),
  CardModel(
      id: 4,
      image: 'assets/product/image 9.png',
      discount: '50% OFF',
      name: 'Carrot Fresh',
      price: '৳ 520',
      quantity: 1),
  CardModel(
      id: 5,
      image: 'assets/product/Variant3.png',
      discount: '70% OFF',
      name: 'Carrot Fresh',
      price: '৳ 420',
      quantity: 1),
];

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: "Name",
      child: Text(
        "Name",
        style: TextStyle(),
      ),
    ),
    const DropdownMenuItem(
      value: "Price",
      child: Text(
        "Price",
      ),
    ),
    const DropdownMenuItem(
      value: "None",
      child: Text(
        "None",
      ),
    ),
  ];
  return menuItems;
}

String tempValue = 'None';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Future<List<CardModel>> cartList() async {
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

      homeController.checkOutList.value = await cartList();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fruits & Vegetables',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 24,
            fontFamily: 'Proxima Nova',
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: -0.48,
          ),
        ),
        actions: const [Icon(Icons.production_quantity_limits)],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 200.w,
                  height: 50.h,
                  padding: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60.w,
                        child: const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Sort',
                                style: TextStyle(
                                  color: Color(0xFF858693),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: tempValue,
                          items: dropdownItems,
                          onChanged: (String? newValue) {
                            setState(() {
                              if (newValue! == 'Price') {
                                cardModelList.sort((a, b) {
                                  return a.price!.compareTo(b.price!);
                                });
                              } else if (newValue == 'Name') {
                                cardModelList.sort((a, b) {
                                  return a.name!.compareTo(b.name!);
                                });
                              } else if (newValue == 'None') {
                                cardModelList.shuffle();
                              }

                              tempValue = newValue;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    if (tempValue == 'None')
                      ...[]
                    else if (tempValue == 'Price') ...[
                      Row(
                        children: [
                          const DownArrow(),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 21.w,
                            height: 44.h,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 11.w,
                                  height: 20.h,
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      color: const Color(0xFF001E00),
                                      fontSize: 16.sp,
                                      fontFamily: 'Proxima Nova',
                                      fontWeight: FontWeight.w400,
                                      height: 0.09,
                                    ),
                                  ),
                                ),
                                Text(
                                  '10',
                                  style: TextStyle(
                                    color: const Color(0xFF001E00),
                                    fontSize: 16.sp,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.w400,
                                    height: 0.09.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ] else if (tempValue == 'Name') ...[
                      Row(
                        children: [
                          const DownArrow(),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 11.w,
                            height: 44.h,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 11.w,
                                  height: 20.h,
                                  child: Text(
                                    'A',
                                    style: TextStyle(
                                      color: const Color(0xFF001E00),
                                      fontSize: 16.sp,
                                      fontFamily: 'Proxima Nova',
                                      fontWeight: FontWeight.w400,
                                      height: 0.09,
                                    ),
                                  ),
                                ),
                                Text(
                                  'Z',
                                  style: TextStyle(
                                    color: const Color(0xFF001E00),
                                    fontSize: 16.sp,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.w400,
                                    height: 0.09.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ],
                ),
                SizedBox(
                  width: 18.w,
                ),
                Container(
                  width: 130,
                  height: 40,
                  padding: const EdgeInsets.only(
                      top: 8, left: 16, right: 12, bottom: 8),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFE0E0E0)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Show',
                                style: TextStyle(
                                  color: Color(0xFF858693),
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  color: Color(0xFF001E00),
                                  fontSize: 16,
                                ),
                              ),
                              TextSpan(
                                text: '5',
                                style: TextStyle(
                                  color: Color(0xFF001E00),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // const CardComponent(),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items in each row
                  mainAxisSpacing: 6.0, // spacing between rows
                  crossAxisSpacing: 6.0, // spacing between columns
                  mainAxisExtent: 256,
                ),
                // padding around the grid
                itemCount: cardModelList.length, // total number of items
                itemBuilder: (context, index) {
                  return CardComponent(
                    image: cardModelList[index].image!,
                    price: cardModelList[index].price!,
                    name: cardModelList[index].name!,
                    discount: cardModelList[index].discount!,
                    id: cardModelList[index].id!,
                    quantity: cardModelList[index].quantity!,
                  );
                },
              ),
            ),

            // Expanded(
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     children: List.generate(
            //       10,
            //       (index) {
            //         return Container(
            //           height: 200,
            //           color: Colors.blue,
            //           margin: const EdgeInsets.all(10),
            //           child: Center(
            //             child: Text(
            //               'Item $index',
            //               style: const TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 20,
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // )

            // Expanded(
            //     child: ListView.builder(
            //         itemCount: 10,
            //         itemBuilder: (context, index) {
            //           return const CardComponent();
            //         }))
          ],
        ),
      ),
    );
  }
}

class DownArrow extends StatelessWidget {
  const DownArrow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 14,
      height: 40,
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            right: 0,
            top: 26,
            child: SizedBox(
              width: 14,
              height: 14,
              child: Stack(children: [
                Icon(
                  Icons.arrow_downward_rounded,
                  color: Color(0xFF001E00),
                )
              ]),
            ),
          ),
          Positioned(
            left: 11,
            top: 2,
            child: Container(
              width: 2,
              height: 35,
              decoration: ShapeDecoration(
                color: const Color(0xFF001E00),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

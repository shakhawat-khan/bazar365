import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({super.key});

  @override
  Widget build(BuildContext context) {
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
                        child: Image.asset('assets/product/image 3.png')),
                    Positioned(
                      left: 0,
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
              const Row(
                children: [
                  Text(
                    'Guava Fruit Fresh',
                    style: TextStyle(
                      color: Color(0xFF1D1D21),
                      fontSize: 16,
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
                    width: 104,
                    height: 20,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '৳ 220',
                          style: TextStyle(
                            color: Color(0xFF1D1D21),
                            fontSize: 20,
                            fontFamily: 'Proxima Nova',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: -0.40,
                          ),
                        ),
                        const SizedBox(width: 8),
                        SizedBox(
                          width: 42,
                          height: 16,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

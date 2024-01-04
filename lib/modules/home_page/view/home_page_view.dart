import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ClassType { classA, classB, ClassC, ClassD }

List<DropdownMenuItem<ClassType>> dropdownItems =
    ClassType.values.map((ClassType classType) {
  return DropdownMenuItem<ClassType>(
    value: classType,
    child: Text(classType.toString()),
  );
}).toList();

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                Flexible(
                  child: Container(
                    width: 196.w,
                    height: 40.h,
                    padding: const EdgeInsets.only(
                        top: 8, left: 16, right: 12, bottom: 8),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFE0E0E0)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 60.w,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Sort By',
                                  style: TextStyle(
                                    color: const Color(0xFF858693),
                                    fontSize: 16.sp,
                                    fontFamily: 'Proxima Nova',
                                    fontWeight: FontWeight.w400,
                                    height: 0.09,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Text(
                          'data',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
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
                ),
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 70,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Show',
                                style: TextStyle(
                                  color: Color(0xFF858693),
                                  fontSize: 16,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                                ),
                              ),
                              TextSpan(
                                text: ' ',
                                style: TextStyle(
                                  color: Color(0xFF001E00),
                                  fontSize: 16,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                                ),
                              ),
                              TextSpan(
                                text: '16',
                                style: TextStyle(
                                  color: Color(0xFF001E00),
                                  fontSize: 16,
                                  fontFamily: 'Proxima Nova',
                                  fontWeight: FontWeight.w700,
                                  height: 0.09,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 20,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [],
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
    );
  }
}

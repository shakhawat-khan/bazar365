import 'package:bazar365/components/bottom_navBar.dart';
import 'package:bazar365/modules/home_page/view/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(423.52, 945.88),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const GetMaterialApp(
          home: BottomNav(),
        );
      },
    );

    // GetMaterialApp(

    //   builder: (ctx, child) {
    //     ScreenUtil.init(ctx);
    //     return Theme(
    //       data: ThemeData(
    //         textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 30.sp)),
    //       ),
    //       child: const BottomNav(),
    //     );
    //   },
    //   debugShowCheckedModeBanner: false,
    // );
  }
}

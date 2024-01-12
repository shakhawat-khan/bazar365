import 'package:bazar365/components/bottom_navBar.dart';
import 'package:bazar365/modules/home_page/view/home_page_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

late Future<Database> db;

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  db = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'cart.db'),
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE cart(id INTEGER PRIMARY KEY, image TEXT, price TEXT,name TEXT,discount TEXT,quantity INTEGER)',
      );
    },
    version: 3,
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
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
          debugShowCheckedModeBanner: false,
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

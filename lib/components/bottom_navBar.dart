import 'package:bazar365/modules/cart_page/view/cart_page_view.dart';
import 'package:bazar365/modules/categories_page/categories_page.dart';
import 'package:bazar365/modules/home_page/controller/home_controller.dart';
import 'package:bazar365/modules/home_page/view/home_page_view.dart';
import 'package:bazar365/modules/menu_page/menu_page.dart';
import 'package:bazar365/modules/search_page/search_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// class BottomNav extends StatelessWidget {
//   const BottomNav({super.key});

//   @override
//   Widget build(BuildContext context) {
//     PersistentTabController controller;

//     controller = PersistentTabController(initialIndex: 0);
//     List<Widget> buildScreens() {
//       return [
//         const HomePage(),
//         const CategoriesPage(),
//         const CartPage(),
//         const SearchPage(),
//         const MenuPage(),
//       ];
//     }

//     List<PersistentBottomNavBarItem> navBarsItems() {
//       return [
//         PersistentBottomNavBarItem(
//           icon: const Icon(CupertinoIcons.home),
//           title: ("Home"),
//           activeColorPrimary: CupertinoColors.activeBlue,
//           inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(CupertinoIcons.settings),
//           title: ("Settings"),
//           activeColorPrimary: CupertinoColors.activeBlue,
//           inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: Stack(
//             children: [
//               Container(
//                 width: 15.0, // Adjust the size as needed
//                 height: 15.0,
//                 decoration: const BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white, // Change the color as needed
//                 ),
//                 // You can add child widgets here if needed
//               ),
//               const Positioned(
//                 top: 10,
//                 left: 0,
//                 child: Icon(
//                   CupertinoIcons.cart,
//                   color: Colors.white,
//                 ),
//               ),
//               // const Positioned(
//               //   bottom: 5,
//               //   right: 15,
//               //   child: SizedBox(
//               //     width: 27,
//               //     height: 9,
//               //     child: Text(
//               //       '৳ 220',
//               //       style: TextStyle(
//               //         color: Color(0xFFF3F3EF),
//               //         fontSize: 10,
//               //         fontFamily: 'Proxima Nova',
//               //         fontWeight: FontWeight.w600,
//               //         height: 0,
//               //         letterSpacing: -0.20,
//               //       ),
//               //     ),
//               //   ),
//               // )
//             ],
//           ),
//           title: ("Cart"),
//           activeColorPrimary: CupertinoColors.activeBlue,
//           inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(CupertinoIcons.search),
//           title: ("Search"),
//           activeColorPrimary: CupertinoColors.activeBlue,
//           inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//         PersistentBottomNavBarItem(
//           icon: const Icon(Icons.menu),
//           title: ("Menu"),
//           activeColorPrimary: CupertinoColors.activeBlue,
//           inactiveColorPrimary: CupertinoColors.systemGrey,
//         ),
//       ];
//     }

//     return PersistentTabView(
//       context,
//       controller: controller,
//       screens: buildScreens(),
//       items: navBarsItems(),
//       confineInSafeArea: true,
//       backgroundColor: Colors.white, // Default is Colors.white.
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset:
//           true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows:
//           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: const ItemAnimationProperties(
//         // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 200),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: const ScreenTransitionAnimation(
//         // Screen transition animation on change of selected tab.
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 200),
//       ),
//       navBarStyle:
//           NavBarStyle.style15, // Choose the nav bar style with this property.
//     );
//   }
// }

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final PageController _myPage = PageController(
    initialPage: 0,
  );
  int pageId = 0;

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          extendBody: true,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            shape: const CircleBorder(),
            onPressed: () {
              setState(() {
                _myPage.jumpToPage(2);
                pageId = 2;
              });
            },
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: 10,
                  child: Container(
                    width: 17.0, // Adjust the size as needed
                    height: 17.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // Change the color as needed
                    ),

                    child: Center(
                      child: Text(
                        homeController.cartCount.toString(),
                        style: const TextStyle(color: Colors.green),
                      ),
                    ),

                    // You can add child widgets here if needed
                  ),
                ),
                const Positioned(
                  top: 15,
                  left: 15,
                  child: Icon(
                    CupertinoIcons.cart,
                    color: Colors.white,
                  ),
                ),
                const Positioned(
                  bottom: 5,
                  right: 15,
                  child: SizedBox(
                    width: 27,
                    height: 9,
                    child: Text(
                      '৳ 220',
                      style: TextStyle(
                        color: Color(0xFFF3F3EF),
                        fontSize: 10,
                        fontFamily: 'Proxima Nova',
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: -0.20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          body: PageView(
            controller: _myPage,
            pageSnapping: false,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              CategoriesPage(),
              CartPage(),
              SearchPage(),
              MenuPage(),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 5,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _myPage.jumpToPage(0);
                      pageId = 0;
                    });
                  },
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset('assets/bottom_nav/home.svg',
                        colorFilter: pageId == 0
                            ? const ColorFilter.mode(
                                Colors.green, BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _myPage.jumpToPage(1);
                      pageId = 1;
                    });
                  },
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset('assets/bottom_nav/categories.svg',
                        colorFilter: pageId == 1
                            ? const ColorFilter.mode(
                                Colors.green, BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _myPage.jumpToPage(3);
                      pageId = 3;
                    });
                  },
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: SvgPicture.asset('assets/bottom_nav/search.svg',
                        colorFilter: pageId == 3
                            ? const ColorFilter.mode(
                                Colors.green, BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn)),
                  ),
                ),
                // IconButton(
                //   icon: ,
                //   onPressed: () {
                //     setState(() {
                //       _myPage.jumpToPage(4);
                //     });
                //   },
                // ),

                GestureDetector(
                    onTap: () {
                      setState(() {
                        _myPage.jumpToPage(4);
                        pageId = 4;
                      });
                    },
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        'assets/bottom_nav/menu.svg',
                        colorFilter: pageId == 4
                            ? const ColorFilter.mode(
                                Colors.green, BlendMode.srcIn)
                            : const ColorFilter.mode(
                                Colors.grey, BlendMode.srcIn),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}

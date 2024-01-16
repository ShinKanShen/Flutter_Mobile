import 'package:app_chungkhoan_thuctap/screens.dart';
import 'package:app_chungkhoan_thuctap/themdanhmuc/themdanhmucscreen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_chungkhoan_thuctap/chungkhoanmainscreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Chung Khoan Thuc Tap',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      home: const BottomNav(),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildScreens() {
      return  [
         const ChungKhoanScreen(),
         
         const ThiTruong2(),
         const ThiTruong3(),
         const ThiTruong4(),
         const ThemDanhMuc()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.home,
            size: 24,
          ),
          title: "Thị trường",
          activeColorPrimary: const Color.fromRGBO(40, 60, 145, 1),
          inactiveColorPrimary: const Color.fromRGBO(20, 0, 0, 0.7),
        ),
       PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.sell,
            size: 24,
          ),
          title: "Bảng Giá",
          activeColorPrimary: const Color.fromRGBO(40, 60, 145, 1),
          inactiveColorPrimary: const Color.fromRGBO(20, 0, 0, 0.7),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.tornado_rounded,
            size: 24,
          ),
          title: "Giao dịch",
          activeColorPrimary: const Color.fromRGBO(40, 60, 145, 1),
          inactiveColorPrimary: const Color.fromRGBO(20, 0, 0, 0.7),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(
          Icons.find_in_page_outlined,
          size: 24,
                    ),
          title: "Tìm Kiếm",
          activeColorPrimary: const Color.fromRGBO(40, 60, 145, 1),
          inactiveColorPrimary: const Color.fromRGBO(20, 0, 0, 0.7),
        ),
        PersistentBottomNavBarItem(

          icon: SvgPicture.asset('assets/icons/gia.svg',
          width: 50, height: 50,
          placeholderBuilder: (BuildContext context)=> Container(
            padding: const EdgeInsets.all(2),
          ),
          ),

          title: "Thông báo",

          activeColorPrimary: const Color.fromRGBO(40, 60, 145, 1),
          inactiveColorPrimary: const Color.fromRGBO(20, 0, 0, 0.7),
        ),
      ];
    }

    //
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}

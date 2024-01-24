import 'package:app_chungkhoan_thuctap/data/cophieus_data_model.dart';
import 'package:app_chungkhoan_thuctap/screens.dart';
import 'package:app_chungkhoan_thuctap/themdanhmuc/themdanhmucscreen.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_chungkhoan_thuctap/chungkhoanmainscreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
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

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

   final PersistentTabController _controller =  PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
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
      navBarHeight: 67,
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }

  _buildIconNotification(context, Color color) {
      return Stack(
        children: [
          SvgPicture.asset("assets/images/svg/menu-notification.svg",
              color: color),
          Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: const BoxConstraints(
                minWidth: 12,
                minHeight: 12,
              ),
              child:  Text(
                notificationData.length.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      );
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: SvgPicture.asset('assets/images/svg/Frame_1.svg'),
          title: ("Home"),
          activeColorPrimary:Colors.black ,
          inactiveColorPrimary: Colors.black ,
        ),

        getNavBarItem(
          iconSvgPath: "assets/images/svg/menu-priceboard.svg",
          title: "Bảng giá",
        ),
        getNavBarItem(
          iconSvgPath: "assets/images/svg/menu-transaction.svg",
          title: "Giao dịch",
          //onPressed: onPlaceOrderPressed
        ),
        getNavBarItem(
          iconSvgPath: "assets/images/svg/menu-search.svg",
          title: "Tìm kiếm",
          // onPressed: null,
        ),
        PersistentBottomNavBarItem(
          icon: _buildIconNotification(context, const Color(0xff2A5CAA)),
          inactiveIcon: _buildIconNotification(
              context, const Color(0xff000000).withOpacity(0.7)),
          title: "Thông báo",
          activeColorPrimary: const Color(0xff2A5CAA),
          inactiveColorPrimary: const Color(0xff000000).withOpacity(0.7),
        ),

      ];
    }



    List<Widget> _buildScreens() {
      return  [
        ChungKhoanScreen.create(),
         const ThiTruong2(),
         const ThiTruong3(),
         const ThiTruong4(),
         const ThemDanhMuc()
      ];
    }

    PersistentBottomNavBarItem getNavBarItem(
        {required String iconSvgPath, String? title, }) {
      return PersistentBottomNavBarItem(
        icon: SvgPicture.asset(iconSvgPath),

        title: title,
        activeColorPrimary: const Color(0xff2A5CAA),
        inactiveColorPrimary: const Color(0xff000000).withOpacity(0.7),

      );
    }


    //
  
}

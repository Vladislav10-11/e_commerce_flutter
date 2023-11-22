import 'package:e_commerce_flutter/screens/account_screen/account_screen.dart';
import 'package:e_commerce_flutter/screens/cart_screen/cart_screen.dart';
import 'package:e_commerce_flutter/screens/change_password/change_password.dart';
import 'package:e_commerce_flutter/screens/favorite_screen/favorite_screen.dart';
import 'package:e_commerce_flutter/screens/home/home.dart';
import 'package:e_commerce_flutter/screens/order/order_screen.dart';
import 'package:e_commerce_flutter/screens/welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CustomBottom extends StatefulWidget {
  const CustomBottom({
    Key? key,
  }) : super(key: key);

  @override
  _CustomBottomState createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom> {
  PersistentTabController _controller = PersistentTabController();
  bool _hideNavBar = false;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() => [
        Home(),
        CartScreen(),
        FavoriteScreen(),
        OrderScreen(),
        AccountScreen(),
      ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          inactiveIcon: Icon(Icons.home_outlined),
          icon: const Icon(Icons.home),
          title: "Home",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: Icon(Icons.shopping_cart_outlined),
          icon: const Icon(Icons.shopping_cart),
          title: "Cart",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: Icon(Icons.favorite_border),
          icon: const Icon(Icons.favorite),
          title: "Favorite",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: Icon(Icons.shop_2_outlined),
          icon: const Icon(Icons.shop_2),
          title: "Orders",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          inactiveIcon: Icon(Icons.person_outline),
          icon: const Icon(Icons.person),
          title: "Account",
          activeColorPrimary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
      ];

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(),
          resizeToAvoidBottomInset: true,
          navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
              ? 0.0
              : kBottomNavigationBarHeight,
          bottomScreenMargin: 0,
          backgroundColor: Theme.of(context).primaryColor,
          hideNavigationBar: _hideNavBar,
          decoration: const NavBarDecoration(colorBehindNavBar: Colors.indigo),
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
          ),
          navBarStyle:
              NavBarStyle.style1, // Choose the nav bar style with this property
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:shoping_app/features/home_view/presentations/views/home_view.dart';
import 'package:shoping_app/features/person_view/presentations/views/profile_view.dart';

import '../../../cart_view/presentations/views/cart_view.dart';
import '../../../favorite_view/presentation/views/faviorite_view.dart';
class NavigationBar extends StatefulWidget {
  const NavigationBar({super.key});
  @override
  State<NavigationBar> createState() => _NavigationBarState();
}
class _NavigationBarState extends State<NavigationBar> {
  int selectedIndex = 0 ;

  List<Widget> views = const [
    HomeView(),
    CartView(),
     FavoriteView(),
    ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_rounded),label: "cart"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label: "favourite"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "profile"),


          ],),
        backgroundColor: const Color(0xffD6DAD8),
        body: views.elementAt(selectedIndex)
    );
  }
}

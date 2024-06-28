import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getir_clone_app/product/extensions/build_context_extension.dart';
import 'package:getir_clone_app/view/home_page.dart';
import 'package:getir_clone_app/view/profile_page.dart';
import 'package:getir_clone_app/view/search_page.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});
  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {

  late String userId;

  @override
  void initState() {
    super.initState();
    _initializeUser();
  }

  Future<void> _initializeUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        userId = currentUser.uid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, 
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          padding: const EdgeInsets.all(0),
          notchMargin: 0,
          height: context.tabBarHeightValue,
          child: const TabBar(
            indicatorWeight: 4,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: _tabIcon(icons: Icons.home_rounded )),
              Tab(icon: _tabIcon(icons: Icons.search_outlined)),
              Tab(icon: _tabIcon(icons: Icons.shopping_basket_rounded)),
              Tab(icon: _tabIcon(icons: Icons.person_rounded))
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomePage(),
            SearchPage(),
            HomePage(),
            ProfilePage(userId: userId ,)
          ],
        )
      ));
  }
}

class _tabIcon extends StatelessWidget {
  const _tabIcon({
    super.key, required this.icons,
  });

  final IconData icons;
  final double _defaultIconSize = 35; 

  @override
  Widget build(BuildContext context) {
    return Icon(icons,size: _defaultIconSize,);
  }
}
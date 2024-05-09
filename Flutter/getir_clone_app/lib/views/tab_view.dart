import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:getir_clone_app/views/category%20detail_page.dart';
import 'package:getir_clone_app/views/home_page.dart';
import 'package:getir_clone_app/views/log_in_page.dart';
import 'package:getir_clone_app/views/sign_in_page.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.all(0),
          notchMargin: 0,
          height: 55,
          child: TabBar(
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
            LoginPage(),
            SigninPage(),
            CategoryDetailPage()
          ],),
      
      ),
    );
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
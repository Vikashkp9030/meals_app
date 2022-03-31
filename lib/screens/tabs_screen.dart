import 'package:flutter/material.dart';
import 'package:meals_app/screens/favorites_screen.dart';
import '../screens/categories_sceen.dart';
import '../widgets//main_drawer.dart';
class TabScreen extends StatefulWidget {

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String,Object>> _pages = [
    {
      'page':CategoriesScreen(),
      'title':'Category',
    },
    {
      'page':FavoriteScreen(),
      'title':'My Favorite',
    },
  ];
  int _selectPageIndex =0;

  void _selectPage(int index){
    setState(() {
      _selectPageIndex=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(_pages[_selectPageIndex]['title'].toString()),
          ),
          drawer:MainDrawer(),
          body: _pages[_selectPageIndex]['page'] as Widget,

          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectPageIndex,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.star),
                label: 'Favorites',

              ),
            ],
          ),
    );
  }
}

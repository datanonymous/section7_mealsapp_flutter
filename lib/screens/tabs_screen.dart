import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, Object>> _pages =
  [
    {'page':CategoriesScreen(), 'title':'Categories'},
    {'page':FavoritesScreen(), 'title':'Your favorites'},
  ];

  int _selectedPageIndex = 0;
  
  void _selectPage(int index){ //called with onTap: _selectPage,
    setState(() {
      _selectedPageIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index)=>{
          setState(() {
            _selectedPageIndex = index;
          }),
        },
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    );
  }
}

//FOR TOP TABS SCREEN
//class _TabsScreenState extends State<TabsScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return DefaultTabController(
//      length: 2,
//      child: Scaffold(
//        appBar: AppBar(
//          title: Text('Meals'),
//          bottom: TabBar(
//            tabs: <Widget>[
//              Tab(
//                icon: Icon(Icons.category), //https://api.flutter.dev/flutter/material/Icons-class.html
//                text: 'Categories',
//              ),
//              Tab(
//                icon: Icon(Icons.star), //https://api.flutter.dev/flutter/material/Icons-class.html
//                text: 'Favorites',
//              ),
//            ],
//          ),
//        ),
//        body: TabBarView(
//          children: <Widget>[
//            CategoriesScreen(),
//            FavoritesScreen(),
//          ],
//        ),
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  //BUILDER METHOD
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
//            color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1,0.4,0.7,0.9],
                colors: [
                  Color(0xFF440027),
                  Color(0xFF661141),
                  Color(0xFF882D61),
                  Color(0xFFAA5585),
                ],
              ),
              color: Theme.of(context).accentColor,
              border: Border.all(color: Colors.grey),
//              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Cooking up!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, (){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, (){
            Navigator.of(context).pushNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}

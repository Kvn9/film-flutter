import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Connexion'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text('Inscription'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/signup');
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Ajouter un loisir'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/add');
            },
          ),
        ],
      ),
    );
  }
}

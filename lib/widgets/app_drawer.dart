import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:metric/routes.dart';
import 'package:metric/services/auth_service.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  void logOutFn(BuildContext context) {
    authService.logOut().then(
        (value) => Navigator.of(context).pushNamed(RouteConfig.loginscreen));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(),
          Expanded(
            child: ListView(),
          ),
          ListTile(
            leading: Icon(
              EvaIcons.personOutline,
              color: Theme.of(context).primaryColor,
            ),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(
              Icons.checklist_rtl_rounded,
              color: Theme.of(context).primaryColor,
            ),
            title: Text('Todos'),
          ),
          ListTile(
            leading: Icon(
              EvaIcons.logOut,
              color: Theme.of(context).primaryColor,
            ),
            title: Text('Log Out'),
            onTap: () {
              logOutFn(context);
            },
          )
        ],
      ),
    );
  }
}

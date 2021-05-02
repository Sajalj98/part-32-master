import 'dart:async';

import 'package:farmers_market/src/blocs/auth_bloc.dart';
import 'package:farmers_market/src/screens/vendor.dart';
import 'package:farmers_market/src/styles/tabbar.dart';
import 'package:farmers_market/src/widgets/navbar.dart';
import 'package:farmers_market/src/widgets/orders.dart';
import 'package:farmers_market/src/widgets/products.dart';
import 'package:farmers_market/src/widgets/profile.dart';
import 'package:farmers_market/src/widgets/vendor_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class Vendor extends StatefulWidget {
  @override
  _VendorState createState() => _VendorState();

  static TabBar get vendorTabBar {
    return TabBar(
      unselectedLabelColor: TabBarStyles.unselectedLabelColor,
      labelColor: TabBarStyles.labelColor,
      indicatorColor: TabBarStyles.indicatorColor,
      tabs: <Widget>[
        Tab(icon: Icon(Icons.list)),
        Tab(icon: Icon(Icons.shopping_cart)),
        Tab(icon: Icon(Icons.person)),
      ],
    );
  }
}

class _VendorState extends State<Vendor> {
  StreamSubscription _userSubscription;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      var authBloc = Provider.of<AuthBloc>(context, listen: false);
      _userSubscription = authBloc.user.listen((user) {
        if (user == null)
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/login', (route) => false);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _userSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.green,
          title: Text('Agrispects'),
          bottom: Vendor.vendorTabBar
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              //header
              new UserAccountsDrawerHeader(
                accountName: Text('Lakshita Jain'),
                accountEmail: Text('lakshitajain1999@gmail.com'),
                currentAccountPicture: GestureDetector(
                  child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                decoration: new BoxDecoration(color: Colors.green),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Home Page'),
                  leading: Icon(Icons.home, color: Colors.green),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('My Profile'),
                  leading: Icon(Icons.person, color: Colors.green),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Customer Service'),
                  leading: Icon(Icons.phone, color: Colors.green),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings, color: Colors.green),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text('About Us'),
                  leading: Icon(Icons.help, color: Colors.green),
                ),
              ),
            ],
          ),
        ),                  
          body: TabBarView(
                    children: <Widget>[
                      Products(),
                      Orders(),
                      Profile(),
                    ],
                  )));
  }
}

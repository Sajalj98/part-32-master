import 'dart:async';

import 'package:farmers_market/src/blocs/auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:farmers_market/components/horizontal_listview.dart';
import 'package:farmers_market/components/products.dart';
import 'package:provider/provider.dart';

import '../app.dart';

class CustomerScreen extends StatefulWidget {
  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
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
    var authBloc = Provider.of<AuthBloc>(context);
    Widget imageCarousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('assets/images/farm5.jpg'),
          AssetImage('assets/images/farm6.jpg'),
          AssetImage('assets/images/farm2.jpg'),
          AssetImage('assets/images/farm1.jpg'),
          AssetImage('assets/images/farm3.jpg'),
          AssetImage('assets/images/farm7.jpg'),
        ],
        autoplay: false,
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        animationCurve: Curves.elasticIn,
        animationDuration: Duration(milliseconds: 800),
      ),
    );
    return Scaffold(
      
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: Text('Agrispects'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () async {},
          ),
          new IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {}),
          new IconButton(
              icon: Icon(Icons.article_sharp, color: Colors.white),
              onPressed: () {}),
        ],
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
                title: Text('My Orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.green,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Wishlist'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.green,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Customer Service'),
                leading: Icon(Icons.phone, color: Colors.green),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Categories'),
                leading: Icon(Icons.dashboard, color: Colors.green),
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
            InkWell(
              onTap: () => authBloc.logout(),
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout, color: Colors.green),
              ),
            )
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          // carousel
          imageCarousel,
          //padding
          new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                'Categories',
                style: TextStyle(
                    color: Colors.green.withOpacity(1.0),
                    fontWeight: FontWeight.bold),
              )),

          //horizontal list view
          HorizontalList(),
          new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Text(
                'Recent Products',
                style: TextStyle(
                    color: Colors.green.withOpacity(1.0),
                    fontWeight: FontWeight.bold),
              )),
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),
    );
  }
}

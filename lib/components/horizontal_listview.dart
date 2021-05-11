import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'assets/images/wheat2.jpg',
            imageCaption: 'Wheat',
          ),
          Category(
            imageLocation: 'assets/images/rice2.jpg',
            imageCaption: 'Rice',
          ),
          Category(
            imageLocation: 'assets/images/corn2.jpg',
            imageCaption: 'Maize',
          ),
          Category(
            imageLocation: 'assets/images/jowar2.jpg',
            imageCaption: 'Jowar',
          ),
          Category(
            imageLocation: 'assets/images/bajra2.jpg',
            imageCaption: 'Bajra',
          ),
          Category(
            imageLocation: 'assets/images/oats.jpg',
            imageCaption: 'Oats',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  Category({this.imageLocation, this.imageCaption});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
          onTap: () {},
          child: Container(
            width: 100.0,
            child: ListTile(
              title: Image.asset(
                imageLocation,
                width: 110.0,
                height: 80.0,
              ),
              subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    imageCaption,
                  )),
            ),
          )),
    );
  }
}

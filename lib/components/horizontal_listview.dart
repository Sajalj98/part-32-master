import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'assets/images/wheat2.jpg',
            image_caption: 'Wheat',
          ),
          Category(
            image_location: 'assets/images/rice2.jpg',
            image_caption: 'Rice',
          ),
          Category(
            image_location: 'assets/images/corn2.jpg',
            image_caption: 'Maize',
          ),
          Category(
            image_location: 'assets/images/jowar2.jpg',
            image_caption: 'Jowar',
          ),
          Category(
            image_location: 'assets/images/bajra2.jpg',
            image_caption: 'Bajra',
          ),
          Category(
            image_location: 'assets/images/oats.jpg',
            image_caption: 'Oats',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  Category({this.image_location, this.image_caption});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
          onTap: () {},
          child: Container(
            width: 100.0,
            child: ListTile(
              title: Image.asset(
                image_location,
                width: 110.0,
                height: 80.0,
              ),
              subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    image_caption,
                  )),
            ),
          )),
    );
  }
}

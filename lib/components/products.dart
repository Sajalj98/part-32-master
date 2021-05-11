import 'package:flutter/material.dart';
import 'package:farmers_market/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Products> {
  var productList = [
    {
      "name": "Wheat",
      "picture": "assets/images/products/wheat.jpg",
      "old_price": 40,
      "new_price": 50,
    },
    {
      "name": "Rice",
      "picture": "assets/images/products/rice1.jpg",
      "old_price": 30,
      "new_price": 35,
    },
    {
      "name": "Maize",
      "picture": "assets/images/products/maize.jpg",
      "old_price": 30,
      "new_price": 35,
    },
    {
      "name": "Jowar",
      "picture": "assets/images/products/barley_green.jpg",
      "old_price": 50,
      "new_price": 55,
    },
    {
      "name": "Rice",
      "picture": "assets/images/products/rice1.jpg",
      "old_price": 30,
      "new_price": 35,
    },
    {
      "name": "Maize",
      "picture": "assets/images/products/maize.jpg",
      "old_price": 30,
      "new_price": 35,
    },
    {
      "name": "Jowar",
      "picture": "assets/images/products/barley_green.jpg",
      "old_price": 50,
      "new_price": 55,
    },
    {
      "name": "Rice",
      "picture": "assets/images/products/rice1.jpg",
      "old_price": 30,
      "new_price": 35,
    },
    {
      "name": "Maize",
      "picture": "assets/images/products/maize.jpg",
      "old_price": 30,
      "new_price": 35,
    },
    {
      "name": "Jowar",
      "picture": "assets/images/products/barley_green.jpg",
      "old_price": 50,
      "new_price": 55,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Singleprod(
              prodName: productList[index]['name'],
              prodPicture: productList[index]['picture'],
              prodOldprice: productList[index]['old_price'],
              prodPrice: productList[index]['new_price'],
            ),
          );
        });
  }
}

class Singleprod extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodOldprice;
  final prodPrice;
  Singleprod(
      {this.prodName, this.prodPicture, this.prodOldprice, this.prodPrice});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prodName,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  //passing product details to the new page
                  builder: (context) => new ProductDetails(
                        productDetailname: prodName,
                        productDetailpic: prodPicture,
                        productDetailnewprice: prodOldprice,
                        productDetailoldprice: prodPrice,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prodName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        '\u{20B9}$prodPrice',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\u{20B9}$prodOldprice",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prodPicture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}

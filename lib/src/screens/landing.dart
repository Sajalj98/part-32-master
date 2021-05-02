import 'package:farmers_market/src/screens/customer.dart';
import 'package:farmers_market/src/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:farmers_market/src/screens/customermain.dart';
import 'dart:io';
import 'package:farmers_market/src/screens/customermain.dart';

class Landing extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS){
      return CupertinoPageScaffold(  
        child: pageBody(context),
      );
    } else {
      return Scaffold(body:pageBody(context));
    }
  }

  Widget pageBody(BuildContext context){
    return Column(  
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      
        AppButton(  
          buttonText: 'Vendor Page',
          buttonType: ButtonType.Straw,
          
          onPressed: () => Navigator.pushNamed(context, '/vendor'),
        ),
        AppButton(  
          buttonText: 'Customer Page',
          buttonType: ButtonType.Straw,
          onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                  //passing product details to the new page
                  builder: (context) => new CustomerScreen(
                        
                      ))),
          //onPressed: () => Navigator.pushNamed(context, '/customer'),
        ),
        
          ]
    );
  }
}
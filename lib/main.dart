import 'package:flutter/material.dart';
import 'package:geeky_booky/Counters/cartItemCounter.dart';
import 'package:provider/provider.dart';
import 'Counters/changeAddress.dart';
import 'Counters/itemQuantity.dart';
import 'Counters/totalMoney.dart';
import 'Screen/splashscreen.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (c) => CartItemCounter(),),
        ChangeNotifierProvider(create: (c) => ItemQuantity(),),
        ChangeNotifierProvider(create: (c) => AddressChanger(),),
        ChangeNotifierProvider(create: (c) => TotalAmount(),),
      ],
        child: MaterialApp(
          title: "Books Lab",
          theme: ThemeData(
            primaryColor: Colors.blueGrey[500],
            cursorColor: Colors.grey[600],
          ),
          home: SplashScreen(),
        ),
    );
  }
}

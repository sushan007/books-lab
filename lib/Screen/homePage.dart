import 'package:flutter/material.dart';
import 'package:geeky_booky/Counters/cartItemCounter.dart';
import 'package:geeky_booky/Widget/imageCarousel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Authentication/login.dart';
import '../CartPage.dart';
import '../searchBox.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  SharedPreferences loginData;
  String userName;

  @override
  void initState(){
    super.initState();
    initial();
  }

  void initial() async{
    loginData = await SharedPreferences.getInstance();
    setState(() {
      userName = loginData.getString('userName');
    });
  }

  @override
  Widget build(BuildContext context) {

    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Labs",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Colors.green,
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CartPage()));
                },
              ),
              Positioned(
                child: Stack(
                  children: [
                    Icon(Icons.brightness_1, size: 20, color: Colors.white,),
                    Positioned(
                      top: 3.0,
                      bottom: 4.0,
                      left:4.0,
                      child: Consumer<CartItemCounter>(
                        builder: (context, counter, child){
                          return Text(
                            counter.count.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),

                          );
                        },
                      ),
                    )

                  ],
                ),
              )
            ],
          )
        ]
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: _screenHeight * 0.3,
              width: _screenWidth,
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  //TODO: Image, name and email id from database
                  CircleAvatar(
                    radius: _screenWidth * 0.15,
                  ),
                  Text("$userName"),
                  Text('sushan315@gmail.com'),
                ],
              ),
            ),

            ListTile(
                title: Text("Home"),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                leading: Icon(Icons.home_sharp),
            ),
            Divider(height: 10, color: Colors.grey, thickness: 0.4,),
            ListTile(
              title: Text("Profile"),
              onTap: (){},
              leading: Icon(Icons.person),
            ),
            Divider(height: 10, color: Colors.grey, thickness: 0.4,),
            ListTile(
                title: Text("Categories"),
                onTap: (){},
                leading: Icon(Icons.dashboard),
            ),
            Divider(height: 10, color: Colors.grey, thickness: 0.4,),
            ListTile(
              title: Text("My Orders"),
              onTap: (){},
              leading: Icon(Icons.shopping_basket),
            ),
            Divider(height: 10, color: Colors.grey, thickness: 0.4,),
            ListTile(
              title: Text("My Cart"),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => CartPage()));
              },
              leading: Icon(Icons.shopping_basket),
            ),
            Divider(height: 10, color: Colors.grey, thickness: 0.4,),
            ListTile(
                title: Text("LogOut"),
                onTap: (){
                  loginData.setBool('login', true);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(
                          builder: (context) =>  LoginPage()
                      )
                  );
                },
                leading: Icon(Icons.logout),
            ),
            Divider(height: 10, color: Colors.grey, thickness: 0.4,),
            ListTile(
              title: Text("About"),
              onTap: (){},
              leading: Icon(Icons.help, color: Colors.green[700],),
            ),
            Divider(height: 10, color: Colors.grey, thickness: 0.4,),
          ],
        ),
      ),
      // body: CustomScrollView(
      //   slivers: [
      //     SliverPersistentHeader(
      //       pinned: true,
      //       delegate: SearchBoxDelegate(),
      //     ),
      //   ]
      // )
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: [
              //image carousel
              ImageCarousel(),


              //Categories
              Text(
                "Categories"
              ),
              //horizontal List view for categories


            ],
          ),
        ),
      ),
    );
  }
}


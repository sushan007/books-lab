import 'package:flutter/material.dart';
import 'package:geeky_booky/DialogBox/errorDialog.dart';
import 'package:geeky_booky/admin/adminLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Screen/homePage.dart';
import '../Authentication/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SharedPreferences loginData;
  bool newUser;

  bool loggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIfAlreadyLogin();
  }

  void checkIfAlreadyLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = (loginData.getBool("login") ?? true);

    print(newUser);
    if (newUser == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  //Info of user to send user directly to homepage without going through log in if he is already logged in
  void storeLoginInfoOfUser(){

    String userName = _userNameController.text;
    String password = _passwordController.text;

    if (userName != '' && password != '') {
      print("Successful");
      loginData.setBool(('login'), false);
      loginData.setString('userName', userName);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  showAlertDialog(BuildContext context) {
    Widget yesButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AdminLogin(),
            ));
      },
    );
    Widget noButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Do you want to login ? "),
      actions: [
        yesButton,
        noButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.blueGrey[700],
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Books Lab",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "    Email Id",
                                style: TextStyle(
                                  color: Colors.blueGrey[200],
                                  fontSize: 15
                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              controller: _userNameController,
                              obscureText: false,
                              // autofocus: true,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              maxLength: 24,

                              decoration: InputDecoration(
                                hintText: "Please enter your name",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                ),

                                fillColor: Colors.grey[500],
                                filled: true,

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return("UserName / Id cannot be empty");
                                }
                                return null;
                              },


                            ),
                            SizedBox(height: 16,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "    Password ",
                                style: TextStyle(
                                    color: Colors.blueGrey[200],
                                    fontSize: 15
                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              // autofocus: true,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Please enter your password",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                ),

                                fillColor: Colors.grey[500],
                                filled: true,

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: (value){
                                if(value.isEmpty){
                                  return "Password cannot be empty";
                                }
                                if(value.length < 6){
                                  return "Password must contain at least 8 characters";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 40,),
                            RaisedButton(
                              splashColor: Colors.deepOrange,
                              highlightColor: Colors.green,

                              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 16),
                              color: Colors.cyan[700],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              onPressed: () {
                                //TODO: If user id is already registered in database through signup form, then login.

                                // if id and pw is correct then check validation
                                if(_formKey.currentState.validate()){
                                  storeLoginInfoOfUser();
                                }
                                else
                                  {
                                    showDialog(
                                      context: context,
                                      builder: (c)
                                        {
                                          return ErrorAlertDialog(
                                            message: "Please enter email and password",
                                          );
                                        }
                                    );
                                  }

                              },
                              child: Text(
                                  "Login",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16
                                ),
                              ),
                            ),
                            SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account ?",
                                  style: TextStyle(
                                    color: Colors.blueGrey[200],
                                    fontSize: 16,
                                  ),),
                                SizedBox(width: 20,),
                                FlatButton(
                                  highlightColor: Colors.blueGrey[500],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                          return SignUpPage();
                                        }));
                                  },
                                  child: Text(
                                      "Sign Up",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.orange[800],
                                    ),),
                                )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("I am Admin ",
                                  style: TextStyle(
                                    color: Colors.blueGrey[200],
                                    fontSize: 16,
                                  ),),
                                SizedBox(width: 10,),
                                FlatButton(
                                  highlightColor: Colors.blueGrey[500],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    showAlertDialog(context);
                                  },
                                  child: Text(
                                      "Admin Login",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.orange[800],
                                    ),
                                  ),
                                )
                              ],
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }

}

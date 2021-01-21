import 'package:flutter/material.dart';
import 'package:geeky_booky/Authentication/login.dart';
import 'package:geeky_booky/DialogBox/errorDialog.dart';
import 'package:geeky_booky/DialogBox/loadingDialog.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController controller = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _userInfo = "";

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body:  Container(
        width: _screenWidth,
        height: _screenHeight,
        color: Colors.blueGrey[700],
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "Create an account. It's",
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 22,
                                  )),
                              TextSpan(
                                  text: " FREE ",
                                  style: TextStyle(
                                    color: Colors.red[900],
                                    fontSize: 30,
                                  )),
                              TextSpan(
                                  text: ".",
                                  style: TextStyle(
                                    color: Colors.red[900],
                                    fontSize: 80,
                                  ))
                            ]),
                          )),
                      SizedBox(height:30),

                      Form(
                        key: _formKey,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "    Username/Id ",
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
                              decoration: InputDecoration(
                                hintText: "Please enter your Username",
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
                                  return("UserName cannot be empty");
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "    Email ",
                                style: TextStyle(
                                    color: Colors.blueGrey[200],
                                    fontSize: 15
                                ),
                              ),
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              controller: _emailController,
                              obscureText: true,
                              // autofocus: true,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Please enter your Email Id",
                                hintStyle: TextStyle(
                                  fontSize: 14,
                                ),

                                fillColor: Colors.grey[500],
                                filled: true,

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              validator: (String value){
                                if(value.isEmpty){
                                  return "Please enter your email id";
                                }
                                if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
                                {
                                  return "Invalid Email";
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
                            SizedBox(height: 16,),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "    Confirm  Password ",
                                style: TextStyle(
                                    color: Colors.blueGrey[200],
                                    fontSize: 15
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              // autofocus: true,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Please Re-enter your password",
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
                                if(_passwordController.text != _confirmPasswordController.text){
                                  return "Password do not match";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 36,),
                            Builder(
                                builder: (context) =>  RaisedButton(
                                  splashColor: Colors.deepOrange,
                                  highlightColor: Colors.green,

                                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 16),
                                  color: Colors.cyan[700],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  onPressed: (){
                                    if(_formKey.currentState.validate()){
                                      uploadToStorage();
                                    }
                                    else{
                                      displayDialog("Please fill up the complete form");
                                    }
                                  },
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16
                                    ),
                                  ),
                                ),),

                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account ?",
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
                                    return LoginPage();
                                  }));
                            },
                            child: Text(
                              "LogIn",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange[800],
                              ),),
                          )
                        ],
                      ),
                    ]),

                ),
            ),
            ),
        ),
      ),
    );
  }

  uploadToStorage() {
    //TODO: If all info are validated in a signup form, then upload it to database
    return LoadingAlertDialog(
      message: "Authenticating, Please wait....",
    );
    //Giving it unique name to upload to storage
    //Using dateTime.now
    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();

    //After all this Create reference to our storage
  }





  displayDialog(String msg){
    showDialog(
      context: context,
      builder: (c)
        {
          return ErrorAlertDialog(message: msg);
        }
    );
  }

}

import 'package:flutter/material.dart';
import 'package:geeky_booky/Authentication/login.dart';
import 'package:geeky_booky/Widget/customTextFormField.dart';
import 'package:geeky_booky/admin/adminSignUp.dart';
import 'package:geeky_booky/admin/uploadItems.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Login"),
      ),
      body: AdminSignIn(),
    );
  }
}
class AdminSignIn extends StatelessWidget {

  final _adminIdController = TextEditingController();
  final _adminPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  showAlertDialog(BuildContext context) {
    Widget yesButton = FlatButton(
      child: Text("Yes"),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ));
        // Navigator.of(context).pop();
      },
    );
    Widget noButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget okButton = FlatButton(
      child: Text("Ok"),
      onPressed: (){
        Navigator.pop(context);
      }
    );

    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text("Are you a normal user ? "),
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

    AlertDialog errorAlert = AlertDialog(
      title: Text("Error Alert"),
      content: Text("Id and pw empty ? "),
      actions: [
        okButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return errorAlert;
        });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text("Space for image of admin",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("To Be an admin ?",
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

                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> AdminSignUpPage()));

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
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                controller: _adminIdController,
                                obscureText: false,
                                // autofocus: true,
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent[700],
                                ),
                                maxLength: 24,

                                decoration: InputDecoration(
                                  hintText: "Admin Id",
                                  fillColor: Colors.grey,
                                  filled: true,

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),


                              ),
                              TextFormField(
                                controller: _adminPasswordController,
                                obscureText: true,
                                // autofocus: true,
                                style: TextStyle(
                                  color: Colors.deepPurpleAccent[700],
                                ),
                                maxLength: 24,

                                decoration: InputDecoration(
                                  hintText: "Password",
                                  fillColor: Colors.grey,
                                  filled: true,

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),


                              ),
                              RaisedButton(
                                splashColor: Colors.deepOrange,
                                highlightColor: Colors.green,

                                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 16),
                                color: Colors.cyan[700],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                onPressed: () {
                                  _adminIdController.text.isNotEmpty
                                      && _adminPasswordController.text.isNotEmpty
                                      ? loginAdmin()
                                      : showAlertDialog(context);
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("I am not admin"),
                                  FlatButton(
                                    onPressed: (){
                                      showAlertDialog(context);
                                    },
                                    child: Icon(Icons.nature_people,
                                      color: Colors.pink,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Go to admin addCartItemScreen"),
                                  FlatButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => UploadItemsPage()));
                                    },
                                    child: Icon(Icons.nature_people,
                                      color: Colors.pink,
                                    ),
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ),

                  ],

                ),
              ),
            ),
          ),
        ),
    );
  }

  loginAdmin(){
    // TODO: If admin Id and pw verified, then login
  }


}

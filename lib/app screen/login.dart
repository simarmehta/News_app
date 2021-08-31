import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app%20screen/signup.dart';

import 'homescreen.dart';


class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool signInState=false;
  String email="",password="";
  String? _error;
  var _formKey=GlobalKey<FormState>();

  FirebaseAuth auth=FirebaseAuth.instance;

  Future<void> logIn() async {
    try {
      await auth.signInWithEmailAndPassword
        (email: email.trim(), password: password).then((value) {
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) => HomeScreen()));
      });
    } on FirebaseAuthException catch (error) {
      print("error");
    }
  }





  @override
  Widget build(BuildContext context) {



    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          autovalidate: true,
          child: ListView(
            children: [
              showAlert(),
              Container(
                width: double.infinity,
                height: 180,
                color: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50,),
                      Text("Log in",
                        style:TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35
                        ),
                      ),
                      Text("WELCOME TO THE APP",
                        style:TextStyle(
                          color: Colors.white,
                        ),
                      )],
                  ),

                ),

                // color: Color(0xffff2fc3)
              ),
              Theme(
                data: ThemeData(
                    hintColor: Colors.black
                ),
                child:Padding(padding: EdgeInsets.only(top:50,right: 20,left: 20 ),
                  child: TextFormField(
                    validator:
                        (value){
                      if (value!.isEmpty) {
                        return "Please Enter an email";
                      }
                      else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value))
                      {
                        return"invalid email";
                      }

                      else {
                        email = value;
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.blueAccent),
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color:Colors.blueAccent,width: 1)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blueAccent,width: 1)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blueAccent,width: 1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blueAccent,width: 1)
                      ),
                    ),
                  ) ,

                ),
              ),
              Theme(
                data: ThemeData(
                    hintColor: Colors.black
                ),
                child:Padding(padding: EdgeInsets.only(top:50,right: 20,left: 20 ),
                  child: TextFormField(
                    obscureText: true,
                    autocorrect: false,
                    onChanged: (text){
                      password=text;
                    },

                    validator: (value){
                      if(value!.isEmpty){
                        return"Please Enter your password";
                      }
                      else if(value.length<6){
                        return "Password is too short";

                      }
                      else {
                        password=value;
                      }

                      return null;
                    },
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blueAccent,width: 1)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blueAccent,width: 1)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blueAccent,width: 1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blueAccent,width: 1)
                      ),
                    ),
                  ) ,

                ),
              ),
              Padding(padding: EdgeInsets.only(right: 20),
                child: Container(
                  width: double.infinity,
                  ),),
              SizedBox(height: 20,),
              Padding(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child:RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()) {
                        logIn();

                      }
                    },


                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),

                    ),
                    color:Colors.blueAccent ,
                    child:Text("Log In",
                      style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 25
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                  )
              ),
              SizedBox(height: 40,),
              Center(
                child: Column(
                  children: [
                    Text("Don't have an account ?",style: TextStyle(
                        fontSize: 17,
                        color: Colors.black
                    ),),
                    SizedBox(height: 5,),
                    FlatButton(onPressed: (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (BuildContext context)=> SignUp())
                      );
                    },
                      child: Text("Sign up",style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent
                      ),
                      ),
                    ),
                    SizedBox(height:10),


                  ],
                ),
              )
            ],
          ),

        )
    );
  }
  Widget showAlert(){
    if(_error != null){
      return Container(
        color: Colors.blueAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(padding: const EdgeInsets.only(right:8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: Text(_error!,maxLines: 3,),
            ),
            IconButton(onPressed: (){
              setState(() {
                _error= null;
              });
            }, icon:Icon(Icons.close),
            )
          ],
        ),
      );

    }
    return SizedBox(height: 0,);
  }

}
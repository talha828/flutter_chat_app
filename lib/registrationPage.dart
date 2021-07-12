import 'package:chat_app_flutter/const.dart';
import'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chatPage.dart';


class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _auth= FirebaseAuth.instance;
  String email;

  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Center(child: Text("Sign up")),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Hero(
                tag: "logo",
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    "assets/messenger.png",
                    fit: BoxFit.cover,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                onChanged: (value){
                  email=value;
                },
                decoration: inputDecuration3,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(onChanged:(value){
                password=value;
              },
                decoration: inputDecuration4,
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector( onTap: () async {

               final user= await _auth.createUserWithEmailAndPassword(email: email, password: password);
                if(user!=null){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                }
              },
                child: Container(alignment: Alignment.center,
                  height: 40,
                  decoration: BoxDecoration(
                      color:Colors.blue,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text("sign up",style:signupText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chat_app_flutter/loginpage.dart';
import 'package:chat_app_flutter/registrationPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'const.dart';
import 'welcomeButtons.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Container(
                child: TextLiquidFill(
                  text: "Welcome to ChatApp",
                  waveColor: Colors.white,
                  boxBackgroundColor: Colors.blue,
                  textStyle: KwelcomeMainText,
                ),
              ),
                Text(
                  "Here you easily find the per perfect partner ",
                  style: KdisText,
                ),
            Hero(
              tag: "logo",
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(
                  "assets/messenger.png",
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Buttons(text: "Login ",onTap:  () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage()));
                }),
                Buttons(text: "Sign up",onTap:  () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationPage()));
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}


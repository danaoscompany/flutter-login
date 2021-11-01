import 'package:flutter/material.dart';
import 'package:login/global.dart';
import 'package:login/login.dart';

void main() {
  runApp(Intro(null, null));
}

class Intro extends StatefulWidget {
  final context, string;
  Intro(this.context, this.string);

  @override
  State<Intro> createState() => IntroState();
}

class IntroState extends State<Intro> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.asset("assets/images/login_intro.png", width: width, height: height, fit: BoxFit.contain)
            ),
            SizedBox(height: 20),
            Padding(
                padding: EdgeInsets.only(left: 32, right: 32),
                child: Text(widget.string.text2, style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.left)
            ),
            SizedBox(height: 10),
            Padding(
                padding: EdgeInsets.only(left: 32, right: 32),
                child: Text(widget.string.text1, style: TextStyle(color: Colors.black, fontSize: 15), textAlign: TextAlign.left)
            ),
            SizedBox(height: 20),
            Container(width: 200, height: 45, margin: EdgeInsets.only(left: 32, right: 32),
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30)),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Global.replaceScreen(context, Login(context, widget.string));
                },
                child: Center(
                  child: Text(widget.string.login, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold))
                )
              )),
              SizedBox(height: 20)
          ]
        )
      )
    );
  }
}

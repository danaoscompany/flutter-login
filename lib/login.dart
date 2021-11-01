import 'package:flutter/material.dart';
import 'package:login/global.dart';
import 'package:login/home.dart';
import 'package:ionicons/ionicons.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(Login(null, null));
}

class Login extends StatefulWidget {
  final context, string;
  Login(this.context, this.string);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
    var emailController = TextEditingController(text: "");
    var passwordController = TextEditingController(text: "");

    void login(context) async {
        var email = emailController.text.trim();
        var password = passwordController.text;
        if (email == "" || password.trim() == "") {
            Global.show(widget.string.text5);
            return;
        }
        var fd = await Global.showProgressDialog(context, widget.string.text7);
        Global.httpPost(context, Uri.parse(Global.API_URL+"/user/login"), body: <String, String>{
          "email": email,
          "password": password
        }, onSuccess(response) {
          var obj = jsonDecode(response);
          var responseCode = int.parse(obj['response_code'].toString());
          if (responseCode == 1) {
            Global.replaceScreen(context, Home(context, string));
          } else if (responseCode == -1) {
            Global.show(widget.string.text8);
          } else if (responseCode == -2) {
            Global.show(widget.string.text9);
          }
        });
    }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.string.text3, style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold))
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.string.text4, style: TextStyle(color: Color(0xffb9b8be), fontSize: 15))
                      ),
                      SizedBox(height: 50),
                      Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              elevation: 3,
                              clipBehavior: Clip.antiAlias,
                              shadowColor: Color(0x66888888),
                              margin: EdgeInsets.zero,
                              child: Container(height: 45, padding: EdgeInsets.only(left: 10, right: 10), child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Ionicons.person_outline, color: Color(0xffc3c3c7), size: 20),
                          SizedBox(width: 5),
                          Flexible(
                              child: TextField(decoration: new InputDecoration(counterText: "", border: InputBorder.none, focusedBorder: InputBorder.none, enabledBorder: InputBorder.none, errorBorder: InputBorder.none, disabledBorder: InputBorder.none, hintStyle: TextStyle(color: Color(0xFF9CA4AC), fontSize: 14), hintText: widget.string.email, contentPadding: EdgeInsets.only(left: 15, right: 15, bottom: 15)), textAlignVertical: TextAlignVertical.center, controller: emailController, keyboardType: TextInputType.number, maxLength: 2, style: TextStyle(fontSize: 14))
                          )
                        ]
                      ))
                      ),
                    SizedBox(height: 30),
                    Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              ),
                              elevation: 3,
                              clipBehavior: Clip.antiAlias,
                              shadowColor: Color(0x66888888),
                              margin: EdgeInsets.zero,
                              child: Container(height: 45, padding: EdgeInsets.only(left: 10, right: 10), child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Icon(Ionicons.lock_closed_outline, color: Color(0xffc3c3c7), size: 20),
                          SizedBox(width: 5),
                          Flexible(
                              child: TextField(decoration: new InputDecoration(counterText: "", border: InputBorder.none, focusedBorder: InputBorder.none, enabledBorder: InputBorder.none, errorBorder: InputBorder.none, disabledBorder: InputBorder.none, hintStyle: TextStyle(color: Color(0xFF9CA4AC), fontSize: 14), hintText: widget.string.password, contentPadding: EdgeInsets.only(left: 15, right: 15, bottom: 15)), textAlignVertical: TextAlignVertical.center, controller: passwordController, keyboardType: TextInputType.number, maxLength: 2, style: TextStyle(fontSize: 14))
                          )
                      ]
                    ))
                      ),
                    SizedBox(height: 60),
                    Container(width: width-32-32, height: 45, decoration: BoxDecoration(
                        color: Color(0xff0202fb), borderRadius: BorderRadius.circular(30)
                    ), child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {

                        },
                        child: Center(
                            child: Text(widget.string.login, style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
                        )
                    ))
              ]
              )
            )
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'global.dart';

void main() {
  runApp(Home(null, null));
}

class Home extends StatefulWidget {
  final context, string;
  Home(this.context, this.string);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with WidgetsBindingObserver {
  var items = [];

  @override
  void initState() async {
    Global.httpGet(widget.string, Uri.parse(Global.API_URL+"/user/get_items"),
      onSuccess(response) {
        setState(() {
          items = jsonDecode(response);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(right: 32),
              decoration: BoxDecoration(
                color: Color(0xffffefce),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(items[index]['name'].toString(), style: TextStyle(color: Color(0xff010020), fontSize: 20, fontWeight: FontWeight.bold)),
                      Container(width: 80, height: 2, decoration: BoxDecoration(color: Color(0xffe3b13e), borderRadius.circular(1))),
                      Text(items[index]['items'].toString()+" "+items[index]['unit'].toString(), style: TextStyle(color: Color(0xff010020), fontSize: 20, fontWeight: FontWeight.bold)),
                    ]
                  ),
                  SizedBox(width: 20),
                  Image.network(items[index]['img'].toString(), width: 80, height: 120)
                ]
              )
            )
          );
        }
      )
    )));
  }
}

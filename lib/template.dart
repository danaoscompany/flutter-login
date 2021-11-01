import 'package:flutter/material.dart';

import 'global.dart';

void main() {
  runApp(Template(null, null));
}

class Template extends StatefulWidget {
  final context, string;
  Template(this.context, this.string);

  @override
  TemplateState createState() => TemplateState();
}

class TemplateState extends State<Template> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    Global.setAppStateListener(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container()));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_main/views/2_page/user_page.dart';

class MainRootPage extends StatelessWidget {
  const MainRootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const UserPage(title: 'Flutter Demo Home Page'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:imc_improved/pages/input_page.dart';
import 'package:imc_improved/utils/utils.dart';

void main() => runApp(IMC());

class IMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appThemeData(),
      title: 'IMC 2.0',
      home: InputPage(),
    );
  }
}

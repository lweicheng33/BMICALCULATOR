import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);//constructor???

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR!!',
      home: StatefulWidgetPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StatefulWidgetPage extends StatefulWidget {
  const StatefulWidgetPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _StatefulWidgetPageState();
  }
}

class _StatefulWidgetPageState extends State<StatefulWidgetPage>{
  late TextEditingController height, weight;
  double _res = 0;
  String _s = "";

  @override
  void initState() {
    super.initState();
    height = TextEditingController();
    weight = TextEditingController();
  }

  @override
  void dispose() {
    height.dispose();
    weight.dispose();
    super.dispose();
  }

  void _cal() {
    setState(() {
      double res = (double.parse(weight.text) / (double.parse(height.text) * (double.parse(height.text))));
      if(res.isInfinite || res.isNaN || res.isNegative)
        _s = "Your input might be wrong!! Please re-enter!!";
      else
        _s = 'Your BMI is : ' + res.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: height,
            obscureText: false,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Please input your height in meter',
              labelText: 'Height:',
              labelStyle: TextStyle(),
              hintStyle: TextStyle(),
            ),
          ),
          TextField(
            controller: weight,
            obscureText: false,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Please input your weight in kilogram',
              labelText: 'Weight:',
              labelStyle: TextStyle(),
              hintStyle: TextStyle(),
            ),
          ),
          Text(
            '$_s',
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _cal,
        tooltip: 'LET\'s CALCULATE',
        child: const Icon(Icons.calculate),
      ),
    );
  }
}
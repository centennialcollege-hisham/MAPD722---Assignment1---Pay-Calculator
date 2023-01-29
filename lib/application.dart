import 'package:first_flutter_project/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculator_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CalculatorProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Pay Calculator',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const CalculatorScreen(),
      ),
    );
  }
}

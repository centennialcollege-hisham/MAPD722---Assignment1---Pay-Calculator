import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Container(
        color: Colors.grey.shade100,
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        labelText: 'Number of hours',
                        border: OutlineInputBorder(),
                        hintText: 'Enter Number Of Hours',
                      ),
                      validator: (v) => '',
                      // todo
                      onChanged: (value) {
                        //todo
                      },
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Hours Rate",
                        border: OutlineInputBorder(),
                        hintText: 'Enter Hours Rate',
                      ),
                      validator: (t) {
                        return ''; // todo
                      },
                      onChanged: (value) {
                        //todo
                      },
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^[0-9]+.?[0-9]*'))
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      style: TextButtonTheme.of(context).style,
                      onPressed: () {
                        //todo
                      },
                      child: const Text('Calculate'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: const Text(
                        "Report",
                        style: TextStyle(
                            fontSize: 20, decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: const [
                          Text('Regular Pay 0', style: TextStyle(fontSize: 20)),
                          Text('Overtime Pay 0',
                              style: TextStyle(fontSize: 20)),
                          Text('Total Pay 0', style: TextStyle(fontSize: 20)),
                          Text('Tax 0', style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 10,
        color: Colors.white,
        child: const Center(child: Text('Hisham Snamiah - 301289364')),
      ),
    );
  }
}

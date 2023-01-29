import 'package:first_flutter_project/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final calculatorProvider = context.watch<CalculatorProvider>();

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
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20.0),
                        labelText: 'Number of hours',
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Number Of Hours',
                        errorText: calculatorProvider.isNumberOfHoursEmpty
                            ? ' Number Of Hours can\'t be empty '
                            : null,
                      ),
                      onChanged: (value) {
                        calculatorProvider.onChangeNumbersOfHour(value);
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
                      decoration: InputDecoration(
                        labelText: "Hours Rate",
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Hours Rate',
                        errorText: calculatorProvider.isHourlyRateEmpty
                            ? 'Hours Rate can\'t be empty '
                            : null,
                      ),
                      onChanged: (value) {
                        calculatorProvider.onChangeHourlyRate(value);
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
                        FocusManager.instance.primaryFocus?.unfocus();
                        calculatorProvider.calculate();
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
                      margin: const EdgeInsets.all(20.0),
                      child: const Text(
                        "Report",
                        style: TextStyle(
                            fontSize: 20, decoration: TextDecoration.underline,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Text('Regular Pay ${calculatorProvider.regularPay}',
                              style: const TextStyle(fontSize: 20)),
                          Text('Overtime Pay ${calculatorProvider.overtimePay}',
                              style: const TextStyle(fontSize: 20)),
                          Text('Total Pay ${calculatorProvider.totalPay}',
                              style: const TextStyle(fontSize: 20)),
                          Text('Tax ${calculatorProvider.tax}',
                              style: const TextStyle(fontSize: 20)),
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
        child: const Center(
          child: Text(
            'Hisham Snamiah \n 301289364',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_study_hub/features/testing/sections/unit_testing/services/counter_service.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  final CounterService _counterService = CounterService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter App",style: TextStyle(),)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_counterService.count.toString(),style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counterService.decrementCount();
                  });
                },
                child: Icon(Icons.minimize),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counterService.incrementCount();
                  });
                },
                child: Icon(Icons.add),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

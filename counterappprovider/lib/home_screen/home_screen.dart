import 'package:counterappprovider/controller/counter_provider.dart';
import 'package:counterappprovider/second_page/second_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Counter App'), centerTitle: true),
      body: Center(
        child: Column(
          children: [
            Text(
              counter.count.toString(),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                );
              },
              child: Text("Go to Next page"),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(
                            onPressed: counter.increment,
                            child: const Icon(Icons.add),
                          ),
                          const SizedBox(width: 10),
                          FloatingActionButton(
                            onPressed: counter.decrement,
                            child: const Icon(Icons.remove),
                          ),
                          SizedBox(width: 10),
                          FloatingActionButton(
                            onPressed: counter.reset,
                            child: Icon(Icons.refresh),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

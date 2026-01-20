import 'package:flutter/material.dart';
import 'package:counterappprovider/controller/counter_provider.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});
  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterProvider>();
    return Scaffold(body: Center(child: Text("${counter.count}")));
  }
}

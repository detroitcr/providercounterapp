import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertutorial/Provider/counter_provider.dart';

import '../Widgets/count.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('you have pushed the button'),
         
      
           const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => context.read<Counter>().increment(),
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
                  const Count(),
                IconButton(
                  onPressed: () => context.read<Counter>().decrement(),
                  icon: const Icon(
                    Icons.remove,
                  ),
                ),
             
                
              ],
            ),
          ],
        ),
      ),
     
    );
  }
}


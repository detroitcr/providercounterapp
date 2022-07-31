import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertutorial/Provider/get_data_provider.dart';
import 'package:providertutorial/UI/home_page.dart';

import 'Provider/counter_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Counter(),
        ),
        ChangeNotifierProvider(
          create: (_) => GetDataProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      //CounterPage(),
    );
  }
}

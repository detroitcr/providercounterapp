import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;
 
  void increment() {
    _count++;
    //change notifier main function Notifylisteners(), so we can use these functions in another class without Mess(),
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
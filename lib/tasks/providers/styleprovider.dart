import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Style with ChangeNotifier{
  Color _randomColor = Colors.black;
  final _random = Random();

  Color get color {
    return _randomColor ;
  }

  void changebuttonColor()async{
    _randomColor =
    Colors.primaries[_random.nextInt(Colors.primaries.length)];
    notifyListeners();
  }

}
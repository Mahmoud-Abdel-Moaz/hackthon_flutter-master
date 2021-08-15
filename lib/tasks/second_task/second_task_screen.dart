import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hackathon_fatura/tasks/providers/styleprovider.dart';
import 'package:provider/provider.dart';

/*
 Second Task : app consists of FAB and container
 when i pressed on FAB it changes container Color
 but when i pressed on FAB it Rebuild Background widget
 which it doesn't no need to rebuild
 you need to optimize build function as
 when i pressed on Button don't rebuild Background widget
 */

class SecondTaskScreen extends StatelessWidget {
  Color _randomColor = Colors.black;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    print("Building SecondTaskScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text("Second task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /*setState(() {
            _randomColor =
                Colors.primaries[_random.nextInt(Colors.primaries.length)];
          });*/
          Provider.of<Style>(context,listen: false).changebuttonColor();
        },
        child: Icon(Icons.colorize),
      ),
      body: BackgroundWidget(
          child: Center(
            child: Consumer<Style>(
              builder: (ctx, style, _) => Container(
                width: 100,
                height: 100,
                color:  style.color,
              ),
            ),
          )),
    );
  }
}

/*class SecondTaskScreen extends StatefulWidget {
  @override
  _SecondTaskScreenState createState() => _SecondTaskScreenState();
}*/

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  const BackgroundWidget({required this.child});

  @override
  Widget build(BuildContext context) {

    print("Building BackgroundWidget");

    return  Container(color: Colors.amber, child: child);
  }

}

/*class _SecondTaskScreenState extends State<SecondTaskScreen> {
  Color _randomColor = Colors.black;
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    print("Building SecondTaskScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text("Second task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          *//*setState(() {
            _randomColor =
                Colors.primaries[_random.nextInt(Colors.primaries.length)];
          });*//*
           Provider.of<Style>(context,listen: false).changebuttonColor();
        },
        child: Icon(Icons.colorize),
      ),
      body: BackgroundWidget(
          child: Center(
        child: Container(
          width: 100,
          height: 100,
          color:  Provider.of<Style>(context).color,
        ),
      )),
    );
  }
}*/

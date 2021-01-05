import 'package:flutter/material.dart';
import 'package:flutter_wishlist/screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wishlist/entities/task_entity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}

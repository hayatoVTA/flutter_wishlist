import 'package:flutter/material.dart';
import 'package:flutter_wishlist/screen/wish_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wishlist/models/task_data.dart';

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

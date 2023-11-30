import 'package:flutter/material.dart';
import 'package:flutter_crud/views/user_list.dart';

void main() {
  runApp(const MinhaAplicacao());
}

class MinhaAplicacao extends StatelessWidget {
  const MinhaAplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter CRUD",
      home: UserList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
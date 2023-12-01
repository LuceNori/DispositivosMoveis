import 'package:flutter/material.dart';
import 'package:flutter_crud/providers/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:flutter_crud/views/user_form.dart';
import 'package:flutter_crud/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MinhaAplicacao());
}

class MinhaAplicacao extends StatelessWidget {
  const MinhaAplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => Users(),
      child: MaterialApp(
        title: "Tarefa Flutter CRUD",
        home: UserList(),
        routes:{
          AppRoutes.USER_FORM: (_)=>UserForm()
        }
      ),
    );
  }
}
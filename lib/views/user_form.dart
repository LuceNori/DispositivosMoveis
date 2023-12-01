import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/providers/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['nome'] = user.nome;
      _formData['email'] = user.email;
      _formData['avatarURL'] = user.avatarURL;
    }
  }

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  @override
  Widget build(BuildContext context) {
    final Object? object = ModalRoute.of(context)!.settings.arguments;
    User user;
    String id = '';
    if (object != null) {
      user = object as User;
      _loadFormData(user);
      id = user.id;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('formulario de usuário'),
        actions: <Widget>[
          IconButton(
              onPressed: () async{
                final isValid = _form.currentState!.validate();
                if (isValid) {
                  _form.currentState!.save();
                  
                  await Provider.of<Users>(context, listen: false).put(User(
                    id: id,
                    nome: _formData['nome'] as String,
                    email: _formData['email'] as String,
                    avatarURL: _formData['avatarURL'] as String,
                  ));
                  
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(Icons.save))
        ],
      ),
      body:Padding(
          padding: EdgeInsets.all(15),
          child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: _formData['nome'],
                    decoration: InputDecoration(labelText: 'nome'),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'nome invalido';
                      }
                      if (value.trim().length < 3) {
                        return 'nome muito pequeno. Mínimo 3 letras';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['nome'] = value as String,
                  ),
                  TextFormField(
                    initialValue: _formData['email'],
                    decoration: InputDecoration(labelText: 'E-mail'),
                    onSaved: (value) => _formData['email'] = value as String,
                  ),
                  TextFormField(
                    initialValue: _formData['avatarURL'],
                    decoration: InputDecoration(labelText: 'URL do avatar'),
                    onSaved: (value) =>
                        _formData['avatarURL'] = value as String,
                  )
                ],
              ))),
    );
  }
}

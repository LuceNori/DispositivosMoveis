import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/providers/users.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  User user;
  UserTile({
    super.key,
    required this.user,
  });
  @override
  Widget build(BuildContext context) {
    CircleAvatar ca;
    if (user.avatarURL.isEmpty) {
      ca = CircleAvatar(
        child: Icon(Icons.person),
      );
    } else {
      ca = CircleAvatar(
        backgroundImage: NetworkImage(user.avatarURL),
      );
    }
    return ListTile(
      leading: ca,
      title: Text(user.nome),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                },
                icon: Icon(Icons.edit),
                color: Color.fromARGB(255, 10, 128, 141)),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir usuário'),
                    content: Text('tem certeza?'),
                    actions: <Widget>[
                      TextButton(onPressed: () {
                        Provider.of<Users>(context, listen: false).remove(user);
                        Navigator.of(context).pop();
                      }, child: Text('sim')),
                      TextButton(onPressed: () {
                        Navigator.of(context).pop();
                      }, child: Text('não')),
                    ],
                  ),
                );
                
              },
              icon: Icon(Icons.delete),
              color: const Color.fromARGB(255, 228, 20, 5),
            ),
          ],
        ),
      ),
    );
  }
}

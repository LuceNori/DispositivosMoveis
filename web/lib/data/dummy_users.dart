import 'package:flutter_crud/models/user.dart';

Map<String, User> DUMMY_USERS = {
  '1': User(
    id: '1', 
    nome: 'Celeste', 
    email: 'celeste@mail.com',
    avatarURL: 'https://cdn.pixabay.com/photo/2023/02/10/07/59/fox-7780326_1280.jpg',
    ),
  '2': User(
    id: '2', 
    nome: 'Afonso', 
    email: 'afonso@mail.com',
    avatarURL: 'https://cdn.pixabay.com/photo/2016/10/10/14/13/dog-1728494_1280.png',
    ),
  '3': User(
    id: '3', 
    nome: 'Shiva', 
    email: 'shiva@mail.com',
    avatarURL: 'https://cdn.pixabay.com/photo/2020/10/11/19/51/cat-5646889_1280.jpg',
    ),
  '4': User(
    id: '4', 
    nome: 'Rick', 
    email: 'rick@mail.com',
    avatarURL: '',
    ),
};
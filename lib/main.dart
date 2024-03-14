import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

//EnterFireBase
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

//Material app connect
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const HomePage());
  }
}

//Register page
class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  String info = "";

  Future<User?> register() async {
    final auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: 'email2@gmail.com', password: 'password');
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('___Ошибка: ' + e.code);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('🧨 Регистрация'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () async {
                final data = await register();
                if (data != null) {
                  info = 'Почта авторизованного пользователя: ${data.email!}';
                  // ignore: use_build_context_synchronously
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Регистрация'),
                        content: Text(info),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Закрыть'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              icon: const Icon(Icons.door_back_door),
              label: const Text('Зарегистрироваться'))
        ],
      )),
    );
  }
}

//Auth page
class SingInPage extends StatefulWidget {
  const SingInPage({super.key});

  @override
  State<SingInPage> createState() => _SingInPageState();
}

class _SingInPageState extends State<SingInPage> {
  String info = "";

  Future<User?> auth() async {
    final auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: 'email239@gmail.com', password: 'password');
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('___Ошибка: ' + e.code);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('🧨 Авторизация'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () async {
                final data = await auth();
                if (data != null) {
                  info = 'Почта авторизованного пользователя: ${data.email!}';
                  // ignore: use_build_context_synchronously
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Авторизация'),
                        content: Text(info),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Закрыть'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              icon: const Icon(Icons.door_back_door),
              label: const Text('Авторизоваться'))
        ],
      )),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String info = "";

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> add() {
    final user = firestore.collection('users');

    return user.add({
      'misha': [
        'misha1',
        'misha2',
        'misha3',
      ]
    }).then((value) {
      info = "info was sended!";
    }).catchError((value) {
      info = "error: $value";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('🧨 Список элементов'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton.icon(
              onPressed: () async {
                await add();
                // ignore: use_build_context_synchronously
                await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Статус'),
                      content: Text(info),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Закрыть'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.door_back_door),
              label: const Text('Добавит!'))
        ],
      )),
    );
  }
}

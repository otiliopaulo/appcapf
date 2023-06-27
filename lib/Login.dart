import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              label: Text('Email'),
            ),
          ),
          TextFormField(
            controller: _senhaController,
            decoration: InputDecoration(
              label: Text('Senha'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              login();
            },
            child: Text('Entrar com usuário'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: Text('Entrar sem usuário'),
          ),
        ],
      ),
    );
  }

  login() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _senhaController.text,
      );
      if (userCredential != null) {
        Navigator.of(context).pushNamed('/');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario não encontrado!'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Senha inválida!'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}

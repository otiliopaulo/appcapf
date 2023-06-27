import 'package:appcapf/EmailSend.dart';
import 'package:flutter/material.dart';

class SugestaoForm extends StatefulWidget {
  const SugestaoForm({super.key});

  @override
  _SugestaoFormState createState() => _SugestaoFormState();
}

class _SugestaoFormState extends State<SugestaoForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _mensagemController = TextEditingController();
  final _paroquiaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _telefoneController.dispose();
    _mensagemController.dispose();
    _paroquiaController.dispose();
    super.dispose();
  }

  Future<void> _enviarMensagem() async {
    if (_formKey.currentState!.validate()) {
      // Envia a mensagem (por exemplo, usando uma API ou enviando um email)
      // ...
      String messagemResult = 'Email não enviado!';
      EmailSend emailSende = EmailSend('otiliopaulo@gmail.com', 'op224273');
      var sendeEmail = await emailSende.enviarEmail(_mensagemController.text,
          _emailController.text, _nomeController.text);

      if (sendeEmail) {
        messagemResult = 'Sua mensagem foi enviada com sucesso!';
      }
      print('Email: ${emailSende.username}');
      print('password: ${emailSende.password}');
      print(_mensagemController.text);
      print(_emailController.text);
      print(_nomeController.text);
      print(_paroquiaController);

      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Obrigado!'),
            content: Text(messagemResult),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fale conosco'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, insira seu endereço de email';
                    }
                    if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Por favor, insira um email válido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _telefoneController,
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, insira seu número de telefone';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _paroquiaController,
                  decoration: InputDecoration(
                    labelText: 'Paróqui/área pastoral',
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, insira seu número de telefone';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _mensagemController,
                  decoration: InputDecoration(
                    labelText: 'Mensagem',
                  ),
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor, insira sua mensagem';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: _enviarMensagem,
                    child: Text('Enviar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

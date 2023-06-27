import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart'; // ou qualquer outro servidor SMTP que você queira usar

class EmailSend {
  String username; // substitua pelo seu endereço de e-mail
  String password; // substitua pela sua senha

  EmailSend(this.username, this.password);

  Future<bool> enviarEmail(
      String messageEmail, String destinationEmail, String subject) async {
    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'Seu Nome')
      ..recipients.add(
          destinationEmail) // substitua pelo endereço de e-mail do destinatário
      ..subject = subject
      ..text = messageEmail;

    try {
      await send(message, smtpServer);
      print('E-mail enviado com sucesso! - $username - $password');
      return true;
    } on MailerException catch (e) {
      print('Erro ao enviar e-mail: $e - $username - $password');
      return false;
    }
  }
}

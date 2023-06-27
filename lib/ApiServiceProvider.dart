import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ApiServiceProvider {
  static final String BASE_URL =
      "https://drive.google.com/file/d/1kwf4vQz2j1nY6XRMs3wMd4hOi6nVYb-m/view";

  static Future<String> loadPDF() async {
    var response = await http.get(BASE_URL as Uri);

    var dir = await getApplicationDocumentsDirectory();
    File file = new File("${dir.path}/data.pdf");
    file.writeAsBytesSync(response.bodyBytes, flush: true);
    return file.path;
  }
}

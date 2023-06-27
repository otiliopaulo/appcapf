import 'package:flutter/material.dart';

class Setores extends StatefulWidget {
  const Setores({super.key});

  @override
  State<Setores> createState() => _SetoresState();
}

class _SetoresState extends State<Setores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setores'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              'images/logo_pf.png',
              width: 150,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
              ),
              child: ElevatedButton(
                child: Text(
                  'Pré-Matrimônio',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/prematrimonio');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
              ),
              child: ElevatedButton(
                child: Text(
                  'Pós-Matrimônio',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/prematrimonio');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
              ),
              child: ElevatedButton(
                child: Text(
                  'Casos Especiais',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/prematrimonio');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 15.0,
                      offset: Offset(0.0, 0.75))
                ],
              ),
              child: ElevatedButton(
                child: Text(
                  'Cooperadores à Vida',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/prematrimonio');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

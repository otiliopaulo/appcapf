import 'package:flutter/material.dart';

class PreMatrimonio extends StatefulWidget {
  const PreMatrimonio({super.key});

  @override
  State<PreMatrimonio> createState() => _PreMatrimonioState();
}

class _PreMatrimonioState extends State<PreMatrimonio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setor Pré-Matrimônio',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
                'images/logo_pf.png',
                width: 150,
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75)),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        print('OK..');
                      },
                      child: Text(
                        'Materiais',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            blurRadius: 15.0,
                            offset: Offset(0.0, 0.75)),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        print('OK..');
                      },
                      child: Text(
                        'Formações',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Intinerário',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Livros',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Vídeos',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 15.0,
                          offset: Offset(0.0, 0.75),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Comissão Nacional PF',
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

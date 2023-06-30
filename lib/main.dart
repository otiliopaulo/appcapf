import 'dart:async';

import 'package:appcapf/Login.dart';
import 'package:appcapf/SugestoesForm.dart';
import 'package:appcapf/casosespeciais.dart';
import 'package:appcapf/comissao_list.dart';
import 'package:appcapf/cooperadores.dart';
import 'package:appcapf/eventos.dart';
import 'package:appcapf/firebase_options.dart';
import 'package:appcapf/pdfViewerPage.dart';
import 'package:appcapf/posmatrimonio.dart';
import 'package:appcapf/prematrimonio.dart';
import 'package:appcapf/setores.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHome(),
      //initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHome(),
        '/home': (context) => const Home(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/calendario': (context) => const Calendario(),
        '/membrosDados': (context) => const MembrosDados(),
        '/setores': (context) => const Setores(),
        '/prematrimonio': (context) => const PreMatrimonio(),
        '/eventos': (context) => const Eventos(),
        '/eventosDados': (context) => const EventosDados(),
        '/sugestoesForm': (context) => SugestaoForm(),
        '/login': (context) => Login(),
        '/posmatrimonio': (contato) => PosMatrimonio(),
        '/casosespeciais': (context) => CasosEspeciais(),
        '/cooperadores': (context) => Cooperadores(),
      },
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool userLoged = false;
  StreamSubscription? _streamSubscription;

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        setState(() {
          userLoged = false;
        });
        print('User is currently signed out!');
        //Navigator.of(context).pushNamed('/login');
      } else {
        setState(() {
          userLoged = true;
        });
        print('User is signed in!');
        //Navigator.of(context).pushNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _streamSubscription!.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  int _selectedIndex = 0;

  final List<Widget> _children = [
    Home(),
    Comissao(),
    Calendario(),
    //SignInPage()
  ];

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => _children[_selectedIndex],
    //   ),
    // ); // this has changed
  }

  final Uri url_lojaCnpf = Uri.parse('https://www.lojacnpf.org.br/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pastoral Familiar'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Comissão Arquidiocesana'),
              accountEmail: Text('meuemail@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/logo_pf.png'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Página inicial'),
              onTap: () {
                // ação a ser executada quando o item é pressionado
                Navigator.pushNamed(context, '/');
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.heart_broken_sharp),
            //   title: Text('Caixinha do Amor'),
            //   onTap: () {
            //     // ação a ser executada quando o item é pressionado
            //     Navigator.pop(context);
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.cast_for_education_rounded),
              title: Text('Livros da Pastoral Familiar'),
              onTap: () {
                // ação a ser executada quando o item é pressionado
                //Navigator.pop(context);
                launchUrl(url_lojaCnpf);
              },
            ),
            ListTile(
              leading: Icon(Icons.lan_sharp),
              title: Text('Estrutura da Comissão'),
              onTap: () {
                //Preciso da estrutura da comissão
                // Foranias, paróquias e àreas pastorais, etc..
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.output),
              title: (userLoged) ? Text('Sair') : Text('Login'),
              onTap: () {
                sair();
                //Navigator.of(context).pushNamed('/home');
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.settings),
            //   title: Text('Configurações'),
            //   onTap: () {
            //     // ação a ser executada quando o item é pressionado
            //     Navigator.pop(context);
            //   },
            // ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.facebook,
                  size: 50,
                ),
                Image.asset(
                  'images/icons8-whatsapp-50.png',
                  width: 50,
                ),
                Image.asset(
                  'images/icons8-youtube-50.png',
                  width: 50,
                ),
              ],
            ),
          ],
        ),
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Comissão',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  sair() async {
    await _firebaseAuth.signOut().then(
          (user) => Navigator.pushReplacementNamed(
            context,
            '/login',
          ),
        );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text('Home'),
      //    ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/logo_pf.png',
                width: 260.0,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 182,
                    width: 182,
                    child: ElevatedButton(
                      child: Text(
                        'Calendário',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => {
                        Navigator.pushNamed(context, '/calendario'),
                      },
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 182,
                    width: 182,
                    child: ElevatedButton(
                      child: Text(
                        'Setores',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => {
                        //Navigator.pushNamed(context, '/setores')
                        Navigator.of(context).pushNamed('/setores')
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Container(
                    height: 182,
                    width: 182,
                    child: ElevatedButton(
                      child: Text(
                        'Eventos',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/eventos')},
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 182,
                    width: 182,
                    child: ElevatedButton(
                      child: Text(
                        'Fale conosco',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => {
                        Navigator.pushNamed(context, '/sugestoesForm'),
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Calendario extends StatefulWidget {
  const Calendario({super.key});

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario'),
      ),
      body: //PdfViewerPage(),
          Container(
        child: SfPdfViewer.network(
          'https://drive.google.com/uc?export=view&id=1kwf4vQz2j1nY6XRMs3wMd4hOi6nVYb-m',
        ),
      ),
    );
  }
}

class Comissao extends StatefulWidget {
  const Comissao({super.key});

  @override
  State<Comissao> createState() => _ComissaoState();
}

class _ComissaoState extends State<Comissao> {
  @override
  Widget build(BuildContext context) {
    return const ComissaoList();
  }
}

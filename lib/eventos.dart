import 'package:flutter/material.dart';

final List<String> eventosList = <String>[
  'Evento 1',
  'Evento 2',
];

final List<String> aboutEventoList = <String>[
  'Descrição Evento 1',
  'Descrição Evento 2',
];

int _selectedIndex = 0;

class Eventos extends StatefulWidget {
  const Eventos({super.key});

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
      ),
      body: ListView.builder(
        itemCount: eventosList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            // leading: CircleAvatar(
            //   radius: 30, // Image radius
            //   backgroundImage: AssetImage(
            //     eventosList[index],
            //   ),
            // ),
            // trailing: const Text(
            //   "(86)",
            //   style: TextStyle(color: Colors.green, fontSize: 15),
            // ),
            shape: Border.all(
              width: 0.5,
              color: Colors.lightBlue,
            ),
            title: Text(eventosList[index]),
            subtitle: Text(aboutEventoList[index]),
            onTap: () {
              Navigator.pushNamed(context, '/eventosDados');
              setState(() {
                _selectedIndex = index;
                //imagePath = images[index];
                //print('image $imagePath');
              });
            },
          );
        },
      ),
    );
  }
}

class EventosDados extends StatefulWidget {
  const EventosDados({super.key});

  @override
  State<EventosDados> createState() => _EventosDadosState();
}

class _EventosDadosState extends State<EventosDados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(eventosList[_selectedIndex]),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              // CircleAvatar(
              //   radius: 200, // Image radius
              //   backgroundImage: AssetImage(
              //     imagePath,
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Text(
                eventosList[_selectedIndex],
                style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(aboutEventoList[_selectedIndex]),
            ],
          ),
        ),
      ),
    );
  }
}

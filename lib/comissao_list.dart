import 'package:flutter/material.dart';

final List<String> membros = <String>[
  'Dom Juarez de Souza da Silva',
  'Pe. Gonçalo Teixeira Lima',
  'José e Marinalva',
  'Júnior e Marcélia',
  'Otilio e Dalla',
  'Messias e Jesus',
  'Silvestre e Carmem',
  'Salvador e Regina',
  'Smiley e Kelly',
  'Pequenez e Ceiça',
  'Sebastião e Sheila',
  'Ravel e Crisiane',
  'Wagno e Janaina',
  'Manoel Filho e Ceiça',
  'Elicarlos e Josy',
  'Jonas e Elza',
  'Evaldo e Hosana',
  'Euriberto e Elisangela',
  'Ribamar e Benilde',
  'Rômulo e Felicidade',
  'João e Socorro',
  'Pero e Socorro',
  'Laelson e Nina',
];

final List<String> pasta = <String>[
  'Arcebispo de Teresina',
  'Dir. Espiritual da CAPF',
  'Coordenador Geral da CAPF',
  'Vice-Coordenador',
  'Assessor Secretaria e Rede Sociais',
  'Assessord e Finanças',
  'Assessor Liturgia e Animação',
  'Assessor Formação',
  'Setor Pré-Matrimônio',
  'Setor Pós-Matrimônio',
  'Setor Casos Especiais',
  'Cooperadores da Vida',
  'Ligação Forania Norte I',
  'Ligação Forania Norte II',
  'Ligação Forania Leste',
  'Ligação Forania Sudeste',
  'Ligação Forania Sul I / Centro',
  'Ligação Forania Sul II',
  'Ligação Forania Sul III',
  'Ligação Forania Rural I',
  'Ligação Forania Rural II',
  'Ligação Forania Rural III',
  'Ligação Forania Rural IV',
];

final List<String> images = <String>[
  'images/bispo.jpeg',
  'images/goncalo.jpeg',
  'images/marinalva.jpeg',
  'images/junior_marcelia.jpg',
  'images/otilio_dalla.jpeg',
  'images/messia_jesus.jpeg',
  'images/silvestre_carmem.jpeg',
  'images/salvador_regina.jpeg',
  'images/smiley_kelly.png',
  'images/pequenes_ceica.jpeg',
  'images/sebastiao_sheila.jpeg',
  'images/ravel_crisiane.jpeg',
  'images/wagno_janaina.jpeg',
  'images/manoel_ceica.jpeg',
  'images/elicarlos_josy.jpeg',
  'images/jonas_elza.jpeg',
  'images/evaldo_hosana.jpeg',
  'images/euriberto_elisangela.jpeg',
  'images/ribamar_benilde.jpeg',
  'images/romulo_felicidade.jpeg',
  'images/joao_socorro.jpeg',
  'images/pedro_socorro.jpeg',
  'images/laelson_nina.jpeg',
];

final List<String> contato = <String>[
  '',
  '',
  '(86)99991-1425 / (86)99991-1427',
  '(86)99970-5790 / (86)98873-7780',
  '(86)98882-6242 / (86)99961-5617',
  '(86)99987-4573 / (86)99953-5243',
  '(86)99540-6367 / (86)99505-8708',
  '(86)99948-2023 / (86)99990-8233',
  '(86)99929-3837 / (86)99999-6109',
  '(86)99985-7356 / (86)99858-6111',
  '(86)98103-0343 / (86)99447-7679',
  '(86)98804-1080 / (86)98855-1081',
  '(86)98835-5419 / (86)99419-4222',
  '(86)98843-0008 / (86)99984-3339',
  '(86)99476-6191 / (86)99502-9693',
  '(86)98835-9385 ',
  '(86)98116-6464 / (86)981428999',
  '(86)98811-7624 / (86)98883-9893',
  '(86)99945-6649 ',
  '(86)99455-0564 / (86)99956-0397',
  '(86)99922-8923 / (86)98836-9905',
  '(86)99515-8964 ',
  '(86)98105-5592 / (86)98114-6541',
];

int _selectedIndex = 0;

String imagePath = '';

class ComissaoList extends StatefulWidget {
  const ComissaoList({super.key});

  @override
  State<ComissaoList> createState() => _ComissaoListState();
}

class _ComissaoListState extends State<ComissaoList> {
  // final List<Widget> _children = [
  //   MembrosDados(),
  // ];

  // _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     imagePath = images[index];
  //     print('image $imagePath');
  //   });
  //   // Navigator.of(context).push(
  //   //   MaterialPageRoute(
  //   //     builder: (BuildContext context) => _children[_selectedIndex],
  //   //   ),
  //   // ); // this has changed
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Membros da Comissão")),
      body: ListView.builder(
        itemCount: membros.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30, // Image radius
              backgroundImage: AssetImage(
                images[index],
              ),
            ),
            // trailing: const Text(
            //   "(86)",
            //   style: TextStyle(color: Colors.green, fontSize: 15),
            // ),
            title: Text(membros[index]),
            subtitle: Text(pasta[index]),
            onTap: () {
              Navigator.pushNamed(context, '/membrosDados');
              setState(() {
                _selectedIndex = index;
                imagePath = images[index];
                //print('image $imagePath');
              });
            },
          );
        },
      ),
    );
  }
}

class MembrosDados extends StatefulWidget {
  const MembrosDados({super.key});

  @override
  State<MembrosDados> createState() => _MembrosDadosState();
}

class _MembrosDadosState extends State<MembrosDados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membros da comissão'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 200, // Image radius
                backgroundImage: AssetImage(
                  imagePath,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                membros[_selectedIndex],
                style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(pasta[_selectedIndex]),
              Text(contato[_selectedIndex]),
            ],
          ),
        ),
      ),
    );
  }
}

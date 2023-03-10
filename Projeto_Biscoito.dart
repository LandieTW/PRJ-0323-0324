// Projeto biscoito da sorte
//    A ideia é criar um app com uma imagem de biscoito da sorte e  um botão
//    para se clicar. Após o usuário clicar no botão, a imagem troca para um
//    biscoito da sorte quebrado, com um bilhete motivacional dentro e com uma
//    nova a cada clique.

import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
// ignore: non_constant_identifier_names
  var Lista = ["Frase 1", "Frase 2", "Frase 3", "Frase 4", "Frase 5"];

  var frases = "Clique no botão para quebrar o biscoito";

// ignore: non_constant_identifier_names
  var IMG1 = ("imagens/naruto.png");
// ignore: non_constant_identifier_names
  var IMG2 = ("imagens/One-Piece.png");

  void quebrarbiscoito() {
    // Aqui definimos uma variável número com um valor randomico.
    // Este valor randômico precisa d uma referência para randomizar x itens
    // por isso, utilizamos Random().nextint para randomizar
    // e setamos como valor, o número de itens de nossa lista.
    // com o comando Lista.length.
    // Então a variável número sempre receberá valores entre 1 e 5
    // pois, temos 5 itens em nossa lista.

    var numero = Random().nextInt(Lista.length);

    // Sempre que queremos modificar alguma visualização no statefullwidget,
    // Precisamos utilizar o setState.
    // A variável "frases", que será exibida na tela, recebe um valor numero
    // na forma de indexador, dentro da lista.
    // Fazendo com que frases assuma o valor de uma das frases colocadas na lista.
    // Em seguida, mudamos a imagem que aparece na tela.

    setState(() {
      frases = Lista[numero];
      IMG1 = IMG2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biscoito da sorte"),

        // centertitle é uma maneira bem legal de forçar a centralização do texto do título
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            // Com circleavatar, estamos trazendo uma formatação de círculo de avatar
            // para a imagem que utilizaremos

            CircleAvatar(
              // Aqui, setamos a imagem que queremos...
              backgroundImage: AssetImage(IMG1),
              // Aqui, determinamos o raio do círculo que queremos... (o seu tamanho)
              radius: 80,
              backgroundColor: Colors.white,
            ),
            Text(
              // Chamamos a variável com a frase randomica
              frases,
              textAlign: TextAlign.center,
              // importamos uma fontfamily diferente.
              style: const TextStyle(fontSize: 20, fontFamily: "Kalam"),
            ),
            ElevatedButton(
              onPressed: quebrarbiscoito,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
              ),
              child: const Text("Quebrar o biscoito"),
            )
          ]),
        ),
      ),
    );
  }
}

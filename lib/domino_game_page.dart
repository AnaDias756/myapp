import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class DominoGamePage extends StatefulWidget {
  const DominoGamePage({super.key});

  @override
  State<DominoGamePage> createState() => _DominoGamePageState();
}

class _DominoGamePageState extends State<DominoGamePage> {
  late List<List<int>> mesa;
  late List<List<int>> jogador;
  late List<List<int>> bot;
  late List<List<int>> monte;

  bool jogadorVenceu = false;
  bool fim = false;

  @override
  void initState() {
    super.initState();
    iniciarJogo();
  }

  void iniciarJogo() {
    final todas = <List<int>>[];
    for (int i = 0; i <= 6; i++) {
      for (int j = i; j <= 6; j++) {
        todas.add([i, j]);
      }
    }
    todas.shuffle();

    jogador = todas.sublist(0, 7);
    bot = todas.sublist(7, 14);
    monte = todas.sublist(14);
    mesa = [];
    fim = false;
    jogadorVenceu = false;
    setState(() {});
  }

  bool podeJogar(List<int> p) {
    if (mesa.isEmpty) return true;
    final esquerda = mesa.first[0];
    final direita = mesa.last[1];
    return p.contains(esquerda) || p.contains(direita);
  }

  void jogar(List<int> p, {bool doJogador = true}) {
    if (!podeJogar(p)) return;
    if (mesa.isEmpty) {
      mesa.add(p);
    } else {
      if (p.contains(mesa.first[0])) {
        mesa.insert(0, p[0] == mesa.first[0] ? p.reversed.toList() : p);
      } else {
        mesa.add(p[1] == mesa.last[1] ? p.reversed.toList() : p);
      }
    }
    setState(() {});
    verificarFim(doJogador);
    if (doJogador) Future.delayed(const Duration(milliseconds: 800), botJoga);
  }

  void botJoga() {
    if (fim) return;
    for (final p in bot) {
      if (podeJogar(p)) {
        bot.remove(p);
        jogar(p, doJogador: false);
        return;
      }
    }
    if (monte.isNotEmpty) {
      bot.add(monte.removeLast());
      botJoga();
    }
  }

  void verificarFim(bool ultimoFoiJogador) async {
    if (jogador.isEmpty || bot.isEmpty) {
      fim = true;
      jogadorVenceu = jogador.isEmpty;
      setState(() {});

      if (jogadorVenceu) {
      //  await FirebaseFirestore.instance.collection('pontuacoes').add({
      //    'nome': 'Jogador',
      //    'pontos': 1,
      //    'data': DateTime.now().toIso8601String(),
      //  });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo de Dominó'),
      ),
      body: fim
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(jogadorVenceu ? 'Você venceu!' : 'O bot venceu!'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: iniciarJogo,
                    child: const Text('Jogar novamente'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Voltar'),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                const SizedBox(height: 10),
                const Text('Mesa:'),
                Wrap(
                  children: mesa.map((p) => _peca(p)).toList(),
                ),
                const Divider(),
                const Text('Suas pecas:'),
                Wrap(
                  children: jogador.map((p) {
                    return GestureDetector(
                      onTap: () {
                        if (podeJogar(p)) {
                          jogador.remove(p);
                          jogar(p);
                        }
                      },
                      child: _peca(p),
                    );
                  }).toList(),
                ),
              ],
            ),
    );
  }

  Widget _peca(List<int> p) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade200,
      ),
      child: Text('[${p[0]}|${p[1]}]'),
    );
  }
}
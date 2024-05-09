import 'package:flutter/material.dart';
import 'package:tarefas_flutter/screens/form_screen.dart';

import '../componentes/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter: Primeiros Passos'),
        leading: const Icon(Icons.add_task),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormScreen(),
                    ));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: Container(
          color: const Color.fromARGB(255, 208, 221, 237),
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Tasks('Estudar Flutter', 'assets/images/dash.png', 3),
              ),
              Tasks('Andar de Bike', 'assets/images/bike.webp', 2),
              Tasks('Ler 50 páginas', 'assets/images/livro.jpg', 1),
              Tasks('Meditar', 'assets/images/meditar.jpeg', 4),
              Tasks(
                'Jogar',
                'assets/images/jogar.jpg',
                0,
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.blue[100],
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}

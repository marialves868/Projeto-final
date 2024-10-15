import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Final',
      home: const TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final TextEditingController _controller = TextEditingController();
  List<String> items = [];

  // Função para adicionar um item na lista
  void _addItem() {
    String text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        items.add(text);
      });
      _controller.clear(); // Limpa o campo após salvar
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Campo não pode estar vazio')),
      );
    }
  }

  // Função para apagar todos os itens
  void _clearItems() {
    setState(() {
      items.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lista de Tarefas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Tarefas',
              style: TextStyle(fontSize: 24),
            ),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Digite algo',
              ),
            ),
            ElevatedButton(
              onPressed: _addItem,
              child: const Text('Salvar'),
            ),
            Expanded(
              child: ListView(
                children: items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      item,
                      style: const TextStyle(color: Color.fromARGB(255, 48, 27, 235), fontSize: 18),
                    ),
                  );
                }).toList(),
              ),
            ),
            if (items.isNotEmpty)
              ElevatedButton(
                onPressed: _clearItems,
                child: const Text('Apagar Tudo'),
              ),
          ],
        ),
      ),
    );
  }
}
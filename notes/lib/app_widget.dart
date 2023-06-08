import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School',
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: const [
                      CircleAvatar(
                        child: Text("R"),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Rafael Silva",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Minhas estatísticas',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Icon(Icons.list),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Total de notas: "),
                  Text("0"),
                ],
              ),
              Row(
                children: const [
                  Icon(Icons.check),
                  SizedBox(
                    width: 8,
                  ),
                  Text("Concluidas: "),
                  Text("0"),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              const Text(
                "Configurações",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tema escuro'),
                  Switch(value: true, onChanged: (val) {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

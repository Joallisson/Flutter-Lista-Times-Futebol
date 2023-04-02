import 'package:flutter/material.dart';
import 'package:flutter_aula1/controllers/home_controller.dart';
import 'package:flutter_aula1/models/time.dart';
import 'package:flutter_aula1/pages/time_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Brasileirão"),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final List<Time> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[index].brasao),
            title: Text(tabela[index].nome),
            trailing: Text(tabela[index].pontos.toString()),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => TimePage(
                          key: Key(tabela[index].nome), 
                          time: tabela[index]
                      )
                  )
              );
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: controller.tabela.length,
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}

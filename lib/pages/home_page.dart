import 'package:flutter/material.dart';
import 'package:flutter_aula1/controllers/home_controller.dart';
import 'package:flutter_aula1/models/time.dart';
import 'package:flutter_aula1/pages/time_page.dart';
import 'package:flutter_aula1/repositories/times_repositoriy.dart';
import 'package:flutter_aula1/widgets/brasao.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

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
      body: Consumer<TimesRepository>(
        builder: (context, repositorio, child) {
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final List<Time> tabela = repositorio.times;
              return ListTile(
                leading: Brasao(image: tabela[index].brasao, width: 40,),
                title: Text(tabela[index].nome),
                subtitle: Text('Títulos: ${tabela[index].titulos.length}'),
                trailing: Text(tabela[index].pontos.toString()),
                onTap: () {
                  Get.to(() => TimePage( //Navegar para outra tela
                      key: Key(tabela[index].nome), 
                      time: tabela[index]
                    )
                  );
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: repositorio.times.length,
            padding: const EdgeInsets.all(16),
          );
        },
      ),
    );
  }
}

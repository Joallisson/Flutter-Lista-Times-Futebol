import 'package:flutter/material.dart';
import 'package:flutter_aula1/models/time.dart';
import 'package:flutter_aula1/models/titulo.dart';
import 'package:flutter_aula1/pages/add_titulo_page.dart';
import 'package:flutter_aula1/repositories/times_repositoriy.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:flutter_aula1/pages/edit_titulo_page.dart';

class TimePage extends StatefulWidget {
  Time time;
  TimePage({super.key, required this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  tituloPage() {
    Get.to(() => AddTituloPage(time: widget.time));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Center(
            child: Text(widget.time.nome),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: 'Estatísticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Títulos',
              )
            ],
            indicatorColor: Colors.white,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => tituloPage(),
            )
          ],
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(24),
                  child: Image.network(
                    widget.time.brasao,
                    scale: 2.0,
                  )),
              Text(
                "Pontos: ${widget.time.pontos}",
                style: const TextStyle(fontSize: 22),
              )
            ],
          ),
          titulos()
        ]),
      ),
    );
  }

  Widget titulos() {
    final time = Provider.of<TimesRepository>(context).times.firstWhere((time) => time.nome == widget.time.nome);
    final quantidade = time.titulos.length;

    return quantidade == 0
        ? const Center(
            child: Text("Nenhum Título Ainda"),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(time.titulos[index].campeonato),
                trailing: Text(time.titulos[index].ano),
                onTap: (){
                  Get.to(
                    EditTituloPage(titulo: time.titulos[index]),
                    fullscreenDialog: true
                  );
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantidade);
  }
}

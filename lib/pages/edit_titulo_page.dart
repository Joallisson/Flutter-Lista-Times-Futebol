import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:flutter_aula1/repositories/times_repositoriy.dart';
import 'package:flutter_aula1/models/titulo.dart';

class EditTituloPage extends StatefulWidget {
  Titulo titulo;

  EditTituloPage({super.key, required this.titulo});

  @override
  State<EditTituloPage> createState() => _EditTituloPageState();
}

class _EditTituloPageState extends State<EditTituloPage> {
  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  editar() {
    final timesRepository = context.read<TimesRepository>();
    timesRepository.editTitulo(
      titulo: widget.titulo,
      ano: _ano.text,
      campeonato: _campeonato.text,
    );
    Get.back();
  }

  @override
  void initState() {
    super.initState();

    _ano.text = widget.titulo.ano;
    _campeonato.text = widget.titulo.campeonato;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Editar Título"),
        ),
        backgroundColor: Colors.grey[800],
        actions: [IconButton(onPressed:() => editar(), icon: const Icon(Icons.check))],
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
                controller: _ano,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Ano",
                ),
                keyboardType: TextInputType.number,
                validator: (value){

                  if (value!.isEmpty) {
                    return "Informe o ano do título";
                  }

                  return null;
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: TextFormField(
                controller: _campeonato,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Campeonato",
                ),
                validator: (value){
                  if (value!.isEmpty) {
                    return "Informe qual é o campeonato";
                  }

                  return  null;
                },
              ),
            ),
        ]),
      )
    );
  }
}

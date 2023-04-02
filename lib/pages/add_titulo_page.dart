
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_aula1/models/time.dart';
import 'package:flutter_aula1/models/titulo.dart';


class AddTituloPage extends StatefulWidget {

  Time time;
  ValueChanged<Titulo> onSave;

  AddTituloPage({super.key, required this.time, required this.onSave});

  @override
  State<AddTituloPage> createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {

  final _campeonato = TextEditingController();
  final _ano = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Adicionar Título"),
        ),
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

            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.all(24),
                child: ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      widget.onSave(
                        Titulo(ano: _ano.text, campeonato: _campeonato.text)
                      );
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.check),
                      Padding(
                        padding:  EdgeInsets.all(16.0),
                        child:  Text('Salvar', style: TextStyle(fontSize: 20),),
                      )
                    ],
                  ),
                ),
              )
            )
          ],
        )
      ),
    );
  }
}
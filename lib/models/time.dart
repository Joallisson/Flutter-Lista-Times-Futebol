import 'package:flutter/material.dart';
import 'package:flutter_aula1/models/titulo.dart';

class Time{
  String nome;
  String brasao;
  int pontos;
  Color cor;
  late List<Titulo> titulos = [];

  Time({required this.brasao, required this.nome, required this.pontos, required this.cor});
}
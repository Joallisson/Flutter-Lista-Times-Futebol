//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_aula1/pages/home_page.dart';
import 'package:flutter_aula1/repositories/times_repositoriy.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TimesRepository(),
    child: const MeuAplicativo(),
  ));
}

class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Brasileirão",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: HomePage(),
    );
  }
}
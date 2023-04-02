import 'package:flutter_aula1/models/time.dart';
import 'package:flutter_aula1/models/titulo.dart';
import 'package:flutter_aula1/repositories/times_repositoriy.dart';

class HomeController {
  late TimesRepository timesRepository;

  List<Time> get tabela => timesRepository.times;

  HomeController(){
    timesRepository = TimesRepository();
  }

}

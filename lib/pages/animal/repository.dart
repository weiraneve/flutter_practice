import 'dart:math';

import 'package:flutter_practice/network/animal/animal_api.dart';
import 'package:get/get.dart';

import '../../network/animal/model/animal.dart';

class AnimalImageRepository {
  final AnimalApi _animalApi;

  AnimalImageRepository({AnimalApi? animalApi})
      : _animalApi = animalApi ?? Get.find();

  Future<List<Animal>> getCats() => _animalApi.getAnimals('cat');

  Future<List<Animal>> getDogs() => _animalApi.getAnimals('dog');

  Future<List<Animal>> getAnimals() =>
      Future.wait([getCats(), getDogs()]).then((value) {
        final list = [...value[0].sublist(1), ...value[1].sublist(1)];
        list.shuffle(Random());
        return list;
      });
}

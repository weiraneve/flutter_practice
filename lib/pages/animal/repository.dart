import 'dart:math';

import 'package:flutter_practice/network/animal/api.dart';
import 'package:get/get.dart';

import '../../network/animal/model/animal.dart';

class AnimalImageRepository {
  final AnimalApi _animalApi;

  AnimalImageRepository({AnimalApi? animalApi})
      : _animalApi = animalApi ?? Get.find();

  Future<List<Animal>> getCats() => _animalApi.getAnimals(_cat);

  Future<List<Animal>> getDogs() => _animalApi.getAnimals(_dog);

  Future<List<Animal>> getAnimals() =>
      Future.wait([getCats(), getDogs()]).then((value) {
        const redundantNum = 1;
        final list = [
          ...value[0].sublist(redundantNum),
          ...value[1].sublist(redundantNum)
        ];
        list.shuffle(Random());
        return list;
      });
}

const _cat = 'cat';
const _dog = 'dog';

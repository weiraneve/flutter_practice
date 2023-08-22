import 'package:get/get.dart';

import '../../component/async_loader/data_controller.dart';
import '../../network/animal/model/animal.dart';
import 'repository.dart';

class AnimalImageController extends DataController<List<Animal>> {
  final AnimalImageRepository _repository;

  AnimalImageController({AnimalImageRepository? animalImageRepository})
      : _repository = animalImageRepository ?? Get.find();

  @override
  Future<List<Animal>> fetch() async {
    final animals = await _repository.getAnimals();
    data = animals;
    return animals;
  }
}

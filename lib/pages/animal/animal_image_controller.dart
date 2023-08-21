import 'package:get/get.dart';

import '../../component/async_loader/data_controller.dart';
import '../../network/animal/model/animal.dart';
import '../../repository/animal_image_repository.dart';

class AnimalImageController extends DataController<List<Animal>> {
  final AnimalImageRepository _repository;

  AnimalImageController({AnimalImageRepository? animalImageRepository})
      : _repository = animalImageRepository ?? Get.find() {
    dataRx = Rx<List<Animal>>([]);
  }

  @override
  Future<List<Animal>> fetch() async {
    final animals = await _repository.getAnimals();
    dataRx.value = animals;
    return animals;
  }

  @override
  Future<void> refresh() async {
    await fetch();
  }
}

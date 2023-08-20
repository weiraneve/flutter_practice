import '../../common/async_loader/data_controller.dart';
import '../../network/animal/model/animal.dart';
import '../../repository/animal_image_repository.dart';

class AnimalImageController extends DataController<List<Animal>> {
  final AnimalImageRepository _repository;

  AnimalImageController({AnimalImageRepository? animalImageRepository})
      : _repository = animalImageRepository ?? AnimalImageRepository();

  @override
  Future<List<Animal>> fetch() => _repository.getAnimals();
}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'model/animal.dart';

part 'api.g.dart';

@RestApi()
abstract class AnimalApi {
  factory AnimalApi(Dio dio, {String baseUrl}) = _AnimalApi;

  @GET('https://api.the{animal}api.com/v1/images/search')
  Future<List<Animal>> getAnimals(
    @Path('animal') String animal, {
    @Query('limit') int limit = 20,
    @Query('page') int page = 1,
    @Query('order') String order = 'desc',
  });
}

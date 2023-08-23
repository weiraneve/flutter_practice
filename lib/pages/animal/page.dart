import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/component/async_loader/auto_load_controller.dart';
import 'package:get/get.dart';

import '../../component/async_loader/async_load_processor.dart';
import '../../component/base_scaffold.dart';
import '../../res/string/strings.dart';
import 'controller.dart';

class AnimalImagePage extends StatelessWidget {
  final AnimalImageController _controller;

  AnimalImagePage({super.key, AnimalImageController? animalImageController})
      : _controller = animalImageController ?? AnimalImageController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: stringRes(R.animalImagePageTitle),
      body: AsyncLoadProcessor(
        Get.put(AutoLoadController(_controller)),
        content: (data) => _animalImageContent(_controller),
      ),
    );
  }

  Widget _animalImageContent(AnimalImageController controller) {
    final animals = controller.data;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: animals.length,
      itemBuilder: (context, index) {
        final animal = animals[index];
        return CachedNetworkImage(
          imageUrl: animal.url ?? '',
          fit: BoxFit.cover,
        );
      },
    );
  }
}

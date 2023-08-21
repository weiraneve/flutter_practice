import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/async_loader/async_load_processor.dart';
import '../../common/async_loader/auto_load_controller.dart';
import '../../component/base_scaffold.dart';
import '../../res/string/strings.dart';
import 'animal_image_controller.dart';

class AnimalImagePage extends StatelessWidget {
  final AnimalImageController _controller;

  AnimalImagePage({super.key, AnimalImageController? animalImageController})
      : _controller = animalImageController ?? AnimalImageController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: stringRes(R.animalImagePageTitle),
      body: RefreshIndicator(
        onRefresh: _controller.refresh,
        child: AsyncLoadProcessor(
          Get.put(AutoLoadController(_controller)),
          content: (data) => _animalImageContent(_controller),
        ),
      ),
    );
  }

  Widget _animalImageContent(AnimalImageController controller) {
    return Obx(() {
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
    });
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'animal.g.dart';

@JsonSerializable()
class Animal {
  final String? id;
  final String? url;
  final int? width;
  final int? height;

  const Animal(
    this.id,
    this.url,
    this.width,
    this.height,
  );

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);

  Map<String, dynamic> toJson() => _$AnimalToJson(this);
}

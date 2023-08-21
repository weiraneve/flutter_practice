import 'package:json_annotation/json_annotation.dart';

part 'sender.g.dart';

@JsonSerializable()
class Sender {
  final String? username;
  final String? nick;
  final String? avatar;

  const Sender(
    this.username,
    this.nick,
    this.avatar,
  );

  factory Sender.fromJson(Map<String, dynamic> json) => _$SenderFromJson(json);

  Map<String, dynamic> toJson() => _$SenderToJson(this);
}

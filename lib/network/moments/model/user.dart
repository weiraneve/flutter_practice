import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? username;
  final String? nick;
  final String? avatar;
  @JsonKey(name: 'profile-image')
  final String? profileImage;

  const User(this.username, this.nick, this.avatar, this.profileImage);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

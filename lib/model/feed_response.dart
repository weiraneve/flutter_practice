import "package:json_annotation/json_annotation.dart";

part "feed_response.g.dart";

@JsonSerializable()
class FeedResponse {
  @JsonKey(name: 'errorCode')
  late int? errorCode;

  @JsonKey(name: 'errorMsg')
  late String? errorMsg;

  @JsonKey(name: 'data')
  late List<FeedModel> data;

  FeedResponse(this.errorCode, this.errorMsg, this.data);

  factory FeedResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeedResponseToJson(this);
}

@JsonSerializable()
class FeedModel {
  @JsonKey(name: "id")
  late int? id;

  @JsonKey(name: "link")
  late String? link;

  @JsonKey(name: "name")
  late String? name;

  @JsonKey(name: "order")
  late int? order;

  @JsonKey(name: "visible")
  late int? visible;

  FeedModel(this.id, this.link, this.name, this.order, this.visible);

  factory FeedModel.fromJson(Map<String, dynamic> json) =>
      _$FeedModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedModelToJson(this);
}

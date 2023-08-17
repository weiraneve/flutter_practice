class FeedListEntity {
  final int errorCode;
  final String? errorMsg;
  final List<FeedEntity> data;

  FeedListEntity({this.errorCode = -1, this.errorMsg, this.data = const []});

  factory FeedListEntity.fromJson(Map<String, dynamic> json) {
    return FeedListEntity(
      errorCode: json['errorCode'] ?? -1,
      errorMsg: json['errorMsg'],
      data: (json['data'] as List?)
              ?.map((item) => FeedEntity.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class FeedEntity {
  final String? id;
  final String? link;
  final String? name;
  final String? order;
  final String? visible;

  FeedEntity({this.id, this.link, this.name, this.order, this.visible});

  factory FeedEntity.fromJson(Map<String, dynamic> json) {
    return FeedEntity(
      id: json['id'].toString(),
      link: json['link'],
      name: json['name'],
      order: json['order'].toString(),
      visible: json['visible'].toString(),
    );
  }
}

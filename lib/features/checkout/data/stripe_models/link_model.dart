class LinkModel {
  dynamic persistentToken;

  LinkModel({
    this.persistentToken,
  });

  LinkModel.fromJson(dynamic json) {
    persistentToken = json['persistent_token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['persistent_token'] = persistentToken;
    return map;
  }
}

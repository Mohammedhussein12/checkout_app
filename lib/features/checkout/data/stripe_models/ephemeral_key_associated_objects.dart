class EphemeralKeyAssociatedObjects {
  String? id;
  String? type;

  EphemeralKeyAssociatedObjects({
    this.id,
    this.type,
  });

  EphemeralKeyAssociatedObjects.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    return map;
  }
}

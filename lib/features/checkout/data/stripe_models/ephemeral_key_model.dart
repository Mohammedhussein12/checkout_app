import 'package:checkout_app/features/checkout/data/stripe_models/ephemeral_key_associated_objects.dart';

class EphemeralKeyModel {
  String? id;
  String? object;
  List<EphemeralKeyAssociatedObjects>? associatedObjects;
  num? created;
  num? expires;
  bool? liveMode;
  String? secret;

  EphemeralKeyModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.liveMode,
    this.secret,
  });

  EphemeralKeyModel.fromJson(dynamic json) {
    id = json['id'];
    object = json['object'];
    if (json['associated_objects'] != null) {
      associatedObjects = [];
      json['associated_objects'].forEach((v) {
        associatedObjects?.add(EphemeralKeyAssociatedObjects.fromJson(v));
      });
    }
    created = json['created'];
    expires = json['expires'];
    liveMode = json['livemode'];
    secret = json['secret'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['object'] = object;
    if (associatedObjects != null) {
      map['associated_objects'] = associatedObjects
          ?.map((v) => v.toJson())
          .toList();
    }
    map['created'] = created;
    map['expires'] = expires;
    map['livemode'] = liveMode;
    map['secret'] = secret;
    return map;
  }
}

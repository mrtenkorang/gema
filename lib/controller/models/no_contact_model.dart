class NoContactModel {
  int? id;
  String polygonID;
  String userID;
  int isNoContact;
  int status;

  NoContactModel({
    this.id,
    required this.polygonID,
    required this.userID,
    this.isNoContact = 1,
    required this.status,
  });

  factory NoContactModel.fromJson(Map<String, dynamic> json) => NoContactModel(
    id: json['id'],
    userID: json['user_id'],
    polygonID: json['polygon_id'],
    isNoContact: json['is_no_contact'] ?? 1,
    status: json['status'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userID,
    'polygon_id': polygonID,
    'is_no_contact': isNoContact,
    'status': status,
  };
}

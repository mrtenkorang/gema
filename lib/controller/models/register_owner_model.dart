class RegisterOwnerModel {
  String title;
  String location;
  String propertyType;
  String propertyState;
  String rooms;
  String occupier;
  String propertyDetails;
  String communicationMethod;
  String paymentMethod;

  String ownerName;
  String contactNumber;
  String ghanaCardNumber;
  String email;
  String gpsLocation;
  String streetName;

  String? otherTitle;
  String? otherLocation;
  String? otherPropertyType;
  String? otherOccupier;
  String agentID;
  String polygonID;
  int? status;

  RegisterOwnerModel({
    required this.title,
    required this.agentID,
    required this.polygonID,
    required this.location,
    required this.streetName,
    required this.propertyType,
    required this.propertyState,
    required this.rooms,
    required this.occupier,
    required this.propertyDetails,
    required this.communicationMethod,
    required this.paymentMethod,
    required this.ownerName,
    required this.contactNumber,
    required this.ghanaCardNumber,
    required this.email,
    required this.gpsLocation,
    this.otherTitle,
    this.otherLocation,
    this.otherPropertyType,
    this.otherOccupier,
    this.status
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "location": location,
      "property_type": propertyType,
      "property_state": propertyState,
      "rooms": rooms,
      "occupier": occupier,
      "property_details": propertyDetails,
      "communication_method": communicationMethod,
      "payment_method": paymentMethod,
      "owner_name": ownerName,
      "contact_number": contactNumber,
      "ghana_card_number": ghanaCardNumber,
      "email": email,
      "gps_location": gpsLocation,
      "street_name": streetName,
      "agent_id": agentID,
      "polygon_id": polygonID,
      "status": status
    };
  }

  factory RegisterOwnerModel.fromJson(Map<String, dynamic> json) {
    return RegisterOwnerModel(
      title: json["title"] ?? "",
      agentID: json["agent_id"] ?? "",
      location: json["location"] ?? "",
      propertyType: json["property_type"] ?? "",
      propertyState: json["property_state"] ?? "",
      rooms: json["rooms"] ?? "",
      occupier: json["occupier"] ?? "",
      propertyDetails: json["property_details"] ?? "",
      communicationMethod: json["communication_method"] ?? "",
      paymentMethod: json["payment_method"] ?? "",
      ownerName: json["owner_name"] ?? "",
      contactNumber: json["contact_number"] ?? "",
      ghanaCardNumber: json["ghana_card_number"] ?? "",
      email: json["email"] ?? "",
      streetName: json["street_name"] ?? "",
      polygonID: json["polygon_id"] ?? "",
      gpsLocation: json["location_description"] ?? "",
      status: json["status"],
    );
  }
}
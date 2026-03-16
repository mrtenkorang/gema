class RegisterPocModel {
  int? id;
  String title;
  String location;
  String propertyType;
  String propertyState;
  String rooms;
  String relationship;
  String propertyDetails;
  String communicationMethod;
  String paymentMethod;

  String ownerName;
  String contactNumber;
  String ghanaCardNumber;
  String email;
  String gpsLocation;
  String streetName;

  String agentID;
  String polygonID;
  int? status;

  RegisterPocModel({
    this.id,
    required this.title,
    required this.agentID,
    required this.polygonID,
    required this.location,
    required this.streetName,
    required this.propertyType,
    required this.propertyState,
    required this.rooms,
    required this.relationship,
    required this.propertyDetails,
    required this.communicationMethod,
    required this.paymentMethod,
    required this.ownerName,
    required this.contactNumber,
    required this.ghanaCardNumber,
    required this.email,
    required this.gpsLocation,
    this.status
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "location": location,
      "property_type": propertyType,
      "property_state": propertyState,
      "rooms": rooms,
      "relationship": relationship,
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

  factory RegisterPocModel.fromJson(Map<String, dynamic> json) {
    return RegisterPocModel(
      id: json["id"],
      title: json["title"] ?? "",
      agentID: json["agent_id"] ?? "",
      location: json["location"] ?? "",
      propertyType: json["property_type"] ?? "",
      propertyState: json["property_state"] ?? "",
      rooms: json["rooms"].toString(),
      relationship: json["relationship"] ?? "",
      propertyDetails: json["property_details"] ?? "",
      communicationMethod: json["communication_method"] ?? "",
      paymentMethod: json["payment_method"] ?? "",
      ownerName: json["owner_name"] ?? "",
      contactNumber: json["contact_number"] ?? "",
      ghanaCardNumber: json["ghana_card_number"] ?? "",
      email: json["email"] ?? "",
      streetName: json["street_name"] ?? "",
      polygonID: json["polygon_id"] ?? "",
      gpsLocation: json["gps_location"] ?? "",
      status: json["status"],
    );
  }


  bool allFieldsPopulated() {
    return title.isNotEmpty &&
        location.isNotEmpty &&
        propertyType.isNotEmpty &&
        propertyState.isNotEmpty &&
        rooms.isNotEmpty &&
        relationship.isNotEmpty &&
        propertyDetails.isNotEmpty &&
        communicationMethod.isNotEmpty &&
        paymentMethod.isNotEmpty &&
        ownerName.isNotEmpty &&
        contactNumber.isNotEmpty &&
        ghanaCardNumber.isNotEmpty &&
        email.isNotEmpty &&
        streetName.isNotEmpty &&
        polygonID.isNotEmpty &&
        gpsLocation.isNotEmpty;
  }
}
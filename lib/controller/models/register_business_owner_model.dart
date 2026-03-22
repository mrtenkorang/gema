class RegisterBusinessOwnerModel {
  int? id;
  // Page 1 - Owner Info
  final String title;
  final String ownerOfStructure;
  final String ownerName;
  final String contactNumber;
  final String tinGhanaCard;
  final String email;
  final String age;
  final String gender;

  // Page 2 - Business Info
  final String businessName;
  final String businessType;
  final String natureOfBusiness;
  final String businessCategory;
  final String businessStructure;
  final String location;
  final String landmark;
  final String gpsAddressHouseNumber;

  // Page 3 - Payment Info
  // final String amountPayable;
  final String permitNo;
  final String previousArrears;
  // final String totalAmountDue;
  final String preferredMessagingMethod;
  final String preferredPaymentMethod;

  final String polygonID;
  final String agentID;
  final String status;

  RegisterBusinessOwnerModel({
    this.id,
    // Page 1
    required this.title,
    required this.ownerOfStructure,
    required this.ownerName,
    required this.contactNumber,
    required this.tinGhanaCard,
    required this.email,
    required this.age,
    required this.gender,
    required this.polygonID,
    required this.agentID,
    required this.status,

    // Page 2
    required this.businessName,
    required this.businessType,
    required this.natureOfBusiness,
    required this.businessCategory,
    required this.businessStructure,
    required this.location,
    required this.landmark,
    required this.gpsAddressHouseNumber,

    // Page 3
    // required this.amountPayable,
    required this.permitNo,
    required this.previousArrears,
    // required this.totalAmountDue,
    required this.preferredMessagingMethod,
    required this.preferredPaymentMethod,
  });

  factory RegisterBusinessOwnerModel.fromJson(Map<String, dynamic> json) {
    return RegisterBusinessOwnerModel(
      id:                       json['id'] ?? null,
      // Page 1
      title:                    json['title'] ?? '',
      ownerOfStructure:         json['owner_of_structure'] ?? '',
      ownerName:                json['owner_name'] ?? '',
      contactNumber:            json['contact_number'] ?? '',
      tinGhanaCard:             json['tin_ghana_card'] ?? '',
      email:                    json['email'] ?? '',
      age:                      json['age'] ?? '',
      gender:                   json['gender'] ?? '',
      polygonID:                json['polygon_id'] ?? '',
      agentID:                  json['agent_id'] ?? '',
      status:                   json['status'].toString(),

      // Page 2
      businessName:             json['business_name'] ?? '',
      businessType:             json['business_type'] ?? '',
      natureOfBusiness:         json['nature_of_business'] ?? '',
      businessCategory:         json['business_category'] ?? '',
      businessStructure:        json['business_structure'] ?? '',
      location:                 json['location'] ?? '',
      landmark:                 json['landmark'] ?? '',
      gpsAddressHouseNumber:    json['gps_address_house_number'] ?? '',

      // Page 3
      // amountPayable:            json['amount_payable'] ?? '',
      permitNo:                 json['permit_no'] ?? '',
      previousArrears:          json['previous_arrears'] ?? '',
      // totalAmountDue:           json['total_amount_due'] ?? '',
      preferredMessagingMethod: json['preferred_messaging_method'] ?? '',
      preferredPaymentMethod:   json['preferred_payment_method'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':                         id,
      // Page 1
      'title':                      title,
      'owner_of_structure':         ownerOfStructure,
      'owner_name':                 ownerName,
      'contact_number':             contactNumber,
      'tin_ghana_card':             tinGhanaCard,
      'email':                      email,
      'age':                        age,
      'gender':                     gender,

      // Page 2
      'business_name':              businessName,
      'business_type':              businessType,
      'nature_of_business':         natureOfBusiness,
      'business_category':          businessCategory,
      'business_structure':         businessStructure,
      'location':                   location,
      'landmark':                   landmark,
      'gps_address_house_number':   gpsAddressHouseNumber,

      // Page 3
      // 'amount_payable':             amountPayable,
      'permit_no':                  permitNo,
      'previous_arrears':           previousArrears,
      // 'total_amount_due':           totalAmountDue,
      'preferred_messaging_method': preferredMessagingMethod,
      'preferred_payment_method':   preferredPaymentMethod,
      'polygon_id':                 polygonID,
      'agent_id':                   agentID,
      'status':                     status,
    };
  }

  bool allFieldsPopulated() {
    return title.isNotEmpty &&
        ownerOfStructure.isNotEmpty &&
        ownerName.isNotEmpty &&
        contactNumber.isNotEmpty &&
        tinGhanaCard.isNotEmpty &&
        email.isNotEmpty &&
        age.isNotEmpty &&
        gender.isNotEmpty &&
        businessName.isNotEmpty &&
        businessType.isNotEmpty &&
        natureOfBusiness.isNotEmpty &&
        businessCategory.isNotEmpty &&
        businessStructure.isNotEmpty &&
        location.isNotEmpty &&
        landmark.isNotEmpty &&
        gpsAddressHouseNumber.isNotEmpty &&
        // amountPayable.isNotEmpty &&
        permitNo.isNotEmpty &&
        previousArrears.isNotEmpty &&
        // totalAmountDue.isNotEmpty &&
        preferredMessagingMethod.isNotEmpty &&
        preferredPaymentMethod.isNotEmpty;
  }

  RegisterBusinessOwnerModel copyWith({
    // Page 1
    String? title,
    String? ownerOfStructure,
    String? ownerName,
    String? contactNumber,
    String? tinGhanaCard,
    String? email,
    String? age,
    String? gender,

    // Page 2
    String? businessName,
    String? businessType,
    String? natureOfBusiness,
    String? businessCategory,
    String? businessStructure,
    String? location,
    String? landmark,
    String? gpsAddressHouseNumber,

    // Page 3
    String? amountPayable,
    String? permitNo,
    String? previousArrears,
    String? totalAmountDue,
    String? preferredMessagingMethod,
    String? preferredPaymentMethod,
  }) {
    return RegisterBusinessOwnerModel(
      // Page 1
      title:                    title ?? this.title,
      ownerOfStructure:         ownerOfStructure ?? this.ownerOfStructure,
      ownerName:                ownerName ?? this.ownerName,
      contactNumber:            contactNumber ?? this.contactNumber,
      tinGhanaCard:             tinGhanaCard ?? this.tinGhanaCard,
      email:                    email ?? this.email,
      age:                      age ?? this.age,
      gender:                   gender ?? this.gender,
      polygonID:                polygonID,
      agentID:                  agentID ,
      status:                   status ,

      // Page 2
      businessName:             businessName ?? this.businessName,
      businessType:             businessType ?? this.businessType,
      natureOfBusiness:         natureOfBusiness ?? this.natureOfBusiness,
      businessCategory:         businessCategory ?? this.businessCategory,
      businessStructure:        businessStructure ?? this.businessStructure,
      location:                 location ?? this.location,
      landmark:                 landmark ?? this.landmark,
      gpsAddressHouseNumber:    gpsAddressHouseNumber ?? this.gpsAddressHouseNumber,

      // Page 3
      // amountPayable:            amountPayable ?? this.amountPayable,
      permitNo:                 permitNo ?? this.permitNo,
      previousArrears:          previousArrears ?? this.previousArrears,
      // totalAmountDue:           totalAmountDue ?? this.totalAmountDue,
      preferredMessagingMethod: preferredMessagingMethod ?? this.preferredMessagingMethod,
      preferredPaymentMethod:   preferredPaymentMethod ?? this.preferredPaymentMethod,
    );
  }
}
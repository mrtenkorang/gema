class TableHeads {
  /// Universal
  String id = "id";
  String status = "status";
  String agentID = "agent_id";
  String polygonID = "polygon_id";

  /// Owner and poc(point of contact) table heads
  String ownerInfoTableName = "owner_tbl";
  String title = "title";
  String location = "location";
  String propertyType = "property_type";
  String propertyState = "property_state";
  String rooms = "rooms";
  String occupier = "occupier";
  String propertyDetails = "property_details";
  String communicationMethod = "communication_method";
  String paymentMethod = "payment_method";
  String ownerName = "owner_name";
  String contactNumber = "contact_number";
  String ghanaCardNumber = "ghana_card_number";
  String email = "email";
  String gpsLocation = "gps_location";
  String streetName = "street_name";

  /// POC (Point of Contact) table heads
  String pocInfoTableName = "poc_tbl";
  String relationship = "relationship";

  /// Pass Property table heads
  String passPropertyTableName = "pass_property_tbl";
  String reason = "reason";
  String notes = "notes";

  /// No Contact table heads
  String noContactTableName = "no_contact_tbl";
  String isNoContact = "is_no_contact";

  //=============================================================

  /// Business
  // Page 1 - Owner Info
  String businessOwnerInfoTableName = "business_owner_tbl";
  //   String title = "title";
  String ownerOfStructure = "owner_of_structure";
  //   String ownerName = "owner_name";
  //   String contactNumber = "contact_number";
  String tinGhanaCard = "tin_ghana_card";
  //   String email = "email";
  String age = "age";
  String gender = "gender";

  // Page 2 - Business Info
  String businessName = "business_name";
  String businessType = "business_type";
  String natureOfBusiness = "nature_of_business";
  String businessCategory = "business_category";
  String businessStructure = "business_structure";
  //   String location = "location";
  String landmark = "landmark";
  String gpsAddressHouseNumber = "gps_address_house_number";

  // Page 3 - Payment Info
  //   String amountPayable = "amount_payable";
  String permitNo = "permit_no";
  String previousArrears = "previous_arrears";
  //   String totalAmountDue = "total_amount_due";
  String preferredMessagingMethod = "preferred_messaging_method";
  String preferredPaymentMethod = "preferred_payment_method";
}

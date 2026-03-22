import 'package:flutter/material.dart';
import 'package:gema/controller/constants/constants.dart';
import 'package:gema/controller/db/queries.dart';
import 'package:gema/controller/models/no_contact_model.dart';
import 'package:gema/controller/models/pass_property_model.dart';
import 'package:gema/controller/models/register_business_owner_model.dart';
import 'package:gema/controller/models/register_owner_model.dart';
import 'package:gema/controller/models/register_poc_model.dart';
import 'package:gema/view/shared/widgets/globals.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  BuildContext? registerOwnerScreenContext;
  BuildContext? registerInitScreenContext;
  BuildContext? registerPOCScreenContext;
  BuildContext? passPropertyScreenContext;
  BuildContext? registerBusinessOwnerScreenContext;

  final constants = Constants();
  final query = Queries();

  RegisterOwnerModel? ownerInfo;
  RegisterPocModel? pocInfo;
  PassPropertyModel? passPropertyInfo;
  RegisterBusinessOwnerModel? businessOwnerInfo;

  RxList<String> businesses = <String>[].obs;
  RxList<String> titles = <String>[
    "Dr.",
    "Mr.",
    "Mrs.",
    "Prof",
    "Master",
    "Miss",
    "Others",
  ].obs;

  RxList<String> gender = <String>["Male", "Female"].obs;

  RxList<String> passPropertyReasons = <String>[
    "Owner lives abroad",
    "Property locked",
    "Tenant refused info",
    "Owner deceased",
    "Other",
  ].obs;

  RxList<String> relationShips = <String>[
    "Tenant",
    "Security",
    "Relative",
    "Neighbor",
    "Employee",
    "Other",
  ].obs;

  RxList<String> propertyTypes = <String>[
    "Residential",
    "Commercial",
    "Mixed Use",
    "School",
    "Others",
  ].obs;
  RxList<String> propertyStates = <String>[
    "Completed",
    "Uncompleted",
    "Under-Construction",
    "Vacant Plot",
  ].obs;

  RxList<String> propertyDetails = <String>[
    "Ground Bldg",
    "1 Story",
    "2 Story",
    "3 Story",
    "4 Story",
    "5 Story",
  ].obs;
  RxList<String> rooms = <String>[
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ].obs;
  RxList<String> occupiers = <String>[
    "Owner",
    "Tenant",
    "Care Taker",
    "Others",
  ].obs;
  RxList<String> methodsOfCommunication = <String>[
    "Email",
    "SMS",
    "WhatsApp",
  ].obs;
  RxList<String> methodsOfPayment = <String>[
    "Bank Transfer",
    "Cash",
    "Mobile Money",
    "USSD",
  ].obs;
  RxList<String> businessNature = <String>[
    "Sole Proprietorship",
    "Partnership",
    "Limited Liability",
    "Other",
  ].obs;
  RxList<String> businessCategories = <String>[
    "CAT A",
    "CAT B",
    "CAT C",
    "CAT D",
  ].obs;
  RxList<String> businessStructures = <String>[
    "Block",
    "Container",
    "Kiosk",
    "Other",
  ].obs;
  RxList<String> locations = <String>[
    "Ashongman Estate",
    "Kwabenya",
    "Haatso",
    "Agbogba Cosway",
    "Dome",
    "Abokobi",
    "Sesemi",
    "West Legon",
    "Taifa",
    "Ashongman Village",
    "Akatsi Abor",
    "Haatso Boshe",
    "Others",
  ].obs;

  RxInt pageNumber = 1.obs;
  RxInt totalPageNumber = 3.obs;

  RxString selectedTitle = "".obs;
  RxString selectedLocation = "".obs;
  RxString selectedPropertyType = "".obs;
  RxString selectedPropertyState = "".obs;
  RxString selectedRoom = "".obs;
  RxString selectedOccupier = "".obs;
  RxString selectedPropertyDetails = "".obs;
  RxString selectedMethodOfCommunication = "".obs;
  RxString selectedMethodOfPayment = "".obs;
  RxString selectedPocRelationship = "".obs;
  RxString selectedPassPropertyReason = "".obs;

  TextEditingController ownerNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController ghanaCardController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // TextEditingController locationController = TextEditingController();
  TextEditingController gpsLocationController = TextEditingController();
  TextEditingController streetNameController = TextEditingController();
  //these fields may be optional - depends
  TextEditingController otherTitleController = TextEditingController();
  TextEditingController otherLocationController = TextEditingController();
  TextEditingController otherPropertyTypeController = TextEditingController();
  TextEditingController otherPassPropertyReasonController =
      TextEditingController();
  TextEditingController otherOccupierController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController otherPocRelationshipController =
      TextEditingController();

  /// Controllers for Business Owner
  RxString selectedGenderBusinessOwner = "".obs;
  RxString selectedBusinessNature = "".obs;
  RxString selectedBusinessCategory = "".obs;
  RxString selectedBusinessStructure = "".obs;

  TextEditingController ageControllerBusinessOwner = TextEditingController();
  TextEditingController ownerOfStructureBusinessOwnerController =
      TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessTypeController = TextEditingController();
  TextEditingController businessStructureController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController permitNumberController = TextEditingController();
  TextEditingController previousArrearsController = TextEditingController();

  // these fields may be optional - depends
  TextEditingController otherBusinessNatureController = TextEditingController();
  TextEditingController otherBusinessStructureController =
      TextEditingController();

  void initOwnerFields() {
    ownerNameController.text = ownerInfo!.ownerName;
    contactNumberController.text = ownerInfo!.contactNumber;
    ghanaCardController.text = ownerInfo!.ghanaCardNumber;
    emailController.text = ownerInfo!.ghanaCardNumber;
    gpsLocationController.text = ownerInfo!.gpsLocation;
    streetNameController.text = ownerInfo!.streetName;
    selectedMethodOfPayment.value = ownerInfo!.paymentMethod;
    selectedPropertyDetails.value = ownerInfo!.propertyDetails;
    selectedRoom.value = ownerInfo!.rooms;
    selectedMethodOfCommunication.value = ownerInfo!.communicationMethod;
    selectedPropertyState.value = ownerInfo!.propertyState;

    if (locations.contains(ownerInfo!.location)) {
      selectedLocation.value = ownerInfo!.location;
    } else {
      selectedLocation.value = "Others";
      otherLocationController.text = ownerInfo!.location;
    }

    if (titles.contains(ownerInfo!.title)) {
      selectedTitle.value = ownerInfo!.title;
    } else {
      selectedTitle.value = "Others";
      otherTitleController.text = ownerInfo!.title;
    }

    if (propertyTypes.contains(ownerInfo!.propertyType)) {
      selectedPropertyType.value = ownerInfo!.propertyType;
    } else {
      selectedPropertyType.value = "Others";
      otherPropertyTypeController.text = ownerInfo!.title;
    }

    if (occupiers.contains(ownerInfo!.occupier)) {
      selectedOccupier.value = ownerInfo!.occupier;
    } else {
      selectedOccupier.value = "Others";
      otherOccupierController.text = ownerInfo!.occupier;
    }
  }

  void initPocFields() {
    ownerNameController.text = pocInfo!.ownerName;
    contactNumberController.text = pocInfo!.contactNumber;
    ghanaCardController.text = pocInfo!.ghanaCardNumber;
    emailController.text = pocInfo!.ghanaCardNumber;
    gpsLocationController.text = pocInfo!.gpsLocation;
    streetNameController.text = pocInfo!.streetName;
    selectedMethodOfPayment.value = pocInfo!.paymentMethod;
    selectedPropertyDetails.value = pocInfo!.propertyDetails;
    selectedRoom.value = pocInfo!.rooms;
    selectedMethodOfCommunication.value = pocInfo!.communicationMethod;
    selectedPropertyState.value = pocInfo!.propertyState;

    if (locations.contains(pocInfo!.location)) {
      selectedLocation.value = pocInfo!.location;
    } else {
      selectedLocation.value = "Others";
      otherLocationController.text = pocInfo!.location;
    }

    if (titles.contains(pocInfo!.title)) {
      selectedTitle.value = pocInfo!.title;
    } else {
      selectedTitle.value = "Others";
      otherTitleController.text = pocInfo!.title;
    }

    if (propertyTypes.contains(pocInfo!.propertyType)) {
      selectedPropertyType.value = pocInfo!.propertyType;
    } else {
      selectedPropertyType.value = "Others";
      otherPropertyTypeController.text = pocInfo!.title;
    }

    if (relationShips.contains(pocInfo!.relationship)) {
      selectedOccupier.value = pocInfo!.relationship;
    } else {
      selectedOccupier.value = "Other";
      otherOccupierController.text = pocInfo!.relationship;
    }
  }

  void initPassPropertyFields() {
    notesController.text = passPropertyInfo!.notes!;
    if (passPropertyReasons.contains(passPropertyInfo!.reason)) {
      selectedPassPropertyReason.value = passPropertyInfo!.reason!;
    } else {
      selectedTitle.value = "Other";
      otherPassPropertyReasonController.text = passPropertyInfo!.reason!;
    }
  }

  RxList<RegisterOwnerModel> ownerDetails = <RegisterOwnerModel>[].obs;
  RxList<RegisterPocModel> pocDetails = <RegisterPocModel>[].obs;
  RxList<PassPropertyModel> passPropertyDetails = <PassPropertyModel>[].obs;
  RxList<NoContactModel> noContactDetails = <NoContactModel>[].obs;
  RxList<RegisterBusinessOwnerModel> businessOwnerDetails =
      <RegisterBusinessOwnerModel>[].obs;

  RxString polygonId = "".obs;

  void getOwnerDetails() async {
    debugPrint("THE POLYGON ID ::::::::::::: ${polygonId.value}");
    ownerDetails.value = await query.getOwnerInfoByPolygonId(polygonId.value);
  }

  void getBusinessOwnerDetails() async {
    debugPrint("THE POLYGON ID ::::::::::::: ${polygonId.value}");
    businessOwnerDetails.value = await query.getBusinessOwnerInfoByPolygonId(
      polygonId.value,
    );
  }

  // void deleteBusinessOwner() async {
  //   debugPrint("THE BUSINESS OWNER ::::::::::::: ${businessOwnerInfo!.toJson()}");
  //   await query.delete(businessOwnerInfo!.id!);
  //   getBusinessOwnerDetails();
  // }

  void getNoContactDetails() async {
    debugPrint("THE POLYGON ID ::::::::::::: ${polygonId.value}");
    noContactDetails.value = await query.getNoContactInfoByPolygonId(
      polygonId.value,
    );
  }

  void getPassPropertyDetails() async {
    debugPrint("THE POLYGON ID ::::::::::::: ${polygonId.value}");
    passPropertyDetails.value = await query.getPassPropertyInfoByPolygonId(
      polygonId.value,
    );
  }

  void getPocDetails() async {
    debugPrint("THE POLYGON ID ::::::::::::: ${polygonId.value}");
    pocDetails.value = await query.getPocInfoByPolygonId(polygonId.value);
  }

  Future<void> deleteOwner() async {
    debugPrint("THE OWNER ::::::::::::: ${ownerInfo!.toJson()}");
    await query.deleteOwnerInfo(ownerInfo!.id!);
    getOwnerDetails();
  }

  Future<void> deletePoc() async {
    debugPrint("THE POC ::::::::::::: ${pocInfo!.toJson()}");
    await query.deletePocInfo(pocInfo!.id!);
    getPocDetails();
  }

  Future<void> deletePassProperty() async {
    debugPrint("THE PASS PROPERTY ::::::::::::: ${passPropertyInfo!.toJson()}");
    await query.deletePassPropertyInfo(passPropertyInfo!.id!);
    getPassPropertyDetails();
  }

  void saveOwnerInfoOffline() async {
    final ownerModel = RegisterOwnerModel(
      agentID: "1",
      polygonID: polygonId.value,
      title: selectedTitle.value.isNotEmpty
          ? selectedTitle.value
          : otherTitleController.text,

      location: selectedLocation.value.isNotEmpty
          ? selectedLocation.value
          : otherLocationController.text,

      propertyType: selectedPropertyType.value.isNotEmpty
          ? selectedPropertyType.value
          : otherPropertyTypeController.text,

      propertyState: selectedPropertyState.value,

      rooms: selectedRoom.value,

      occupier: selectedOccupier.value.isNotEmpty
          ? selectedOccupier.value
          : otherOccupierController.text,

      propertyDetails: selectedPropertyDetails.value,

      communicationMethod: selectedMethodOfCommunication.value,

      paymentMethod: selectedMethodOfPayment.value,

      ownerName: ownerNameController.text,

      contactNumber: contactNumberController.text,

      ghanaCardNumber: ghanaCardController.text,

      email: emailController.text,

      gpsLocation: gpsLocationController.text,
      streetName: streetNameController.text,
      status: constants.pendingStatus,
    );

    Map<String, dynamic> owner = ownerModel.toJson();

    debugPrint("THE OWNER DATA TO INSERT :::::::::::: $owner");
    int res;

    Globals.startLoading(registerOwnerScreenContext!);
    if (ownerInfo != null && ownerInfo!.allFieldsPopulated()) {
      ownerModel.id = ownerInfo!.id;
      res = await query.updateOwnerInfo(ownerModel);
    } else {
      res = await query.insertOwnerInfo(owner);
    }
    Globals.endLoading(registerOwnerScreenContext!);
    debugPrint("THE RESULT ::::::::: $res");

    if (res > 0) {
      Get.back();
      // Fetch saved records
      getOwnerDetails();
      Globals.showSnackBar(
        title: "Success",
        message: "Owner info saved successfully",
        backgroundColor: Theme.of(registerOwnerScreenContext!).primaryColor,
        textColor: Theme.of(registerOwnerScreenContext!).colorScheme.onPrimary,
      );
    } else {
      Globals.showSnackBar(
        title: "Failed",
        message: "An unknown error occurred, please try again later",
        backgroundColor: Theme.of(registerOwnerScreenContext!).primaryColor,
        textColor: Theme.of(registerOwnerScreenContext!).colorScheme.onPrimary,
      );
    }
  }

  void saveNoContactInfoOffline() async {
    final noContactModel = NoContactModel(
      userID: "1",
      polygonID: polygonId.value,
      isNoContact: 1,
      status: constants.pendingStatus,
    );

    Map<String, dynamic> noContact = noContactModel.toJson();

    debugPrint("THE OWNER DATA TO INSERT :::::::::::: $noContact");
    int res;

    Globals.startLoading(registerInitScreenContext!);
    res = await query.insertNoContactInfo(noContact);
    Globals.endLoading(registerInitScreenContext!);
    debugPrint("THE RESULT ::::::::: $res");

    if (res > 0) {
      // Get.back();
      // Fetch saved records
      getNoContactDetails();
      Globals.showSnackBar(
        title: "Success",
        message: "Owner info saved successfully",
        backgroundColor: Theme.of(registerInitScreenContext!).primaryColor,
        textColor: Theme.of(registerInitScreenContext!).colorScheme.onPrimary,
      );
    } else {
      Globals.showSnackBar(
        title: "Failed",
        message: "An unknown error occurred, please try again later",
        backgroundColor: Theme.of(registerInitScreenContext!).primaryColor,
        textColor: Theme.of(registerInitScreenContext!).colorScheme.onPrimary,
      );
    }
  }

  void savePocInfoOffline() async {
    final pocModel = RegisterPocModel(
      agentID: "1",
      polygonID: polygonId.value,
      title: selectedTitle.value.isNotEmpty
          ? selectedTitle.value
          : otherTitleController.text,

      location: selectedLocation.value.isNotEmpty
          ? selectedLocation.value
          : otherLocationController.text,

      propertyType: selectedPropertyType.value.isNotEmpty
          ? selectedPropertyType.value
          : otherPropertyTypeController.text,

      propertyState: selectedPropertyState.value,

      rooms: selectedRoom.value,

      propertyDetails: selectedPropertyDetails.value,

      communicationMethod: selectedMethodOfCommunication.value,

      paymentMethod: selectedMethodOfPayment.value,

      ownerName: ownerNameController.text,

      contactNumber: contactNumberController.text,

      ghanaCardNumber: ghanaCardController.text,

      email: emailController.text,

      gpsLocation: gpsLocationController.text,
      streetName: streetNameController.text,
      status: constants.pendingStatus,
      relationship: selectedPocRelationship.value.isNotEmpty
          ? selectedPocRelationship.value
          : otherPocRelationshipController.text,
    );

    Map<String, dynamic> poc = pocModel.toJson();

    debugPrint("THE POC DATA TO INSERT :::::::::::: $poc");
    int res;

    Globals.startLoading(registerPOCScreenContext!);
    if (pocInfo != null && pocInfo!.allFieldsPopulated()) {
      pocModel.id = pocInfo!.id;
      res = await query.updatePocInfo(pocModel);
    } else {
      res = await query.insertPocInfo(poc);
    }
    Globals.endLoading(registerPOCScreenContext!);
    debugPrint("THE RESULT ::::::::: $res");

    if (res > 0) {
      Get.back();
      // Fetch saved records
      getPocDetails();
      Globals.showSnackBar(
        title: "Success",
        message: "Poc info saved successfully",
        backgroundColor: Theme.of(registerOwnerScreenContext!).primaryColor,
        textColor: Theme.of(registerOwnerScreenContext!).colorScheme.onPrimary,
      );
    } else {
      Globals.showSnackBar(
        title: "Failed",
        message: "An unknown error occurred, please try again later",
        backgroundColor: Theme.of(registerOwnerScreenContext!).primaryColor,
        textColor: Theme.of(registerOwnerScreenContext!).colorScheme.onPrimary,
      );
    }
  }

  void savePassPropertyInfoOffline() async {
    final passPropertyModel = PassPropertyModel(
      agentID: "1",
      polygonID: polygonId.value,
      reason: selectedPassPropertyReason.value,
      notes: notesController.text,
      status: constants.pendingStatus,
    );

    Map<String, dynamic> poc = passPropertyModel.toJson();

    debugPrint("THE POC DATA TO INSERT :::::::::::: $poc");
    int res;

    Globals.startLoading(passPropertyScreenContext!);
    if (passPropertyInfo != null && passPropertyInfo!.allFieldsPopulated()) {
      passPropertyModel.id = passPropertyInfo!.id;
      res = await query.updatePassPropertyInfo(passPropertyModel);
    } else {
      res = await query.insertPassPropertyInfo(poc);
    }
    Globals.endLoading(passPropertyScreenContext!);
    debugPrint("THE RESULT ::::::::: $res");

    if (res > 0) {
      Get.back();
      // Fetch saved records
      getPassPropertyDetails();
      Globals.showSnackBar(
        title: "Success",
        message: "Pass property info saved successfully",
        backgroundColor: Theme.of(registerOwnerScreenContext!).primaryColor,
        textColor: Theme.of(registerOwnerScreenContext!).colorScheme.onPrimary,
      );
    } else {
      Globals.showSnackBar(
        title: "Failed",
        message: "An unknown error occurred, please try again later",
        backgroundColor: Theme.of(registerOwnerScreenContext!).primaryColor,
        textColor: Theme.of(registerOwnerScreenContext!).colorScheme.onPrimary,
      );
    }
  }

  void saveBusinessOwnerOffline() async {
    final businessOwnerModel = RegisterBusinessOwnerModel(
      title: selectedTitle.value,
      ownerOfStructure: selectedBusinessStructure.value,
      ownerName: businessNameController.text,
      contactNumber: contactNumberController.text,
      tinGhanaCard: ghanaCardController.text,
      email: emailController.text,
      age: ageControllerBusinessOwner.text,
      gender: selectedGenderBusinessOwner.value,
      polygonID: polygonId.value,
      agentID: "1",
      status: constants.pendingStatus.toString(),
      businessName: businessNameController.text,
      businessType: businessTypeController.text,
      natureOfBusiness: selectedBusinessNature.value.isNotEmpty
          ? selectedBusinessNature.value
          : otherBusinessNatureController.text,
      businessCategory: selectedBusinessCategory.value,
      businessStructure: selectedBusinessStructure.value,
      location: locationController.text,
      landmark: landmarkController.text,
      gpsAddressHouseNumber: gpsLocationController.text,
      permitNo: permitNumberController.text,
      previousArrears: previousArrearsController.text,
      preferredMessagingMethod: selectedMethodOfCommunication.value,
      preferredPaymentMethod: selectedMethodOfPayment.value,
    );

    final Map<String, dynamic> businessOwner = businessOwnerModel.toJson();

    debugPrint("THE POC DATA TO INSERT :::::::::::: $businessOwner");
    int res;

    Globals.startLoading(registerBusinessOwnerScreenContext!);
    if (businessOwnerInfo != null && businessOwnerInfo!.id!.toString().isNotEmpty) {
      businessOwnerModel.id = passPropertyInfo!.id;
      res = await query.updateBusinessOwnerInfo(businessOwnerModel);
    } else {
      res = await query.insertBusinessOwnerInfo(businessOwner);
    }
    Globals.endLoading(registerBusinessOwnerScreenContext!);
    debugPrint("THE RESULT ::::::::: $res");

    if (res > 0) {
      Get.back();
      // Fetch saved records
      getBusinessOwnerDetails();
      Globals.showSnackBar(
        title: "Success",
        message: "Business Owner info saved successfully",
        backgroundColor: Theme.of(registerBusinessOwnerScreenContext!).primaryColor,
        textColor: Theme.of(registerBusinessOwnerScreenContext!).colorScheme.onPrimary,
      );
    } else {
      Globals.showSnackBar(
        title: "Failed",
        message: "An unknown error occurred, please try again later",
        backgroundColor: Theme.of(registerBusinessOwnerScreenContext!).primaryColor,
        textColor: Theme.of(registerBusinessOwnerScreenContext!).colorScheme.onPrimary,
      );
    }

  }

  void submitOwnerInfo() async {
    final ownerModel = RegisterOwnerModel(
      agentID: "1",
      polygonID: "1",
      title: selectedTitle.value.isNotEmpty
          ? selectedTitle.value
          : otherTitleController.text,

      location: selectedLocation.value.isNotEmpty
          ? selectedLocation.value
          : otherLocationController.text,

      propertyType: selectedPropertyType.value.isNotEmpty
          ? selectedPropertyType.value
          : otherPropertyTypeController.text,

      propertyState: selectedPropertyState.value,

      rooms: selectedRoom.value,

      occupier: selectedOccupier.value.isNotEmpty
          ? selectedOccupier.value
          : otherOccupierController.text,

      propertyDetails: selectedPropertyDetails.value,

      communicationMethod: selectedMethodOfCommunication.value,

      paymentMethod: selectedMethodOfPayment.value,

      ownerName: ownerNameController.text,

      contactNumber: contactNumberController.text,

      ghanaCardNumber: ghanaCardController.text,


      email: emailController.text,

      gpsLocation: gpsLocationController.text,
      streetName: streetNameController.text,
      status: constants.submittedStatus,
    );

    Map<String, dynamic> ownerInfo = ownerModel.toJson();
  }
}

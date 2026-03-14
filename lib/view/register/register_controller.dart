import 'package:flutter/material.dart';
import 'package:gema/controller/constants/constants.dart';
import 'package:gema/controller/db/queries.dart';
import 'package:gema/controller/models/register_owner_model.dart';
import 'package:gema/view/shared/widgets/globals.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  BuildContext? registerOwnerScreenContext;

  final constants = Constants();
  final query = Queries();

  RegisterOwnerModel? ownerInfo;

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
  TextEditingController otherOccupierController = TextEditingController();

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

  RxList<RegisterOwnerModel> ownerDetails = <RegisterOwnerModel>[].obs;

  RxString polygonId = "".obs;

  void getOwnerDetails() async {
    ownerDetails.value = await query.getOwnerInfoByPolygonId(polygonId.value);
  }

  Future<void> deleteOwner() async {
    debugPrint("THE OWNER ::::::::::::: ${ownerInfo!.toJson()}");
    await query.deleteOwnerInfo(ownerInfo!.id!);
    getOwnerDetails();
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
    if (ownerInfo!.allFieldsPopulated()) {
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

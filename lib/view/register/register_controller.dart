import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  BuildContext? registerOwnerScreenContext;


  RxList<String> businesses = <String>[].obs;
  RxList<String> titles = <String>[
    "Dr.", "Mr.", "Mrs.", "Prof", "Master", "Miss", "Others"
  ].obs;
  RxList<String> propertyTypes = <String>[
    "Residential", "Commercial", "Mixed Use", "School", "Others"
  ].obs;
  RxList<String> propertyStates = <String>[
    "Completed", "Uncompleted", "Under-Construction", "Vacant Plot"
  ].obs;

  RxList<String> propertyDetails = <String>[
    "Ground Bldg", "1 Story", "2 Story", "3 Story", "4 Story", "5 Story"
  ].obs;
  RxList<String> rooms = <String>[
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"
  ].obs;
  RxList<String> occupiers = <String>[
    "Owner", "Tenant", "Care Taker", "Other"
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

  RxInt pageNumber = 0.obs;

  RxString selectedTitle = "".obs;
  RxString selectedLocation = "".obs;
  RxString selectedPropertyType = "".obs;
  RxString selectedPropertyState = "".obs;
  RxString selectedRoom = "".obs;
  RxString selectedOccupier = "".obs;
  RxString selectedPropertyDetails = "".obs;

  TextEditingController ownerNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController ghanaCardController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  //these fields may be optional - depends
  TextEditingController otherTitleController = TextEditingController();
  TextEditingController otherLocationController = TextEditingController();
  TextEditingController otherPropertyTypeController = TextEditingController();
  TextEditingController otherOccupierController = TextEditingController();



}
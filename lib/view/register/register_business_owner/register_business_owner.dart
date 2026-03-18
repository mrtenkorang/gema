import 'package:flutter/material.dart';
import 'package:gema/controller/models/register_owner_model.dart';
import 'package:gema/view/register/register_controller.dart';
import 'package:gema/view/shared/widgets/button.dart';
import 'package:gema/view/shared/widgets/choice_chip.dart';
import 'package:gema/view/shared/widgets/textfield.dart';
import 'package:get/get.dart';

class RegisterBusinessOwnerScreen extends StatefulWidget {
  const RegisterBusinessOwnerScreen({super.key, this.ownerInfo});
  final RegisterOwnerModel? ownerInfo;

  @override
  State<RegisterBusinessOwnerScreen> createState() => _RegisterBusinessOwnerScreenState();
}

class _RegisterBusinessOwnerScreenState extends State<RegisterBusinessOwnerScreen> {
  final registerController = Get.put(RegisterController());
  @override
  void initState() {
    super.initState();
    if (widget.ownerInfo != null &&widget.ownerInfo!.allFieldsPopulated()) {
      // registerController.ownerInfo = widget.ownerInfo;
      // registerController.initOwnerFields();
    }
  }

  @override
  Widget build(BuildContext context) {
    registerController.registerOwnerScreenContext = context;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Business Owner"),
        actions: [
          Obx(
                () => Row(
              children: [
                Text(
                  "${registerController.pageNumber.value}",
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.surface,
                  ),
                ),
                Text(
                  " / ",
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.surface,
                  ),
                ),
                Text(
                  "${registerController.totalPageNumber.value}",
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.surface,
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Obx(
                    () => registerController.pageNumber.value == 1
                    ? SingleChildScrollView(  // FIX: added scroll for page 1
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getHeading(text: "Title"),

                      Obx(
                            () => Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            for (final title in registerController.titles)
                              AppChoiceChip(
                                onSelected: (selected) {
                                  registerController.selectedTitle.value =
                                  (selected ? title : null)!;
                                },
                                selected:
                                title ==
                                    registerController.selectedTitle.value,
                                label: title,
                              ),
                          ],
                        ),
                      ),

                      Obx(
                            () =>
                        registerController.selectedTitle.value
                            .toLowerCase() ==
                            "others".toLowerCase()
                            ? Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "Please specify title",
                              style: theme.textTheme.titleSmall,
                            ),
                            AppTextField(
                              controller: registerController
                                  .otherTitleController,
                            ),
                          ],
                        )
                            : Container(),
                      ),
                      SizedBox(height: 10),
                      getHeading(text: "Owner Of Structure"),
                      AppTextField(
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                        controller: registerController.ownerOfStructureBusinessOwnerController,
                      ),

                      SizedBox(height: 10),
                      getHeading(text: "Owner Name"),
                      AppTextField(
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                        controller: registerController.ownerNameController,
                      ),
                      SizedBox(height: 10),
                      getHeading(text: "Contact number"),
                      AppTextField(
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                        controller:
                        registerController.contactNumberController,
                      ),
                      SizedBox(height: 10),
                      getHeading(text: "TIN/Ghana card"),
                      AppTextField(
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                        controller: registerController.ghanaCardController,
                      ),
                      SizedBox(height: 10),
                      getHeading(text: "Email"),
                      AppTextField(
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                        controller: registerController.emailController,
                      ),
                      SizedBox(height: 10),

                      getHeading(text: "Age"),
                      AppTextField(
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                        controller: registerController.ageControllerBusinessOwner,
                      ),
                      SizedBox(height: 10),
                      getHeading(text: "Gender"),

                      Obx(
                            () => Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            for (final title in registerController.gender)
                              AppChoiceChip(
                                onSelected: (selected) {
                                  registerController.selectedGenderBusinessOwner.value =
                                  (selected ? title : null)!;
                                },
                                selected:
                                title ==
                                    registerController.selectedGenderBusinessOwner.value,
                                label: title,
                              ),
                          ],
                        ),
                      ),
                      // getHeading(text: "Validation Number"),
                      // getValidationNumber(),
                      SizedBox(height: 10),  // replaced Spacer() — not valid inside SingleChildScrollView
                    ],
                  ),
                )
                    : registerController.pageNumber.value == 2
                    ? SingleChildScrollView(  // FIX: added scroll for page 2
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      getHeading(text: "Business Name"),
                      AppTextField(
                        controller:
                        registerController.businessNameController,
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                      ),
                      SizedBox(height: 10),
                      getHeading(text: "Business Type"),
                      AppTextField(
                        controller: registerController.businessTypeController,
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                      ),



                      SizedBox(height: 10),
                      getHeading(text: "Nature Of Business"),
                      Obx(
                            () => Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            for (final loc in registerController.businessNature)
                              AppChoiceChip(
                                onSelected: (selected) {
                                  registerController
                                      .selectedBusinessNature
                                      .value = (selected
                                      ? loc
                                      : null)!;
                                },
                                selected:
                                loc ==
                                    registerController
                                        .selectedBusinessNature
                                        .value,
                                label: loc,
                              ),
                          ],
                        ),
                      ),

                      /// if others is selected
                      Obx(
                            () =>
                        registerController.selectedBusinessNature.value
                            .toLowerCase() ==
                            "other".toLowerCase()
                            ? Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "Please specify business nature",
                              style: theme.textTheme.titleSmall,
                            ),
                            AppTextField(
                              controller: registerController
                                  .otherBusinessNatureController,
                            ),
                          ],
                        )
                            : Container(),
                      ),

                      SizedBox(height: 10),
                      getHeading(text: "Business Category"),
                      Obx(
                            () => Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            for (final loc in registerController.businessCategories)
                              AppChoiceChip(
                                onSelected: (selected) {
                                  registerController
                                      .selectedBusinessCategory
                                      .value = (selected
                                      ? loc
                                      : null)!;
                                },
                                selected:
                                loc ==
                                    registerController
                                        .selectedBusinessCategory
                                        .value,
                                label: loc,
                              ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),
                      getHeading(text: "Business Structure"),
                      Obx(
                            () => Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            for (final loc in registerController.businessStructures)
                              AppChoiceChip(
                                onSelected: (selected) {
                                  registerController
                                      .selectedBusinessStructure
                                      .value = (selected
                                      ? loc
                                      : null)!;
                                },
                                selected:
                                loc ==
                                    registerController
                                        .selectedBusinessStructure
                                        .value,
                                label: loc,
                              ),
                          ],
                        ),
                      ),

                      /// if others is selected
                      Obx(
                            () =>
                        registerController.selectedBusinessStructure.value
                            .toLowerCase() ==
                            "other".toLowerCase()
                            ? Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              "Please specify business structure",
                              style: theme.textTheme.titleSmall,
                            ),
                            AppTextField(
                              controller: registerController
                                  .otherBusinessNatureController,
                            ),
                          ],
                        )
                            : Container(),
                      ),

                      SizedBox(height: 10),
                      getHeading(text: "Location"),
                      AppTextField(
                        controller: registerController.locationController,
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                      ),

                      SizedBox(height: 10),
                      getHeading(text: "Landmark"),
                      AppTextField(
                        controller: registerController.landmarkController,
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                      ),
                      SizedBox(height: 10),
                      getHeading(text: "GPS Address / House Number"),
                      AppTextField(
                        controller:
                        registerController.gpsLocationController,
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                      ),
                      SizedBox(height: 30),
                      // getHeading(text: "Location"),
                      // getValidationNumber(),
                      // SizedBox(height: 10),
                    ],
                  ),
                )
                    : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      getHeading(text: "Amount Payable(Rate Table)"),
                      getValidationNumber(
                        validationNumber: "GHC 190"
                      ),
                      SizedBox(height: 10),
                      getHeading(text: "Permit No."),
                      AppTextField(
                        hintText: "Enter if available",
                        controller:
                        registerController.permitNumberController,
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                      ),
                      SizedBox(height: 10,),

                      getHeading(text: "Previous arrears"),
                      AppTextField(
                        controller:
                        registerController.previousArrearsController,
                        validator: (v) {
                          return v!.isEmpty
                              ? "This field is required"
                              : null;
                        },
                      ),

                      SizedBox(height: 10),
                      getHeading(text: "Total Amount Due"),
                      getValidationNumber(
                          validationNumber: "GHC 190"
                      ),
                      SizedBox(height: 10),
                      getHeading(text: "Preferred Messaging Method"),
                      Obx(
                            () => Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            for (final loc
                            in registerController
                                .methodsOfCommunication)
                              AppChoiceChip(
                                onSelected: (selected) {
                                  registerController
                                      .selectedMethodOfCommunication
                                      .value = (selected
                                      ? loc
                                      : null)!;
                                },
                                selected:
                                loc ==
                                    registerController
                                        .selectedMethodOfCommunication
                                        .value,
                                label: loc,
                              ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),
                      getHeading(text: "Preferred Payment Method"),
                      Obx(
                            () => Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: [
                            for (final loc
                            in registerController.methodsOfPayment)
                              AppChoiceChip(
                                onSelected: (selected) {
                                  registerController
                                      .selectedMethodOfPayment
                                      .value = (selected
                                      ? loc
                                      : null)!;
                                },
                                selected:
                                loc ==
                                    registerController
                                        .selectedMethodOfPayment
                                        .value,
                                label: loc,
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    horizontalPadding: 10,
                    backgroundColor: theme.cardColor,
                    isFullWidth: false,
                    onTap: () {
                      if (registerController.pageNumber.value > 1) {
                        //Decrease page number to move to the previous page
                        registerController.pageNumber.value--;
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: theme.colorScheme.onSurface,
                        ),
                        Text(
                          "Prev",
                          style: theme.textTheme.titleSmall!.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    horizontalPadding: 10,
                    backgroundColor: theme.primaryColor,
                    isFullWidth: false,
                    onTap: () async {
                      if (registerController.pageNumber.value < 3) {
                        //Increase page number to move to the next page
                        registerController.pageNumber.value++;
                      } else {
                        registerController.saveOwnerInfoOffline();
                      }
                    },
                    child: Obx(
                          () => registerController.pageNumber.value < 3
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Next"),
                          SizedBox(width: 5),
                          Icon(Icons.arrow_forward),
                        ],
                      )
                          : Text("Save"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget getValidationNumber({String? validationNumber}) {
    final registerController = Get.put(RegisterController());
    final theme = Theme.of(registerController.registerOwnerScreenContext!);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.15),
        border: Border.all(color: theme.primaryColor),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Text(
            validationNumber?? "PS-122414",
            style: theme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Text(
            "AUTO",
            style: theme.textTheme.titleSmall!.copyWith(
              color: theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget getHeading({required String text}) {
    final registerController = Get.put(RegisterController());
    return Text(
      text,
      style: Theme.of(
        registerController.registerOwnerScreenContext!,
      ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  String validator(String value) {
    return value.isEmpty ? "This is a required field" : "";
  }
}
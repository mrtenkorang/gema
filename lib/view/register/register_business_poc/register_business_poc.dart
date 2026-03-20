import 'package:flutter/material.dart';
import 'package:gema/controller/models/register_poc_model.dart';
import 'package:gema/view/register/register_controller.dart';
import 'package:gema/view/shared/widgets/button.dart';
import 'package:gema/view/shared/widgets/choice_chip.dart';
import 'package:gema/view/shared/widgets/textfield.dart';
import 'package:get/get.dart';

class RegisterBusinessPocScreen extends StatefulWidget {
  const RegisterBusinessPocScreen({super.key, this.pocInfo});

  final RegisterPocModel? pocInfo;

  @override
  State<RegisterBusinessPocScreen> createState() => _RegisterBusinessPocScreenState();
}

class _RegisterBusinessPocScreenState extends State<RegisterBusinessPocScreen> {

  final registerController = Get.put(RegisterController());
  @override
  void initState() {
    super.initState();
    if (widget.pocInfo != null &&widget.pocInfo!.allFieldsPopulated()) {

    }
  }

  @override
  Widget build(BuildContext context) {
    registerController.registerPOCScreenContext = context;
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Register Business POC'),
        ),

        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10, right: 10),
          child: SingleChildScrollView(
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
                getHeading(text: "POC Name"),
                AppTextField(
                  validator: (v) {
                    return v!.isEmpty
                        ? "This field is required"
                        : null;
                  },
                  controller: registerController.ownerNameController,
                ),
                SizedBox(height: 10),
                getHeading(text: "POC contact number"),
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
                getHeading(text: "TIN/POC Ghana card number"),
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
                SizedBox(height: 10),
                getHeading(text: "Relationship"),

                Obx(
                      () => Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      for (final title in registerController.relationShips)
                        AppChoiceChip(
                          onSelected: (selected) {
                            registerController.selectedPocRelationship.value =
                            (selected ? title : null)!;
                          },
                          selected:
                          title ==
                              registerController.selectedPocRelationship.value,
                          label: title,
                        ),
                    ],
                  ),
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
                Obx(
                      () =>
                  registerController.selectedPocRelationship.value
                      .toLowerCase() ==
                      "other".toLowerCase()
                      ? Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text(
                        "Please specify relationship",
                        style: theme.textTheme.titleSmall,
                      ),
                      AppTextField(
                        controller: registerController
                            .otherPocRelationshipController,
                      ),
                    ],
                  )
                      : Container(),
                ),
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

                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        horizontalPadding: 10,
                        backgroundColor: theme.colorScheme.primary,
                        isFullWidth: false,
                        onTap: () async {
                          registerController.savePocInfoOffline();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.save_rounded,
                              color: theme.colorScheme.onPrimary,
                            ),
                            Text(
                              "Save",
                              style: theme.textTheme.titleSmall!.copyWith(
                                color: theme.colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        )
    );
  }

  Widget getHeading({required String text}) {
    final registerController = Get.put(RegisterController());
    return Text(
      text,
      style: Theme.of(
        registerController.registerPOCScreenContext!,
      ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  String validator(String value) {
    return value.isEmpty ? "This is a required field" : "";
  }
}

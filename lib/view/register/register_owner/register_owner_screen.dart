import 'package:flutter/material.dart';
import 'package:gema/controller/models/register_owner_model.dart';
import 'package:gema/view/register/register_controller.dart';
import 'package:gema/view/shared/widgets/button.dart';
import 'package:gema/view/shared/widgets/choice_chip.dart';
import 'package:gema/view/shared/widgets/textfield.dart';
import 'package:get/get.dart';

class RegisterOwnerScreen extends StatefulWidget {
  const RegisterOwnerScreen({super.key, this.ownerInfo});
  final RegisterOwnerModel? ownerInfo;

  @override
  State<RegisterOwnerScreen> createState() => _RegisterOwnerScreenState();
}

class _RegisterOwnerScreenState extends State<RegisterOwnerScreen> {
  final registerController = Get.put(RegisterController());
  @override
  void initState() {
    super.initState();
    if (widget.ownerInfo != null &&widget.ownerInfo!.allFieldsPopulated()) {
      registerController.ownerInfo = widget.ownerInfo;
      registerController.initOwnerFields();
    }
  }

  @override
  Widget build(BuildContext context) {
    registerController.registerOwnerScreenContext = context;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Owner"),
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
                    ? Column(
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
                          getHeading(text: "Ghana card"),
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
                          SizedBox(height: 30),
                          getHeading(text: "Validation Number"),
                          getValidationNumber(),
                          Spacer(),
                        ],
                      )
                    : registerController.pageNumber.value == 2
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getHeading(text: "Location"),
                          Obx(
                            () => Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                for (final loc in registerController.locations)
                                  AppChoiceChip(
                                    onSelected: (selected) {
                                      registerController
                                          .selectedLocation
                                          .value = (selected
                                          ? loc
                                          : null)!;
                                    },
                                    selected:
                                        loc ==
                                        registerController
                                            .selectedLocation
                                            .value,
                                    label: loc,
                                  ),
                              ],
                            ),
                          ),

                          /// if others is selected
                          Obx(
                            () =>
                                registerController.selectedLocation.value
                                        .toLowerCase() ==
                                    "others".toLowerCase()
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        "Please specify location",
                                        style: theme.textTheme.titleSmall,
                                      ),
                                      AppTextField(
                                        controller: registerController
                                            .otherLocationController,
                                      ),
                                    ],
                                  )
                                : Container(),
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
                          getHeading(text: "Street Name"),
                          AppTextField(
                            controller: registerController.streetNameController,
                            validator: (v) {
                              return v!.isEmpty
                                  ? "This field is required"
                                  : null;
                            },
                          ),
                          SizedBox(height: 30),
                          getHeading(text: "Validation Number"),
                          getValidationNumber(),
                        ],
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getHeading(text: "Property Type"),
                            Obx(
                              () => Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  for (final loc
                                      in registerController.propertyTypes)
                                    AppChoiceChip(
                                      onSelected: (selected) {
                                        registerController
                                            .selectedPropertyType
                                            .value = (selected
                                            ? loc
                                            : null)!;
                                      },
                                      selected:
                                          loc ==
                                          registerController
                                              .selectedPropertyType
                                              .value,
                                      label: loc,
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),

                            /// if others is selected
                            Obx(
                              () =>
                                  registerController.selectedPropertyType.value
                                          .toLowerCase() ==
                                      "others".toLowerCase()
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        Text(
                                          "Please specify property type",
                                          style: theme.textTheme.titleSmall,
                                        ),
                                        AppTextField(
                                          controller: registerController
                                              .otherPropertyTypeController,
                                        ),
                                      ],
                                    )
                                  : Container(),
                            ),

                            SizedBox(height: 10),
                            getHeading(text: "Property State"),
                            Obx(
                              () => Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  for (final loc
                                      in registerController.propertyStates)
                                    AppChoiceChip(
                                      onSelected: (selected) {
                                        registerController
                                            .selectedPropertyState
                                            .value = (selected
                                            ? loc
                                            : null)!;
                                      },
                                      selected:
                                          loc ==
                                          registerController
                                              .selectedPropertyState
                                              .value,
                                      label: loc,
                                    ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),
                            getHeading(text: "Property Details"),
                            Obx(
                              () => Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  for (final loc
                                      in registerController.propertyDetails)
                                    AppChoiceChip(
                                      onSelected: (selected) {
                                        registerController
                                            .selectedPropertyDetails
                                            .value = (selected
                                            ? loc
                                            : null)!;
                                      },
                                      selected:
                                          loc ==
                                          registerController
                                              .selectedPropertyDetails
                                              .value,
                                      label: loc,
                                    ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),
                            getHeading(text: "Rooms"),
                            Obx(
                              () => Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  for (final loc in registerController.rooms)
                                    AppChoiceChip(
                                      onSelected: (selected) {
                                        registerController.selectedRoom.value =
                                            (selected ? loc : null)!;
                                      },
                                      selected:
                                          loc ==
                                          registerController.selectedRoom.value,
                                      label: loc,
                                    ),
                                ],
                              ),
                            ),

                            SizedBox(height: 10),
                            getHeading(text: "Occupier"),
                            Obx(
                              () => Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: [
                                  for (final loc
                                      in registerController.occupiers)
                                    AppChoiceChip(
                                      onSelected: (selected) {
                                        registerController
                                            .selectedOccupier
                                            .value = (selected
                                            ? loc
                                            : null)!;
                                      },
                                      selected:
                                          loc ==
                                          registerController
                                              .selectedOccupier
                                              .value,
                                      label: loc,
                                    ),
                                ],
                              ),
                            ),

                            /// if others is selected
                            Obx(
                              () =>
                                  registerController.selectedOccupier.value
                                          .toLowerCase() ==
                                      "others".toLowerCase()
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        Text(
                                          "Please specify occupier",
                                          style: theme.textTheme.titleSmall,
                                        ),
                                        AppTextField(
                                          controller: registerController
                                              .otherOccupierController,
                                        ),
                                      ],
                                    )
                                  : Container(),
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

  Widget getValidationNumber() {
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
            "PS-122414",
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

import 'package:flutter/material.dart';
import 'package:gema/view/register/register_controller.dart';
import 'package:gema/view/shared/widgets/button.dart';
import 'package:gema/view/shared/widgets/choice_chip.dart';
import 'package:gema/view/shared/widgets/textfield.dart';
import 'package:get/get.dart';

class PassPropertyScreen extends StatefulWidget {
  const PassPropertyScreen({super.key});

  @override
  State<PassPropertyScreen> createState() => _PassPropertyScreenState();
}

class _PassPropertyScreenState extends State<PassPropertyScreen> {
  final registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    registerController.passPropertyScreenContext = context;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pass Property"),
      ),body: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getHeading(text: "Reason"),

            Obx(
                  () => Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  for (final title in registerController.passPropertyReasons)
                    AppChoiceChip(
                      onSelected: (selected) {
                        registerController.selectedPassPropertyReason.value =
                        (selected ? title : null)!;
                      },
                      selected:
                      title ==
                          registerController.selectedPassPropertyReason.value,
                      label: title,
                    ),
                ],
              ),
            ),

            Obx(
                  () =>
              registerController.selectedPassPropertyReason.value
                  .toLowerCase() ==
                  "other".toLowerCase()
                  ? Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Please specify reason",
                    style: theme.textTheme.titleSmall,
                  ),
                  AppTextField(
                    controller: registerController
                        .otherPassPropertyReasonController,
                  ),
                ],
              )
                  : Container(),
            ),
            SizedBox(height: 10),
            getHeading(text: "Notes"),
            AppTextField(
              controller: registerController.notesController,
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    horizontalPadding: 10,
                    backgroundColor: theme.colorScheme.primary,
                    isFullWidth: false,
                    onTap: () async {
                      registerController.savePassPropertyInfoOffline();
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
    );
  }

  Widget getHeading({required String text}) {
    final registerController = Get.put(RegisterController());
    return Text(
      text,
      style: Theme.of(
        registerController.passPropertyScreenContext!,
      ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  String validator(String value) {
    return value.isEmpty ? "This is a required field" : "";
  }
}

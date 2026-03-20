import 'package:flutter/material.dart';
import 'package:gema/controller/models/register_owner_model.dart';
import 'package:gema/controller/models/register_poc_model.dart';
import 'package:gema/view/register/pass/pass_property.dart';
import 'package:gema/view/register/register_business_owner/register_business_owner.dart';
import 'package:gema/view/register/register_business_poc/register_business_poc.dart';
import 'package:gema/view/register/register_controller.dart';
import 'package:gema/view/register/register_owner/register_owner_screen.dart';
import 'package:gema/view/register/register_poc/register_poc_screen.dart';
import 'package:gema/view/register/register_widgets/action_container.dart';
import 'package:get/get.dart';

class RegisterInitScreen extends StatefulWidget {
  const RegisterInitScreen({super.key});

  @override
  State<RegisterInitScreen> createState() => _RegisterInitScreenState();
}

class _RegisterInitScreenState extends State<RegisterInitScreen> {
  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());
    registerController.registerInitScreenContext = context;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Property Registration"),
          bottom: TabBar(
            indicatorColor: Theme.of(context).colorScheme.onPrimary,
            labelColor: Theme.of(context).colorScheme.onPrimary,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                iconMargin: EdgeInsets.zero,
                text: "Property Rate",
              ),
              Tab(
                icon: Icon(
                  Icons.business,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                iconMargin: EdgeInsets.zero,
                text: "Business",
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: TabBarView(
            children: [
              // Property Tab
              Obx(
                    () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Property Rate",
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        if (registerController.ownerDetails.isNotEmpty)
                          const Spacer(),
                        if (registerController.ownerDetails.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RegisterOwnerScreen();
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: 80,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimary,
                                  ),
                                  Text(
                                    "Owner",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // FIX: Corrected ternary order — ownerDetails first, then pocDetails,
                    // then passPropertyDetails, then noContactDetails, then action buttons.
                    // Also fixed noContactDetails branch to iterate noContactDetails (not passPropertyDetails).
                    registerController.ownerDetails.isNotEmpty
                        ? SingleChildScrollView(
                      child: Column(
                        children: [
                          for (final owner
                          in registerController.ownerDetails)
                            ownerDisplayCard(
                              ownerInfo: owner,
                              context: context,
                            ),
                        ],
                      ),
                    )
                        : registerController.pocDetails.isNotEmpty
                        ? Column(
                      children: [
                        SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "POCs",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            for (final poc
                            in registerController.pocDetails)
                              pocDisplayCard(
                                ownerInfo: poc,
                                context: context,
                              ),
                          ],
                        ),
                      ],
                    )
                        : registerController.passPropertyDetails.isNotEmpty
                        ? Column(
                      children: [
                        for (final passProperty
                        in registerController.passPropertyDetails)
                          Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.error.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text("Property passed"),
                                Text(
                                  passProperty.reason.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    )
                        : registerController.noContactDetails.isNotEmpty
                        ? Column(
                      children: [
                        // FIX: iterate noContactDetails, not passPropertyDetails
                        for (final noContact
                        in registerController.noContactDetails)
                          Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.error.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text("N/A"),
                                Text(
                                  noContact.polygonID.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    )
                        : Column(
                      children: [
                        ActionContainer(
                          title: "Owner",
                          icon: Icons.person,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegisterOwnerScreen();
                                },
                              ),
                            );
                          },
                          description: "Register owner of property",
                        ),

                        const SizedBox(height: 10),

                        ActionContainer(
                          title: "POC",
                          icon: Icons.group,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegisterPocScreen();
                                },
                              ),
                            );
                          },
                          description: "Register point of contact",
                        ),

                        const SizedBox(height: 10),

                        ActionContainer(
                          title: "Pass",
                          icon: Icons.play_arrow_outlined,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return PassPropertyScreen();
                                },
                              ),
                            );
                          },
                          description: "Ignore property(for now)",
                        ),

                        const SizedBox(height: 10),

                        ActionContainer(
                          title: "N/A",
                          icon: Icons.close,
                          onTap: () {
                            registerController.saveNoContactInfoOffline();
                            setState(() {});
                            debugPrint(
                              "THE SAVED CONTACT INFO:::: ${registerController.noContactDetails}",
                            );
                          },
                          description: "No contact available",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Business Tab
              Obx(
                    () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Businesses",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Expanded(
                      child: registerController.businessOwnerDetails.isEmpty
                          ? Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 10),

                            ActionContainer(
                              title: "Owner",
                              icon: Icons.person,
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return RegisterBusinessOwnerScreen();
                                    },
                                  ),
                                );
                              },
                              description: "Register business owner",
                            ),

                            const SizedBox(height: 10),

                            ActionContainer(
                              title: "POC",
                              icon: Icons.group,
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return RegisterBusinessPocScreen();
                                }));

                              },
                              description: "Register business point of contact",
                            ),
                            // Icon(Icons.apartment, size: 40),
                            // Text(
                            //   "No businesses found",
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                          ],
                        ),
                      )
                          : ListView.separated(
                        itemCount: registerController.businesses.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              registerController.businessOwnerDetails[index].businessName,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // floatingActionButton: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     FloatingActionButton.extended(
        //       heroTag: "fab1",
        //       onPressed: () {},
        //       icon: const Icon(Icons.add_business),
        //       label: const Text("Add Business"),
        //     ),
        //
        //     const SizedBox(width: 10),
        //
        //     FloatingActionButton.extended(
        //       heroTag: "fab2",
        //       onPressed: () {},
        //       icon: const Icon(Icons.group),
        //       label: const Text("Add Business POC"),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  Widget ownerDisplayCard({
    required RegisterOwnerModel ownerInfo,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () async {
          await actionOwnerBottomSheet(context, ownerInfo);
        },
        leading: Icon(Icons.person, color: theme.primaryColor),
        title: Text(
          ownerInfo.ownerName,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Future<dynamic> actionOwnerBottomSheet(
      BuildContext context,
      RegisterOwnerModel ownerInfo,
      ) {
    debugPrint("THE GPS:::::::${ownerInfo.toJson()}");
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        final theme = Theme.of(context);
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.person, color: theme.primaryColor),
                title: Text(ownerInfo.ownerName),
              ),
              ListTile(
                leading: Icon(Icons.call, color: theme.primaryColor),
                title: Text(ownerInfo.contactNumber),
              ),
              ListTile(
                leading: Icon(Icons.mail, color: theme.primaryColor),
                title: Text(ownerInfo.email),
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: theme.primaryColor),
                title: Text(ownerInfo.gpsLocation),
              ),
              ListTile(
                leading: Icon(Icons.apartment, color: theme.primaryColor),
                title: Text(ownerInfo.propertyDetails),
              ),
              ListTile(
                leading: Icon(Icons.money, color: theme.primaryColor),
                title: Text("Payment Method: ${ownerInfo.paymentMethod}"),
              ),
              ListTile(
                leading: Icon(Icons.phone, color: theme.primaryColor),
                title: Text(
                  "Communication Method: ${ownerInfo.communicationMethod}",
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterOwnerScreen(
                                  ownerInfo: ownerInfo,
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Edit",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          final registerController = Get.put(
                            RegisterController(),
                          );
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Confirm Delete"),
                              content: const Text(
                                "Are you sure you want to delete this owner?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context, false);
                                    await registerController.deleteOwner();
                                  },
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text(
                                    "Delete",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.error,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Delete",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget pocDisplayCard({
    required RegisterPocModel ownerInfo,
    required BuildContext context,
  }) {
    final theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: () async {
          await actionPocBottomSheet(context, ownerInfo);
        },
        leading: Icon(Icons.person, color: theme.primaryColor),
        title: Text(
          ownerInfo.ownerName,
          style: theme.textTheme.titleLarge!.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Future<dynamic> actionPocBottomSheet(
      BuildContext context,
      RegisterPocModel ownerInfo,
      ) {
    debugPrint("THE GPS:::::::${ownerInfo.toJson()}");
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        final theme = Theme.of(context);
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.person, color: theme.primaryColor),
                title: Text(ownerInfo.ownerName),
              ),
              ListTile(
                leading: Icon(Icons.call, color: theme.primaryColor),
                title: Text(ownerInfo.contactNumber),
              ),
              ListTile(
                leading: Icon(Icons.mail, color: theme.primaryColor),
                title: Text(ownerInfo.email),
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: theme.primaryColor),
                title: Text(ownerInfo.gpsLocation),
              ),
              ListTile(
                leading: Icon(Icons.apartment, color: theme.primaryColor),
                title: Text(ownerInfo.propertyDetails),
              ),
              ListTile(
                leading: Icon(Icons.money, color: theme.primaryColor),
                title: Text("Payment Method: ${ownerInfo.paymentMethod}"),
              ),
              ListTile(
                leading: Icon(Icons.phone, color: theme.primaryColor),
                title: Text(
                  "Communication Method: ${ownerInfo.communicationMethod}",
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterPocScreen(pocInfo: ownerInfo);
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Edit",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          final registerController = Get.put(
                            RegisterController(),
                          );
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Confirm Delete"),
                              content: const Text(
                                "Are you sure you want to delete this owner?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    Navigator.pop(context, false);
                                    await registerController.deleteOwner();
                                  },
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text(
                                    "Delete",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.error,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Delete",
                            style: theme.textTheme.titleMedium!.copyWith(
                              color: theme.colorScheme.surface,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
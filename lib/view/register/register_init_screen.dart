import 'package:flutter/material.dart';
import 'package:gema/view/register/register_controller.dart';
import 'package:gema/view/register/register_owner/register_owner_screen.dart';
import 'package:gema/view/register/register_widgets/action_container.dart';
import 'package:get/get.dart';

class RegisterInitScreen extends StatelessWidget {
  const RegisterInitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Property Registration"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Property Rate",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            ActionContainer(
              title: "Owner",
              icon: Icons.person,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return RegisterOwnerScreen();
                }));
              },
              description: "Register owner of property",
            ),

            const SizedBox(height: 10),

            ActionContainer(
              title: "POC",
              icon: Icons.group,
              onTap: () {},
              description: "Register point of contact",
            ),

            const SizedBox(height: 10),

            ActionContainer(
              title: "Pass",
              icon: Icons.play_arrow_outlined,
              onTap: () {},
              description: "Ignore property(for now)",
            ),

            const SizedBox(height: 10),

            ActionContainer(
              title: "N/A",
              icon: Icons.close,
              onTap: () {},
              description: "No contact available",
            ),

            const SizedBox(height: 20),

            Text(
              "Businesses",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            /// Scrollable section
            Expanded(
              child: Obx(() {
                if (registerController.businesses.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.apartment, size: 40,),
                        Text(
                          "No businesses found",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.separated(
                  itemCount: registerController.businesses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(registerController.businesses[index]),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                );
              }),
            )
          ],
        ),
      ),

        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
              heroTag: "fab1",
              onPressed: () {},
              icon: const Icon(Icons.add_business),
              label: const Text("Add Business"),
            ),

            const SizedBox(width: 10),

            FloatingActionButton.extended(
              heroTag: "fab2",
              onPressed: () {},
              icon: const Icon(Icons.group),
              label: const Text("Add POC"),
            ),
          ],
        )
    );
  }
}
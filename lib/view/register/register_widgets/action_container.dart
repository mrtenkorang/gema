import 'package:flutter/material.dart';
import 'package:gema/view/theme/theme.dart';


class ActionContainer extends StatelessWidget {
  const ActionContainer({super.key, this.icon, this.title, this.onTap, this.description});

  final IconData? icon;
  final String? title;
  final String? description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap!,
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(40)),
          border: Border.all(
            color: Theme.of(context).primaryColor
          )
        ),
        child: Row(
          children: [
            Icon(icon!, size: 40,),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title.toString(), style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  // fontWeight: FontWeight.bold
                ),),
                // SizedBox(height: 5,),
                Text(description.toString(), style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  // fontWeight: FontWeight.bold
                ),),

              ],
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}

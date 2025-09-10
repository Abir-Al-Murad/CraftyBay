import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.iconData,
    required this.ontap,
  });

  final VoidCallback ontap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(16),
        highlightColor: Colors.pink,
        onTap: ontap, child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
                radius: 14,
                backgroundColor: Colors.grey.shade200,
                child: Icon(iconData,color: Colors.grey,size: 16,),
              ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileMenuWidget extends StatelessWidget {


  const ProfileMenuWidget({super.key,
    required this.onPress, required this.title, this.endIcon = true});

  final String title;
  final VoidCallback onPress;
  final bool endIcon;
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: onPress,
      title:  Text(title, style: const TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 0, 0, 0))) ,
      trailing: endIcon? Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: const Icon(LineAwesomeIcons.angle_right_solid, size: 18.0, color: Colors.grey)) : null,
    );
  }
}
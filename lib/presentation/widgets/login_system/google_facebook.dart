import 'package:flutter/material.dart';
import 'package:booking_system/presentation/widgets/utils/icon_button.dart';

class GoogleAndFacebook extends StatelessWidget {
  const GoogleAndFacebook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButtonApp(
          bcolor: Colors.white,
          action: () {},
          icon: Image.asset("assets/icons/google_icon.png"),
        ),
        IconButtonApp(
          bcolor: Colors.blueAccent,
          action: () {},
          icon: const Icon(
            Icons.facebook,
            size: 34,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

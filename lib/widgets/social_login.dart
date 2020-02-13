import 'package:flutter/material.dart';

class SocialLogin extends StatelessWidget {
  final List<Color> colors;
  final IconData icon;
  final VoidCallback onPressed;

  SocialLogin({this.colors, this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24),
      child: Container(
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: colors,
              tileMode: TileMode.clamp,
            )),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}

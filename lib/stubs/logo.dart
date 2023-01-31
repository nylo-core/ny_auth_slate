String stubLogoWidget() => '''
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget(
      {Key? key, this.height, this.width})
      : super(key: key);
  
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Image.network(
        'https://nylo.dev/images/nylo_logo_filled.png',
        height: height ?? 40,
        width: width ?? 40,
      ),
    );
  }
}
''';

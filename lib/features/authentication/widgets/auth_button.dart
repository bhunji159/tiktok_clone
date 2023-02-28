import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/sizes.dart';

class AuthButton extends StatelessWidget {
  final FaIcon icon;
  final String text;
  final void Function() onTap;

  const AuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: Sizes.size8),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size14,
            horizontal: Sizes.size14,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
          ),
          child: Stack(
            children: [
              icon,
              Container(
                padding: const EdgeInsetsDirectional.only(top: Sizes.size4),
                alignment: Alignment.center,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: Sizes.size14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

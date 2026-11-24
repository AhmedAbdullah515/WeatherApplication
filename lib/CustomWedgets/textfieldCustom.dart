import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Textfieldcustom extends StatelessWidget {
  final String lable;
  final Icon prfixIcon;
  final Icon? IconSufix;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  Textfieldcustom({
    super.key,
    required this.lable,
    required this.prfixIcon,
    this.IconSufix,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Card(
        elevation: 10,
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            label: Text(lable),
            filled: true,
            fillColor: const Color.fromARGB(255, 241, 212, 203),
            prefixIcon: prfixIcon,
            suffixIcon: IconSufix,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}

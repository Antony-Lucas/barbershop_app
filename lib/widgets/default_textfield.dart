import 'package:flutter/material.dart';
import 'package:barbershop_app/widgets/colorPallete.dart';

Widget buildTextField(
    {String? hint, required TextEditingController controller}) {
  return TextField(
    controller: controller,
    textCapitalization: TextCapitalization.words,
    decoration: InputDecoration(
      labelText: hint ?? '',
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black38),
        borderRadius: BorderRadius.circular(10.0)),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.babyPowder),
        borderRadius: BorderRadius.circular(10.0)
      )
    ),
  );
}
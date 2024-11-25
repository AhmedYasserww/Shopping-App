import 'package:flutter/material.dart';
import 'custom_text_form_field_widget.dart';

class PhoneNumberField extends StatelessWidget {
  final TextEditingController nameController;

  const PhoneNumberField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: nameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required. Please enter a phone number.';
        } else if (value.length != 11) {
          return 'Phone number must be exactly 11 digits long.';
        }
        return null;
      },
      prefixIcon: const Icon(Icons.phone),
      labelText: 'Phone Number',
    );
  }
}

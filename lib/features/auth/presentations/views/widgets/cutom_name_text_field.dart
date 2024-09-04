import 'package:flutter/material.dart';

import 'custom_text_form_field_widget.dart';
class NameField extends StatelessWidget {
  final TextEditingController nameController;

  const NameField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: nameController,
      validator: (value) => value == null || value.isEmpty ? 'Field is required' : null,
      prefixIcon: const Icon(Icons.person),
      labelText: "UserName",
    );
  }
}
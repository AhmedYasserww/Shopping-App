import 'package:flutter/material.dart';
// profile_password_row.dart
import 'package:flutter/material.dart';

class ProfilePasswordRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isVisible;
  final VoidCallback onToggleVisibility;

  const ProfilePasswordRow({
    Key? key,
    required this.label,
    required this.value,
    required this.isVisible,
    required this.onToggleVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.lock, color: Colors.grey),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.grey)),
              const SizedBox(height: 5),
              Text(
                isVisible ? value : '********',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onToggleVisibility,
          icon: isVisible
              ? Icon(Icons.visibility, color: Colors.grey)
              : Icon(Icons.visibility_off, color: Colors.grey),
        ),
      ],
    );
  }
}

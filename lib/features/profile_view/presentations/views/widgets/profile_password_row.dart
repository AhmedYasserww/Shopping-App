import 'package:flutter/material.dart';
class ProfilePasswordRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isVisible;
  final VoidCallback onToggleVisibility;

  const ProfilePasswordRow({
    super.key,
    required this.label,
    required this.value,
    required this.isVisible,
    required this.onToggleVisibility,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.lock, color: Colors.grey),
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
              ? const Icon(Icons.visibility, color: Colors.grey)
              : const Icon(Icons.visibility_off, color: Colors.grey),
        ),
      ],
    );
  }
}

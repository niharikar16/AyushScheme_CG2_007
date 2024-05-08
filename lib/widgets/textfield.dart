import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hint,
      required this.label,
      this.controller,
      this.isPassword = false,
      this.onIconPressed});
  final String hint;
  final String label;
  final bool isPassword;
  final TextEditingController? controller;
  final VoidCallback? onIconPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: onIconPressed != null
              ? IconButton(
                  icon: Icon(Icons.calendar_today), // Change the icon as needed
                  onPressed:
                      onIconPressed, // Call the provided callback on icon press
                )
              : null,
          hintText: hint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          label: Text(label),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.grey, width: 1))),
    );
  }
}

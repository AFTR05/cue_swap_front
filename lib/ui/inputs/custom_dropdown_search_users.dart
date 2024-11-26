
import 'package:cue_swap/models/user.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropdownSearchUsers extends StatelessWidget {
  final List<User> users;
  final Function(User?) onChanged;

  const CustomDropdownSearchUsers({super.key, required this.users, required this.onChanged, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownSearch<User>(
        items: users,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: "Selecciona un usuario",
            labelStyle: CustomLabels.labelFormStyle,
            hintText: "Busqueda por usuario",
            hintStyle: CustomLabels.hintFormStyle,
            contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            border: const OutlineInputBorder(),
          ),
        ),
        itemAsString: (User user) => user.name, // Customize display
        onChanged: onChanged
      ),
    );
  }
}

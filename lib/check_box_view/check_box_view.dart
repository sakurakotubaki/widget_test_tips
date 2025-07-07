import 'package:flutter/material.dart';

class CheckBoxView extends StatefulWidget {
  const CheckBoxView({super.key});

  @override
  State<CheckBoxView> createState() => _CheckBoxViewState();
}

class _CheckBoxViewState extends State<CheckBoxView> {

  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      key: const Key('checkbox-view'),
      title: const Text('Check me!'),
      value: _isChecked,
      onChanged: _toggleCheckbox,
    );
  }
}
import 'package:flutter/material.dart';

class CaseCheck extends StatefulWidget {
  const CaseCheck({super.key});

  @override
  State<CaseCheck> createState() => _CaseCheckState();
}

class _CaseCheckState extends State<CaseCheck> {

  bool _isChecked = false;

  void _toggleCheckbox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      key: const Key('case-check'),
      title: const Text('チェックのテストケース'),
      value: _isChecked,
      onChanged: _toggleCheckbox,
    );
  }
}
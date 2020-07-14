import 'package:flutter/material.dart';
import 'package:notes/configs/colors.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gunMetal,
      body: Center(
        child: Text(
          'Settings',
          style: TextStyle(color: AppColor.carribeanGreen),
        ),
      ),
    );
  }
}

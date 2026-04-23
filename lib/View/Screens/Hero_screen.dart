import 'package:flutter/material.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key});
  static const String routeName = "/hero";
  @override
  State<HeroScreen> createState() => _HeroScreenState();
}

class _HeroScreenState extends State<HeroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Center(
          child: Text(
            "This is the Hero Screen",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

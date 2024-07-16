import 'package:flutter/material.dart';

class Fernando extends StatefulWidget {
  const Fernando({super.key});

  @override
  State<Fernando> createState() => _FernandoState();
}

class _FernandoState extends State<Fernando> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Fernando'),
      ),
    );
  }
}

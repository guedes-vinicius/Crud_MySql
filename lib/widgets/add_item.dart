import'package:flutter/material.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Item'),
        centerTitle: true,
        backgroundColor: Color(0xFFCB0A02)
      ),
      body: Column(
        children: [
          TextField()
        ],
      ),
    );
  }
}

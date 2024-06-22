import 'package:flutter/material.dart';

class ContainerApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ColorPicker(),
            const SizedBox(height: 16),
            EventDetails(),
          ],
        ),
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF212121), // Grey background color
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'CHOOSE A COLOR:',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ColorCircle(color: Color(0xFFF5D6A4)), // Cream color
              const ColorCircle(color: Color(0xFFD3E6FE)), // Light blue color
              const ColorCircle(
                  color: Color(0xFFBAC8E0),
                  isSelected: true), // Blue color with check
              const ColorCircle(color: Color(0xFFE6BEDD)), // Pink color
              const VerticalDivider(color: Colors.grey),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.teal),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColorCircle extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorCircle({required this.color, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(16.0),
        ),
        if (isSelected)
          const Icon(Icons.check_circle,
              color: Colors.orange, size: 16), // Check icon
      ],
    );
  }
}

class EventDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF212121), // Grey background color
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: const Row(
        children: [
          Icon(Icons.calendar_today, color: Colors.teal),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '17th November',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                '11:00AM - 12:00PM',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ContainerApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CalendarHeader(),
            const SizedBox(height: 16),
            ColorPicker(),
            const SizedBox(height: 16),
            EventDetails(),
            const SizedBox(height: 16),
            BottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}

class CalendarHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'January, 2021',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.orange),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              return DayCircle(
                day: (index + 1).toString(),
                isSelected: index == 3, // seleciona o 4º dia
              );
            }),
          ),
        ],
      ),
    );
  }
}

class DayCircle extends StatelessWidget {
  final String day;
  final bool isSelected;

  const DayCircle({required this.day, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.teal : Colors.grey[800],
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(12.0),
      child: Text(
        day,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class ColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
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
              const ColorCircle(color: Colors.amber),
              const ColorCircle(color: Colors.blue),
              const ColorCircle(color: Colors.pinkAccent),
              const ColorCircle(color: Colors.purple),
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

  const ColorCircle({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(16.0),
    );
  }
}

class EventDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
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

class BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.home, color: Colors.teal),
        Icon(Icons.calendar_today, color: Colors.grey),
        Icon(Icons.person, color: Colors.grey),
        Icon(Icons.settings, color: Colors.grey),
      ],
    );
  }
}

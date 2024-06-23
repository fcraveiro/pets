import 'package:flutter/material.dart';

class ContainerApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF222222), // Cor de fundo cinza
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Text(
                        'CHOOSE A COLOR:',
                        style: TextStyle(color: Color(0xFFFFFFFF)),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'CHOOSE A COLOR:',
                        style: TextStyle(color: Color(0xFFB8B9B8)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ColorCircle(color: Color(0xFFF5D6A4)), // Cor creme
                      const ColorCircle(
                          color: Color(0xFFD3E6FE)), // Cor azul claro
                      const ColorCircle(
                          color: Color(0xFFBAC8E0),
                          isSelected: true), // Cor azul com check
                      const ColorCircle(color: Color(0xFFE6BEDD)), // Cor rosa
                      const VerticalDivider(color: Colors.grey),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Color(0xFF27C197)),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF27C499), // Cor verde para o botão
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Row(
                children: [
                  Icon(Icons.calendar_today, color: Color(0xFF27C197)),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '17th November',
                        style: TextStyle(color: Color(0xFFB8B9B8)),
                      ),
                      Text(
                        '11:00AM - 12:00PM',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
              color: Colors.orange, size: 16), // Ícone de verificação
      ],
    );
  }
}

// pagina : Color(0xFF0F0F0F),
// container : Color(0xFF222222),
// texto forte : Color(0xFFFFFFFF)
// texto fraco : Color(0xFFB8B9B8)
// icon : Color(0xFF27C197)
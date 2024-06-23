// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter_view_controller/flutter_view_controller.dart';

// import '../../components/star_rate/star_rate.dart';
// import '../../components/text_styles/text_styles.dart';

// class ListSecondaryController extends Controller {
//   @override
//   onInit() {}

//   @override
//   onClose() {}
// }

// class ListSecondaryView extends ViewOf<ListSecondaryController> {
//   final List<dynamic> lista;
//   final String titulo;

//   ListSecondaryView({
//     required this.lista,
//     required this.titulo,
//     super.key,
//     required super.controller,
//     super.size,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(
//               vertical: size.height(1.5), horizontal: size.width(4)),
//           child: Text(
//             titulo,
//             style: GFont().gFont(size.height(1.8), weight: FontWeight.w700),
//           ),
//         ),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Padding(
//             padding: EdgeInsets.only(left: size.width(4)),
//             child: Row(
//               children: lista.map((item) {
//                 return GestureDetector(
//                   onTap: () {},
//                   child: Stack(
//                     children: [
//                       _buildImage(item),
//                       _buildRating(item),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Container _buildImage(dynamic item) {
//     return Container(
//       margin: EdgeInsets.only(right: size.width(2.5)),
//       width: size.width(55),
//       height: size.height(19),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(6),
//         image: DecorationImage(
//           image: AssetImage(item['img']),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }

//   Container _buildRating(dynamic item) {
//     return Container(
//       margin: const EdgeInsets.only(right: 8),
//       width: size.width(55),
//       height: size.height(19),
//       alignment: Alignment.bottomCenter,
//       child: Container(
//         width: size.width(55),
//         height: size.height(4),
//         color: Colors.black.withOpacity(.4),
//         child: Row(
//           children: [
//             const SizedBox(width: 9),
//             starRate(decimalRandom(), size.width(4.5)),
//             const Spacer(),
//             Text(
//               '(${inteiro().toString()})',
//               style: GFont().gFont(size.height(1.9),
//                   color: Colors.white, weight: FontWeight.w700),
//             ),
//             const SizedBox(width: 2.5),
//           ],
//         ),
//       ),
//     );
//   }
// }

// double decimalRandom() {
//   double random = 1 + Random().nextDouble() * 4;
//   String randomString = random.toStringAsFixed(1);
//   return double.parse(randomString);
// }

// // crie uma função que retorne um numero random inteiro de 1 a 200

// inteiro() {
//   int random = 1 + Random().nextInt(200);
//   return random;
// }

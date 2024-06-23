// import 'package:flutter_view_controller/flutter_view_controller.dart';
// import 'package:flutter/material.dart';

// import '../../components/star_rate/star_rate.dart';
// import '../../components/text_styles/text_styles.dart';
// import 'list_secondary_view.dart';

// class DestaqueController extends Controller {
//   @override
//   onInit() {}

//   @override
//   onClose() {}
// }

// class DestaqueView extends ViewOf<DestaqueController> {
//   DestaqueView({super.key, required super.controller, super.size});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Stack(
//         children: [
//           Container(
//             height: size.height(35),
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/banner_1.png'),
//                     fit: BoxFit.cover)),
//           ),
//           // Container(
//           //   height: size.height(35), // 480,
//           //   margin: const EdgeInsets.only(top: 30),
//           //   decoration: BoxDecoration(
//           //     gradient: LinearGradient(colors: [
//           //       // Colors.orange.withOpacity(0.85),
//           //       // Colors.yellow.withOpacity(0.0)
//           //       Colors.black.withOpacity(0.4),
//           //       Colors.black.withOpacity(0.0)
//           //     ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
//           //   ),
//           // ),
//           Positioned(
//             bottom: size.height(0),
//             left: 0,
//             child: Container(
//               width: size.width(100),
//               height: size.height(7),
//               color: Colors.black.withOpacity(.3),
//               child: Row(
//                 children: [
//                   SizedBox(width: size.width(5)),
//                   starRate(decimalRandom(), size.height(3.4)),
//                   const Spacer(),
//                   Text('(${inteiro().toString()})',
//                       style: GFont().gFont(size.height(2.5),
//                           color: Colors.white, weight: FontWeight.w700)),
//                   SizedBox(width: size.width(3)),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_view_controller/flutter_view_controller.dart';

// import '../../domain/types/_priority.dart';
// import '../../data/not_used/services_model.dart';
// import '../build_chip/build_chip.dart';
// import '../text_styles/text_styles.dart';

// class MyDialog {
//   Future<void> showModal(BuildContext context,
//       Map<int, List<Services>> groupedServices, Sizer size) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext dialogContext) {
//         return Center(
//           child: Container(
//             width: size.width(84),
//             height: size.height(70),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(size.width(4)),
//             ),
//             child: Card(
//               child: Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: groupedServices.entries.map((entry) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: size.height(1)),
//                           Padding(
//                             padding: EdgeInsets.only(left: size.width(4)),
//                             child: Text(
//                               PriorityType.fromIdName(entry.key)!,
//                               style: GFont().noticeBlueText(14),
//                             ),
//                           ),
//                           Container(
//                             width: size.width(80),
//                             padding: EdgeInsets.only(
//                                 bottom: size.width(2),
//                                 left: size.width(2),
//                                 right: size.width(2)),
//                             margin: EdgeInsets.only(
//                                 top: size.height(1.5),
//                                 left: size.height(1.5),
//                                 right: size.height(1.5),
//                                 bottom: size.height(.5)),
//                             decoration: BoxDecoration(
//                               // color: Colors.grey.shade300,
//                               borderRadius:
//                                   BorderRadius.circular(size.width(2)),
//                             ),
//                             child: Wrap(
//                               // spacing: 2.0,
//                               // runSpacing: 2.0,
//                               children: entry.value.map((service) {
//                                 return buildChip(
//                                     service.name, service.priority, size);
//                               }).toList(),
//                             ),
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

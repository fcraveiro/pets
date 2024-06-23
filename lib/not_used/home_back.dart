// import 'dart:developer';
// import 'package:flutter_view_controller/flutter_view_controller.dart';
// import 'package:flutter/material.dart';
// import '../../components/star_rate/star_rate.dart';
// import '../../components/temporary.dart';
// import '../../components/text_styles/text_styles.dart';
// import '../../data/memory/home_repository_memory.dart';
// import '../../domain/types/colors_app.dart';
// import '../scaffold/scaffold_home.dart';

// class HomeController extends Controller {
//   ScaffoldHomeController scaffoldHomeController = ScaffoldHomeController();
//   HomeRepositoryMemory homeRepositoryMemory = HomeRepositoryMemory();
//   Notifier<bool> loadingStores = Notifier(true);
//   Map<String, List<Map<String, dynamic>>> groupedData = {};
//   @override
//   onInit() {
//     configScaffoldApp();
//     readData();
//   }

//   readData() {
//     loadingStores.value = true;
//     groupedData = homeRepositoryMemory.loadAll();
//     loadingStores.value = false;
//   }

//   configScaffoldApp() {
//     scaffoldHomeController.title.value = 'Serviços';
//   }

//   @override
//   onClose() {}
// }

// class HomeView extends ViewOf<HomeController> {
//   HomeView({required super.controller, super.size});
//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldHomeView(
//       controller: controller.scaffoldHomeController,
//       child: controller.loadingStores.show(
//         (isLoading) => isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : buildMainUI(),
//       ),
//     );
//   }

//   Widget buildMainUI() {
//     return SizedBox(
//       width: size.width(100),
//       height: size.height(100),
//       child: Column(
//         children: [
//           buildMainUISection(),
//           Expanded(
//             child: ListView.builder(
//               itemCount: controller.groupedData.keys.length,
//               itemBuilder: (context, index) {
//                 String serviceName =
//                     controller.groupedData.keys.elementAt(index);
//                 List<Map<String, dynamic>> stores =
//                     controller.groupedData[serviceName]!;
//                 return buildServiceSection(serviceName, stores);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildMainUISection() {
//     return Container(
//       width: size.width(100),
//       height: size.height(30),
//       color: ColorApp().primary,
//       child: Center(
//         child: buildMainUIStack(),
//       ),
//     );
//   }

//   Widget buildMainUIStack() {
//     return Stack(
//       children: [
//         Container(
//           width: size.width(95),
//           height: size.height(28),
//           decoration: BoxDecoration(
//             color: ColorApp().grey600,
//             borderRadius: const BorderRadius.all(Radius.circular(10)),
//           ),
//         ),
//         Positioned(
//           bottom: size.height(1.2),
//           right: size.width(2.3),
//           child: buildMainUIArrow(),
//         ),
//       ],
//     );
//   }

//   Widget buildMainUIArrow() {
//     return Container(
//       width: size.width(12),
//       height: size.height(5.5),
//       decoration: BoxDecoration(
//         color: ColorApp().grey700,
//         borderRadius: const BorderRadius.all(Radius.circular(10)),
//         border: Border.all(color: ColorApp().border700, width: size.width(.5)),
//       ),
//       child: Icon(
//         Icons.arrow_circle_right_outlined,
//         color: ColorApp().border500,
//         size: size.height(3.5),
//       ),
//     );
//   }

//   Widget buildServiceSection(
//       String serviceName, List<Map<String, dynamic>> stores) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(left: size.width(3), top: size.height(1)),
//           child: Text(serviceName, style: GFont().normalDarkText(15)),
//         ),
//         SizedBox(
//           height: size.height(17),
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: stores.length,
//             itemBuilder: (context, storeIndex) {
//               Map<String, dynamic> store = stores[storeIndex];
//               return buildStoreCard(store, serviceName);
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildStoreCard(Map<String, dynamic> store, String serviceName) {
//     return storeCard(store, serviceName);
//   }

//   Widget storeCard(Map<String, dynamic> store, String serviceName) {
//     print('storeCard: store: $store, serviceName: $serviceName');
//     final image = store['image'];
//     final isImageNull = image == null;
//     final imageUrl = isImageNull ? null : image;
//     final color = isImageNull ? ColorApp().grey600 : ColorApp().border700;
//     final borderColor = serviceName.priorityNumber == 6
//         ? ColorApp().border200
//         : ColorApp().border800;
//     final linerColors = [
//       ColorApp().border800,
//       ColorApp().primary,
//     ];
//     final imageWidget = isImageNull
//         ? SizedBox(
//             width: size.height(7),
//             height: size.height(7),
//           )
//         : Container(
//             width: size.height(5),
//             height: size.height(5),
//             margin: EdgeInsets.only(top: size.height(0), right: size.width(2)),
//             color: color,
//             child: Image.network(
//               imageUrl,
//               width: size.height(5),
//               height: size.height(5),
//               fit: BoxFit.contain,
//             ),
//           );
//     return GestureDetector(
//       onTap: () {
//         print('storeCard: onTap store: $store, serviceName: $serviceName');
//         log(store.toString());
//       },
//       child: Container(
//         width: size.height(23),
//         height: size.height(15),
//         margin: EdgeInsets.only(
//           top: size.height(1),
//           left: size.width(3),
//           right: size.width(1),
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(size.width(3)),
//           border: Border.all(color: borderColor, width: size.width(.5)),
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             stops: const [0.5, 0.5],
//             colors: linerColors,
//           ),
//         ),
//         child: Padding(
//           padding: EdgeInsets.only(left: size.width(1.5)),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: size.width(27),
//                         height: size.height(2.3),
//                         alignment: Alignment.center,
//                         child: starRate(decimalRandom(), size.width(4)),
//                       ),
//                       Container(
//                         width: size.width(27),
//                         height: size.height(2.3),
//                         alignment: Alignment.center,
//                         child: Text('(${inteiro().toString()})',
//                             style: GFont().normalWhiteText(11)),
//                       ),
//                       Container(
//                         width: size.width(27),
//                         height: size.height(2.9),
//                         alignment: Alignment.center,
//                         child: Text(store['phones'][0],
//                             style: GFont().noticeDarkText(10)),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: imageWidget,
//                   ),
//                 ],
//               ),
//               SizedBox(height: size.height(.9)),
//               Text(store['bairro'], style: GFont().noticeDarkText(13)),
//               SizedBox(height: size.height(.5)),
//               Text(store['name'], style: GFont().normalDarkText(12)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// extension PriorityStringExtension on String {
//   String get serviceName {
//     return split('-').first;
//   }
// }

// extension PriorityNumberExtension on String {
//   int get priorityNumber {
//     var parts = split('-');
//     return int.tryParse(parts[1]) ?? 0;
//   }
// }

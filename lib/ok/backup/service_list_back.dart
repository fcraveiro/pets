// import 'package:flutter_view_controller/flutter_view_controller.dart';
// import 'package:flutter/material.dart';
// import '../data/memory/services_repository_memory.dart';
// import '../domain/entities/services_model.dart';
// import '../domain/types/_priority.dart';
// import '../data/supabase/repository/service_repository.dart';
// import '../data/memory/service_repository_memory.dart';
// import '../domain/types/colors_app.dart';
// import '../screens/scaffold/scaffold_app.dart';
// import '../screens/src/stores_service.dart';

// class ServicesListController extends Controller {
//   ScaffoldAppController scaffoldAppController = ScaffoldAppController();
//   ServicesRepositoryMemory servicesRepositoryMemory =
//       ServicesRepositoryMemory();
//   ServiceRepositoryMemory serviceMemory = ServiceRepositoryMemory();
//   final servicesRepository = ServicesRepository();
//   NotifierList<Services> services = NotifierList<Services>();
//   Notifier<bool> loading = Notifier(true);

//   @override
//   onInit() {
//     configScaffoldApp();
//     getServices();
//   }

//   configScaffoldApp() {
//     scaffoldAppController.title.value = 'Serviços';
//   }

//   getServices() async {
//     loading.value = true;
//     services.value = servicesRepositoryMemory.loadAll();
//     loading.value = false;
//   }

//   goStoresService(service) async {
//     serviceMemory = ServiceRepositoryMemory();
//     serviceMemory.save(service);
//     Navigator.pushNamed(context, (StoresServiceView).toString());
//   }

//   @override
//   onClose() {}
// }

// class ServicesListView extends ViewOf<ServicesListController> {
//   ServicesListView({required super.controller, super.size});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorApp().fundo02,
//       body: controller.loading.show(
//         (isLoading) => isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : controller.services.show(
//                 (serviceList) => Column(
//                   children: [
//                     SizedBox(height: size.height(1.5)),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: serviceList.length,
//                         itemBuilder: (context, index) {
//                           final service = serviceList[index];
//                           return Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: size.width(5),
//                                 vertical: size.height(.3)),
//                             child: GestureDetector(
//                               onTap: () =>
//                                   controller.goStoresService(service.name),
//                               child: Card(
//                                 color: ColorApp().fundo03,
//                                 child: Padding(
//                                   padding: EdgeInsets.only(
//                                     left: size.width(3),
//                                     top: size.height(1),
//                                     bottom: size.height(1),
//                                   ),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Container(
//                                             width: size.width(27),
//                                             height: size.height(13),
//                                             decoration: BoxDecoration(
//                                               borderRadius:
//                                                   BorderRadius.circular(
//                                                       size.width(3)),
//                                               image: DecorationImage(
//                                                 image: NetworkImage(
//                                                     service.imageService),
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                           ),
//                                           Container(
//                                             width: size.width(51.5),
//                                             height: size.height(13),
//                                             margin: EdgeInsets.only(
//                                               left: size.width(3),
//                                             ),
//                                             color: ColorApp().fundo04,
//                                             child: Column(
//                                               children: [
//                                                 Text(service.name,
//                                                     style: PriorityType
//                                                         .fromIdTitle(
//                                                             service.priority)),
//                                                 const SizedBox(height: 8),
//                                                 Text(service.description,
//                                                     style: PriorityType
//                                                         .fromIdSubTitle(
//                                                             service.priority)),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }

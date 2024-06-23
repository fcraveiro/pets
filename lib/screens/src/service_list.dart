import 'dart:developer';

import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../components/text_styles/text_styles.dart';
import '../../data/memory/services_repository_memory.dart';
import '../../domain/entities/services_model.dart';
import '../../data/supabase/repository/service_repository.dart';
import '../../data/memory/service_repository_memory.dart';
import '../../domain/types/colors_app.dart';
import '../scaffold/scaffold_app.dart';
import 'stores_service.dart';

class ServicesListController extends Controller {
  ScaffoldAppController scaffoldAppController = ScaffoldAppController();
  ServicesRepositoryMemory servicesRepositoryMemory =
      ServicesRepositoryMemory();
  ServiceRepositoryMemory serviceMemory = ServiceRepositoryMemory();
  final servicesRepository = ServicesRepository();
  NotifierList<Services> services = NotifierList<Services>();
  Notifier<bool> loading = Notifier(true);

  @override
  onInit() {
    configScaffoldApp();
    listFake();
    getServices();
  }

  configScaffoldApp() {
    scaffoldAppController.title.value = 'Serviços';
  }

  getServices() async {
    // services.value = await servicesRepository.getServicesByPriority();
    services.value = servicesRepositoryMemory.loadAll();
    log(services.value.toString());
    loading.value = false;
  }

  listFake() async {
    services.value = List.filled(
      10,
      Services(
        name: BoneMock.name,
        description: BoneMock.words(2),
        priority: 1,
        imageService: BoneMock.address,
      ),
    );
  }

  goStoresService(service) async {
    serviceMemory = ServiceRepositoryMemory();
    serviceMemory.save(service);
    Navigator.pushNamed(context, (StoresServiceView).toString());
  }

  @override
  onClose() {}
}

class ServicesListView extends ViewOf<ServicesListController> {
  ServicesListView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppView(
      controller: controller.scaffoldAppController,
      child: controller.loading.show(
        (isLoading) => isLoading
            ? const Center(child: CircularProgressIndicator())
            : controller.services.show(
                (serviceList) => Column(
                  children: [
                    SizedBox(height: size.height(1.5)),
                    // Text('Serviços', style: GFont().normalGreyText(16)),
                    // SizedBox(height: size.height(1.5)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: serviceList.length,
                        itemBuilder: (context, index) {
                          final service = serviceList[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width(5),
                                vertical: size.height(.3)),
                            child: GestureDetector(
                              onTap: () =>
                                  controller.goStoresService(service.name),
                              child: Card(
                                color:
                                    // PriorityType.fromIdColor(service.priority),
                                    ColorApp().fundo03,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width(2.5),
                                      vertical: size.width(2.5)),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: size.width(30),
                                        height: size.width(30),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              size.width(3)),
                                          // color: ColorApp().fundo03,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                service.imageService),
                                            fit: BoxFit.cover,
                                          ),
                                          border: Border.all(
                                            color: ColorApp().fundo06,
                                            width: size.width(.5),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: size.width(48),
                                        height: size.width(30),
                                        margin: EdgeInsets.only(
                                            left: size.width(3.5)),
                                        // color: ColorApp().fundo05,
                                        child: Column(
                                          children: [
                                            // SizedBox(height: size.height(.1)),
                                            Text(service.name,
                                                textAlign: TextAlign.center,
                                                style: GFont()
                                                    .noticeSecondary(13)),
                                            // style: PriorityType.fromIdTitle(
                                            //     service.priority)),
                                            const SizedBox(height: 8),
                                            Text(service.description,
                                                style: GFont()
                                                    .normalSecondary(11)),

                                            // style:
                                            //     PriorityType.fromIdSubTitle(
                                            //         service.priority)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}












// import 'dart:developer';
// import 'package:flutter_view_controller/flutter_view_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';
// import '../../data/memory/services_repository_memory.dart';
// import '../../domain/entities/services_model.dart';
// import '../../domain/types/_priority.dart';
// import '../../data/supabase/repository/service_repository.dart';
// import '../../data/memory/service_repository_memory.dart';
// import '../scaffold/scaffold_app.dart';
// import 'stores_service.dart';

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
//     listFake();
//     getServices();
//   }

//   configScaffoldApp() {
//     scaffoldAppController.title.value = 'Serviços';
//   }

//   getServices() async {
//     // services.value = await servicesRepository.getServicesByPriority();
//     services.value = servicesRepositoryMemory.loadAll();
//     log(services.value.toString());
//     loading.value = false;
//   }

//   listFake() async {
//     services.value = List.filled(
//       10,
//       Services(
//         name: BoneMock.name,
//         description: BoneMock.words(2),
//         priority: 1,
//       ),
//     );
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
//     return ScaffoldAppView(
//       controller: controller.scaffoldAppController,
//       child: controller.loading.show(
//         (isLoading) => isLoading
//             ? const Center(child: CircularProgressIndicator())
//             : controller.services.show(
//                 (serviceList) => Column(
//                   children: [
//                     SizedBox(height: size.height(1.5)),
//                     // Text('Serviços', style: GFont().normalGreyText(16)),
//                     // SizedBox(height: size.height(1.5)),
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
//                                 color:
//                                     PriorityType.fromIdColor(service.priority),
//                                 child: Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       horizontal: size.height(2),
//                                       vertical: size.height(1)),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(service.name,
//                                           style: PriorityType.fromIdTitle(
//                                               service.priority)),
//                                       const SizedBox(height: 8),
//                                       Text(service.description,
//                                           style: PriorityType.fromIdSubTitle(
//                                               service.priority)),
//                                       const SizedBox(height: 8),
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

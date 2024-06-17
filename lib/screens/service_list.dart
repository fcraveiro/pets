import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../components/text_styles/text_styles.dart';
import '../domain/entities/services_model.dart';
import '../domain/types/_priority.dart';
import '../data/supabase/service_repository.dart';
import '../data/memory/service_repository_memory.dart';
import 'stores_service.dart';

class ServicesListController extends Controller {
  late ServiceRepositoryMemory serviceMemory;
  final servicesRepository = ServicesRepository();
  NotifierList<Services> services = NotifierList<Services>();
  Notifier<bool> loading = Notifier(true);

  @override
  onInit() {
    listFake();
    getServices();
  }

  getServices() async {
    services.value = await servicesRepository.getServicesByPriority();
    await Future.delayed(const Duration(seconds: 1), () {
      loading.value = false;
    });
  }

  listFake() async {
    services.value = List.filled(
      10,
      Services(
        name: BoneMock.name,
        description: BoneMock.words(2),
        priority: 1,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
        centerTitle: true,
        backgroundColor: Colors.green.shade600,
      ),
      body: controller.loading.show(
        (isLoading) => Skeletonizer(
          containersColor: Colors.grey.shade200,
          enabled: isLoading,
          child: controller.services.show(
            (serviceList) => Column(
              children: [
                SizedBox(height: size.height(1.5)),
                Text('Serviços', style: GFont().normalGreyText(16)),
                SizedBox(height: size.height(1.5)),
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
                          onTap: () => controller.goStoresService(service.name),
                          child: Card(
                            color: PriorityType.fromIdColor(service.priority),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.height(2),
                                  vertical: size.height(1)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(service.name,
                                      style: GFont().noticeBlackText(13)),
                                  const SizedBox(height: 8),
                                  Text(service.description,
                                      style: GFont().normalGreyText(12)),
                                  const SizedBox(height: 8),
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
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'services_model.dart';
// import 'services_repository.dart';

// class SearchPage extends StatefulWidget {
//   @override
//   SearchPageState createState() => SearchPageState();
// }

// class SearchPageState extends State<SearchPage> {
//   List<Services> servicess = [];
//   String search = '';

//   @override
//   Widget build(BuildContext context) {
//     final servicesRepository = ServicesRepository();

//     void updateServices(String value) async {
//       setState(() {
//         search = value;
//       });
//       final services = await servicesRepository.getServices(search);
//       setState(() {
//         servicess = services;
//       });
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search'),
//       ),
//       body: Column(
//         children: <Widget>[
//           TextField(
//             onChanged: updateServices,
//           ),
//           Expanded(
//             child: FutureBuilder<List<Services>>(
//               future: search.isEmpty
//                   ? Future.value(servicess)
//                   : servicesRepository.getServices(search),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       final service = snapshot.data![index];
//                       return ListTile(
//                         title: Text(service.name),
//                         subtitle: Text(service.description),
//                       );
//                     },
//                   );
//                 } else {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

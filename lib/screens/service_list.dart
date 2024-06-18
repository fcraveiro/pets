import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../components/text_styles/text_styles.dart';
import '../domain/entities/services_model.dart';
import '../domain/types/_priority.dart';
import '../data/supabase/repository/service_repository.dart';
import '../data/memory/service_repository_memory.dart';
import '_widgets/appbar.dart';
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
    loading.value = false;
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
      appBar: appBar('Services List'),
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
                                      style: PriorityType.fromIdTitle(
                                          service.priority)),
                                  const SizedBox(height: 8),
                                  Text(service.description,
                                      style: PriorityType.fromIdSubTitle(
                                          service.priority)),
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

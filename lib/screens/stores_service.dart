import 'package:flutter/material.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../components/text_styles/text_styles.dart';
import '../data/memory/service_repository_memory.dart';
import '../data/memory/store_repository_memory.dart';
import '../data/supabase/repository/store_service_repository.dart';
import '_widgets/appbar.dart';
import '_widgets/phones.dart';
import '_widgets/topbar.dart';
import 'store_detals.dart';

class StoresServiceController extends Controller {
  final StoreRepositoryMemory storeMemory = StoreRepositoryMemory();
  final StoresService supabaseService = StoresService();
  late ServiceRepositoryMemory serviceMemory;
  NotifierList<Map<String, dynamic>> clientsFuture = NotifierList();
  Notifier<bool> loading = Notifier(true);
  Notifier<String> serviceName = Notifier('');

  @override
  onInit() {
    getServiceName();
    getStoresService();
  }

  getServiceName() async {
    serviceMemory = ServiceRepositoryMemory();
    serviceName.value = serviceMemory.load()!;
  }

  goStoreDetals(store) {
    storeMemory.saveAll(store);
    Navigator.pushNamed(context, (StoreDetalsView).toString());
  }

  getStoresService() async {
    clientsFuture.value =
        await supabaseService.getClientsUsingService(serviceName.value);
    loading.value = false;
  }

  @override
  onClose() {}
}

class StoresServiceView extends ViewOf<StoresServiceController> {
  StoresServiceView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Stores List by Service'),
      body: controller.loading.show(
        (isLoading) => Skeletonizer(
          enabled: isLoading,
          child: controller.clientsFuture.show(
            (stores) => Column(children: [
              SizedBox(height: size.height(1.5)),
              Text(controller.serviceName.value,
                  style: GFont().normalGreyText(16)),
              SizedBox(height: size.height(1.5)),
              Expanded(
                child: ListView.builder(
                  itemCount: stores.length,
                  itemBuilder: (context, index) {
                    final store = stores[index]['stores'];
                    return GestureDetector(
                      onTap: () => controller.goStoreDetals(store),
                      child: Card(
                        elevation: 2,
                        margin: EdgeInsets.symmetric(
                            vertical: size.height(.7),
                            horizontal: size.width(3)),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: size.width(3)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: size.height(1.5)),
                              widgetTopCard(store, size),
                              SizedBox(height: size.height(.5)),
                              Text(store['name'],
                                  style: GFont().normalBlackText(16)),
                              SizedBox(height: size.height(1)),
                              widgetPhones(store),
                              SizedBox(height: size.height(1)),
                              SizedBox(height: size.height(1.5)),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

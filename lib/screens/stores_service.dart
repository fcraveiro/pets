import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../components/star_rate/star_rate.dart';
import '../components/temporary.dart';
import '../components/text_styles/text_styles.dart';
import '../data/memory/service_repository_memory.dart';
import '../data/memory/store_repository_memory.dart';
import '../data/supabase/repository/store_service_repository.dart';
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
    log('LENGTH ${store.toString()}');
    storeMemory.saveAll(store);
    Navigator.pushNamed(context, (StoreDetalsView).toString());
  }

  getStoresService() async {
    clientsFuture.value =
        await supabaseService.getClientsUsingService(serviceName.value);
    await Future.delayed(const Duration(seconds: 1), () {
      loading.value = false;
    });
  }

  @override
  onClose() {}
}

class StoresServiceView extends ViewOf<StoresServiceController> {
  StoresServiceView({required super.controller, super.size});

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
                    final store = stores[index]['clients'];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width(4), vertical: size.height(.3)),
                      child: GestureDetector(
                        onTap: () => controller.goStoreDetals(store),
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width(3.5)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: size.height(1)),
                                Row(
                                  children: [
                                    Text(store['bairro'],
                                        style: GFont().noticeBlueText()),
                                    const Spacer(),
                                    starRate(decimalRandom(), size.width(4.5)),
                                    SizedBox(width: size.width(1.5)),
                                    Text('(${inteiro().toString()})',
                                        style: GFont().noticeBlueText(12)),
                                    SizedBox(width: size.width(1)),
                                  ],
                                ),
                                SizedBox(height: size.height(.5)),
                                Text(
                                  store['name'],
                                  style: GFont().normalBlackText(16),
                                ),
                                SizedBox(height: size.height(1)),
                                Text(
                                  store['phones'].join(' - '),
                                  style: GFont().noticeBlueText(11.5),
                                ),
                                SizedBox(height: size.height(1)),
                                // Wrap(
                                //   children: [
                                //     ...store.services
                                //         .map<Widget>((Service service) {
                                //       return buildChip(service., size);
                                //     }),
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );

                    // return Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: size.width(5), vertical: size.height(.3)),
                    //   child: Card(
                    //     child: Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           horizontal: size.height(2),
                    //           vertical: size.height(1)),
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Text(store['name'],
                    //               style: GFont().noticeBlackText(13)),
                    //           const SizedBox(height: 8),
                    //           Text(store['bairro'],
                    //               style: GFont().normalGreyText(12)),
                    //           const SizedBox(height: 8),
                    //           Text(store['cep'],
                    //               style: GFont().normalGreyText(12)),
                    //           const SizedBox(height: 8),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // );
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

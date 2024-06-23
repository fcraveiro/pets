import 'dart:developer';

import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import '../screens/_components/text_styles/text_styles.dart';
import '../data/supabase/repository/store_service_repository.dart';
import '../screens/_scaffold/scaffold_home.dart';

class Test4Controller extends Controller {
  ScaffoldHomeController scaffoldHomeController = ScaffoldHomeController();
  final StoresService supabaseService = StoresService();
  Notifier<bool> loadingStores = Notifier(true);

  Map<String, List<Map<String, dynamic>>> _groupedData = {};
  Map<String, List<Map<String, dynamic>>> get groupedData => _groupedData;

  Future<void> fetchClientsAndServices() async {
    loadingStores.value = true;
    final data = await supabaseService.getClientsAndServices();
    _groupedData = _groupStoresByService(data);
    log('groupedData: $_groupedData');
    log('TESTE 4');

    loadingStores.value = false;
  }

  Map<String, List<Map<String, dynamic>>> _groupStoresByService(
      List<Map<String, dynamic>> data) {
    // Cria uma lista para armazenar objetos com serviço, prioridade e lojas
    var serviceList = <Map<String, dynamic>>[];

    for (var item in data) {
      String serviceName = item['services']['name'];
      int servicePriority = int.parse(item['services']['priority'].toString());
      String combinedKey = '$serviceName - Priority: $servicePriority';

      serviceList.add({
        'combinedKey': combinedKey,
        'priority': servicePriority,
        'stores': item['stores']
      });
    }

    // Ordena a lista por prioridade
    serviceList.sort((b, a) => a['priority'].compareTo(b['priority']));

    // Agrupa os dados ordenados
    Map<String, List<Map<String, dynamic>>> groupedData = {};
    for (var item in serviceList) {
      String combinedKey = item['combinedKey'];
      if (!groupedData.containsKey(combinedKey)) {
        groupedData[combinedKey] = [];
      }
      groupedData[combinedKey]?.add(item['stores']);
    }

    return groupedData;
  }

  // Map<String, List<Map<String, dynamic>>> _groupStoresByService(
  //     List<Map<String, dynamic>> data) {
  //   Map<String, List<Map<String, dynamic>>> groupedData = {};
  //   for (var item in data) {
  //     // Combina o nome do serviço e a prioridade para criar uma chave única
  //     String serviceName = item['services']['name'];
  //     String servicePriority = item['services']['priority'].toString();
  //     String combinedKey = '$serviceName - Priority: $servicePriority';

  //     if (!groupedData.containsKey(combinedKey)) {
  //       groupedData[combinedKey] = [];
  //     }
  //     groupedData[combinedKey]?.add(item['stores']);
  //   }
  //   return groupedData;
  // }

  // Map<String, List<Map<String, dynamic>>> _groupStoresByService(
  //     List<Map<String, dynamic>> data) {
  //   Map<String, List<Map<String, dynamic>>> groupedData = {};
  //   for (var item in data) {
  //     String serviceName = item['services']['name'];
  //     if (!groupedData.containsKey(serviceName)) {
  //       groupedData[serviceName] = [];
  //     }
  //     groupedData[serviceName]?.add(item['stores']);
  //   }
  //   return groupedData;
  // }

  @override
  onInit() {
    configScaffoldApp();
    fetchClientsAndServices();
  }

  configScaffoldApp() {
    scaffoldHomeController.title.value = 'Serviços';
  }

  @override
  onClose() {}
}

class Test4View extends ViewOf<Test4Controller> {
  Test4View({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return ScaffoldHomeView(
      controller: controller.scaffoldHomeController,
      child: controller.loadingStores.show(
        (isLoading) => isLoading
            ? const Center(child: CircularProgressIndicator())
            : SizedBox(
                width: size.width(100),
                height: size.height(100),
                // color: Colors.red.shade800,
                child: Column(
                  children: [
                    //
                    // DestaqueView(controller: DestaqueController()),
                    //
                    Container(
                      width: size.width(100),
                      height: size.height(30),
                      color: const Color(0xFF2D3A5C),

                      // color: Colors.green,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              width: size.width(95),
                              height: size.height(28),
                              color: const Color(0xFF505B7B),
                            ),
                            Positioned(
                              bottom: size.height(1.2),
                              right: size.width(2.3),
                              child: Container(
                                width: size.width(28),
                                height: size.height(6),
                                decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.groupedData.keys.length,
                        itemBuilder: (context, index) {
                          String serviceName =
                              controller.groupedData.keys.elementAt(index);
                          List<Map<String, dynamic>> stores =
                              controller.groupedData[serviceName]!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width(3), top: size.height(1)),
                                child: Text(serviceName.serviceName,
                                    style: GFont().normalDarkText(15)),
                              ),
                              SizedBox(
                                height: size.height(17),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: stores.length,
                                  itemBuilder: (context, storeIndex) {
                                    Map<String, dynamic> store =
                                        stores[storeIndex];
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          top: size.height(1),
                                          left: size.width(3),
                                          right: size.width(1.5)),
                                      child: Center(
                                        child: Container(
                                          width: size.height(23),
                                          height: size.height(15),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF505B7B),
                                            borderRadius: BorderRadius.circular(
                                                size.width(3)),
                                            border:
                                                serviceName.priorityNumber == 6
                                                    ? Border.all(
                                                        color: Colors.black26,
                                                        width: size.width(.5))
                                                    : null,
                                            boxShadow:
                                                serviceName.priorityNumber == 6
                                                    ? [
                                                        BoxShadow(
                                                          color: Colors.red,
                                                          blurRadius:
                                                              size.width(.7),
                                                          spreadRadius:
                                                              size.width(.4),
                                                          offset: const Offset(
                                                              0, 0),
                                                        ),
                                                      ]
                                                    : null,
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  store['name'],
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  store['bairro'],
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
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

extension PriorityStringExtension on String {
  String get serviceName {
    return split(' - Priority: ').first;
  }
}

extension PriorityNumberExtension on String {
  int get priorityNumber {
    var parts = split(' - Priority: ');
    if (parts.length > 1) {
      return int.tryParse(parts[1]) ??
          0; // Retorna 0 ou outro valor padrão se não conseguir converter
    }
    return 0; // Retorna 0 ou outro valor padrão se o padrão não for encontrado
  }
}

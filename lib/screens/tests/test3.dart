import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import '../../components/text_styles/text_styles.dart';
import '../../data/supabase/repository/store_service_repository.dart';
import '../scaffold_home.dart';

class Test3Controller extends Controller {
  ScaffoldHomeController scaffoldHomeController = ScaffoldHomeController();
  final StoresService supabaseService = StoresService();
  Notifier<bool> loadingStores = Notifier(true);
  Map<String, List<Map<String, dynamic>>> _groupedData = {};
  Map<String, List<Map<String, dynamic>>> get groupedData => _groupedData;

  Future<void> fetchClientsAndServices() async {
    loadingStores.value = true;
    final data = await supabaseService.getClientsAndServices();
    _groupedData = _groupStoresByService(data);
    loadingStores.value = false;
  }

  Map<String, List<Map<String, dynamic>>> _groupStoresByService(
      List<Map<String, dynamic>> data) {
    Map<String, List<Map<String, dynamic>>> groupedData = {};
    for (var item in data) {
      String serviceName = item['services']['name'];
      if (!groupedData.containsKey(serviceName)) {
        groupedData[serviceName] = [];
      }
      groupedData[serviceName]?.add(item['stores']);
    }
    return groupedData;
  }

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

class Test3View extends ViewOf<Test3Controller> {
  Test3View({required super.controller, super.size});

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
                        color: const Color(0xFF505B7B),
                        child: const Center(),
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
                                  padding: const EdgeInsets.all(2.5),
                                  child: Text(serviceName,
                                      style: GFont().normalDarkText(15)),
                                ),
                                SizedBox(
                                  height: 150,
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
                                        child: Container(
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFF505B7B),
                                            borderRadius: BorderRadius.circular(
                                                size.width(3)),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                store['name'],
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
        ));
  }
}

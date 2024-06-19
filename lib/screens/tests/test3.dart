// import 'dart:developer';

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import '../../components/star_rate/star_rate.dart';
import '../../components/temporary.dart';
import '../../components/text_styles/text_styles.dart';
import '../../data/memory/home_repository_memory.dart';
// import '../../data/supabase/repository/store_service_repository.dart';
import '../../domain/types/colors_app.dart';
import '../scaffold_home.dart';

class Test3Controller extends Controller {
  ScaffoldHomeController scaffoldHomeController = ScaffoldHomeController();
  HomeRepositoryMemory homeRepositoryMemory = HomeRepositoryMemory();
  // final StoresService supabaseService = StoresService();
  Notifier<bool> loadingStores = Notifier(true);
  Map<String, List<Map<String, dynamic>>> groupedData = {};
  // Map<String, List<Map<String, dynamic>>> get groupedData => _groupedData;

  @override
  onInit() {
    configScaffoldApp();
    readData();
  }

  readData() {
    loadingStores.value = true;
    groupedData = homeRepositoryMemory.loadAll();
    loadingStores.value = false;
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
                      color: ColorApp().primary,

                      // color: Colors.green,
                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              width: size.width(95),
                              height: size.height(28),
                              decoration: BoxDecoration(
                                  color: ColorApp().grey600,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                            ),
                            Positioned(
                              bottom: size.height(1.2),
                              right: size.width(2.3),
                              child: Container(
                                width: size.width(12),
                                height: size.height(5.5),
                                decoration: BoxDecoration(
                                    color: ColorApp().grey700,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        color: ColorApp().border700,
                                        width: size.width(.5))),
                                child: Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: ColorApp().border500,
                                  size: size.height(3.5),
                                ),
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
                                    return storeCard(store, serviceName);
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

  Widget storeCard(Map<String, dynamic> store, String serviceName) {
    log(serviceName.toString());
    log(serviceName.priorityNumber.toString());

    return Padding(
      padding: EdgeInsets.only(
          top: size.height(1), left: size.width(3), right: size.width(1)),
      child: Center(
          child: Container(
        width: size.height(23),
        height: size.height(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorApp().grey600,
          borderRadius: BorderRadius.circular(size.width(3)),
          border: serviceName.priorityNumber == 6
              ? Border.all(color: ColorApp().border200, width: size.width(.5))
              : Border.all(color: ColorApp().border700, width: size.width(.5)),
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: size.width(2.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width(32),
                  height: size.height(2.7),
                  // color: Colors.red,
                  alignment: Alignment.bottomCenter,
                  child: starRate(decimalRandom(), size.width(4.5)),
                ),
                Container(
                  width: size.width(32),
                  height: size.height(2.3),
                  // color: Colors.yellow,
                  alignment: Alignment.center,
                  child: Text('(${inteiro().toString()})',
                      style: GFont().noticeWhiteText(11)),
                ),
                SizedBox(height: size.height(1)),
                Text(
                  store['bairro'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  store['name'],
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

extension PriorityStringExtension on String {
  String get serviceName {
    return split('-').first;
  }
}

extension PriorityNumberExtension on String {
  int get priorityNumber {
    var parts = split('-');
    return int.tryParse(parts[1]) ?? 0;
  }
}

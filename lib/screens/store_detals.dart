import 'dart:developer';

import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import '../components/star_rate/star_rate.dart';
import '../components/temporary.dart';
import '../components/text_styles/text_styles.dart';
import '../data/memory/store_repository_memory.dart';
import '_widgets/appbar.dart';

class StoreDetalsController extends Controller {
  final StoreRepositoryMemory storeMemory = StoreRepositoryMemory();
  Notifier<Map<String, dynamic>> stores = Notifier({});

  @override
  onInit() {
    getStore();
  }

  getStore() {
    stores.value = storeMemory.loadAll();
    log(stores.value['image'].toString());
  }

  @override
  onClose() {}
}

class StoreDetalsView extends ViewOf<StoreDetalsController> {
  StoreDetalsView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar('Stores Details'),
        body: controller.stores.show((store) => SafeArea(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(size.width(3)),
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height(1)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: size.width(57),
                                  height: size.height(15.5),
                                  color: Colors.blue,
                                  margin: EdgeInsets.only(
                                      left: size.width(2.5),
                                      top: size.height(1))),
                              const Spacer(),
                              Container(
                                width: size.width(28),
                                height: size.height(16.5),
                                margin: EdgeInsets.only(
                                    right: size.width(2.5),
                                    top: size.height(1)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      store['image'],
                                      width: size.width(20),
                                      height: size.width(20),
                                      fit: BoxFit.contain,
                                    ),
                                    Container(
                                        width: size.width(26),
                                        height: size.width(5),
                                        // color: Colors.pink,
                                        margin: EdgeInsets.only(
                                            top: size.height(.5),
                                            bottom: size.height(.3)),
                                        // alignment: Alignment.center,
                                        child: starRate(
                                            decimalRandom(), size.width(4.5))),
                                    Text('(${inteiro().toString()})',
                                        style: GFont().noticeBlueText(12)),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Text(store['bairro'],
                                  style: GFont().noticeBlueText()),
                              const Spacer(),
                              SizedBox(width: size.width(1.5)),
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

                          // Wrap(
                          //   children: [
                          //     ...store.services
                          //         .map<Widget>((Service service) {
                          //       return buildChip(service.name, size);
                          //     }),
                          //   ],
                          // ),
                        ],
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
            )));
  }
}

// <!-- Permissão de Internet -->
// <uses-permission android:name="android.permission.INTERNET"/>

// <!-- Permissões de Localização -->
// <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
// <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>

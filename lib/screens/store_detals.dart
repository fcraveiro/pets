import 'dart:developer';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';

import '../components/star_rate/star_rate.dart';
import '../components/temporary.dart';
import '../components/text_styles/text_styles.dart';
import '../data/memory/store_repository_memory.dart';

class StoreDetalsController extends Controller {
  final StoreRepositoryMemory storeMemory = StoreRepositoryMemory();
  Notifier<Map<String, dynamic>> clients = Notifier({});

  @override
  onInit() {
    getStore();
  }

  getStore() {
    log(storeMemory.loadAll().toString());
    clients.value = storeMemory.loadAll();
    log(clients.value.length.toString());
  }

  @override
  onClose() {}
}

class StoreDetalsView extends ViewOf<StoreDetalsController> {
  StoreDetalsView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.clients.show((store) => SafeArea(
              child: Column(children: [
                SizedBox(height: size.height(1.5)),
                Text('controller.serviceName.value',
                    style: GFont().normalGreyText(16)),
                SizedBox(height: size.height(1.5)),
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width(4),
                            vertical: size.height(.3)),
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
                                //       return buildChip(service.name, size);
                                //     }),
                                //   ],
                                // ),
                              ],
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

                  // child: Column(
                  //   // mainAxisAlignment: MainAxisAlignment.start,
                  //   children: <Widget>[
                  //     SizedBox(height: size.height(2)),
                  //     Text(store['name'], style: GFont().noticeBlueText(14)),
                  //     SizedBox(height: size.height(2)),
                  //     Text(store['address'],
                  //         style: GFont().noticeBlueText(14)),
                  //     SizedBox(height: size.height(2)),
                  //     Text(store['city'], style: GFont().noticeBlueText(14)),
                  //     SizedBox(height: size.height(2)),
                  //     Text(store['state'], style: GFont().noticeBlueText(14)),
                  //     SizedBox(height: size.height(2)),
                  //     Text(store['cep'], style: GFont().noticeBlueText(14)),
                  //     SizedBox(height: size.height(2)),
                  //     Text(
                  //       store['phones'].join(' - '),
                  //       style: GFont().noticeBlueText(11.5),
                  //     ),
                  //   ],
                  // ),
                ),
              ]),
            )));
  }
}

    // <!-- Permissão de Internet -->
    // <uses-permission android:name="android.permission.INTERNET"/>
    
    // <!-- Permissões de Localização -->
    // <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    // <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>

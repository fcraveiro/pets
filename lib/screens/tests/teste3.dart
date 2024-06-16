import 'dart:developer';

import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import '../../components/text_styles/text_styles.dart';
import '../../data/supabase/rpc_stores_detals_repository.dart';
import '../../domain/entities/stores_model.dart';

class TestRpcStoresDetalisController extends Controller {
  RpcStoresDetalsRepository rpcStoresDetalsRepository =
      RpcStoresDetalsRepository();
  NotifierList<Stores> storeDetails = NotifierList<Stores>();
  Notifier<bool> loader = Notifier(true);

  @override
  onInit() {
    fetchAndDisplayStoreDetails();
  }

  @override
  onClose() {}

  void fetchAndDisplayStoreDetails() async {
    try {
      loader.value = true;
      storeDetails.value = await rpcStoresDetalsRepository.getStoreDetails();
      log(storeDetails.value[0].name.toString());
      loader.value = false;
    } catch (error) {
      print('Error fetching store details: $error');
    }
  }
}

class TestRpcStoresDetalisView extends ViewOf<TestRpcStoresDetalisController> {
  TestRpcStoresDetalisView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lojas'),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: controller.loader.show(
        (value) => controller.loader.value
            ? const Center(child: CircularProgressIndicator())
            : controller.storeDetails.show(
                (stores) => ListView.builder(
                  itemCount: stores.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Stores store = stores[index];
                    return Container(
                      // width: MediaQuery.of(context).size.width - 20,
                      width: size.width(90),
                      margin: EdgeInsets.only(
                          left: size.width(4),
                          right: size.width(4),
                          top: size.height(1.5)),
                      padding: EdgeInsets.only(
                          left: size.width(2.5),
                          right: size.width(2.5),
                          bottom: size.height(1.5)),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Colors.grey.shade400, width: size.width(.3)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height(.7)),
                          Row(
                            children: [
                              Text(store.bairro,
                                  style: GFont().noticeBlueText()),
                              const Spacer(),
                              // starRate(decimalRandom(), size.width(4.5)),
                              // SizedBox(width: size.width(1.5)),
                              // Text('(${inteiro().toString()})',
                              //     style: GFont().noticeBlueText(12)),
                              SizedBox(width: size.width(1)),
                            ],
                          ),
                          SizedBox(height: size.height(.5)),
                          Text(
                            store.name,
                            style: GFont().normalBlackText(16),
                          ),
                          SizedBox(height: size.height(1)),
                          Text(
                            store.phones.join(' - '),
                            style: GFont().noticeBlueText(11.5),
                          ),
                          SizedBox(height: size.height(1)),
                          // Wrap(
                          //   children: [
                          //     ...store.services.map<Widget>((Service service) {
                          //       return GestureDetector(
                          //           onTap: () => controller
                          //               .goStoresService(service.name),
                          //           child: buildChip(service.name, size));
                          //     }),
                          //   ],
                          // ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}

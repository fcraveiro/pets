import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import '../../components/text_styles/text_styles.dart';
import '../../data/supabase/rpc_stores_detals_repository.dart';
import '../../domain/entities/services_model.dart';
import '../../domain/entities/stores_model.dart';
import '../_widgets/appbar.dart';
import '../_widgets/services.dart';
import '../_widgets/phones.dart';
import '../_widgets/top_card.dart';

class TestRpcStoresDetalisController extends Controller {
  RpcStoresDetalsRepository rpcStoresDetalsRepository =
      RpcStoresDetalsRepository();
  NotifierList<Stores> storeDetails = NotifierList<Stores>();
  NotifierList<Services> serviceDetails = NotifierList<Services>();
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
      appBar: appBar('Stores Details'),
      body: controller.loader.show(
        (value) => controller.loader.value
            ? const Center(child: CircularProgressIndicator())
            : controller.storeDetails.show(
                (stores) => ListView.builder(
                  itemCount: stores.length,
                  padding: EdgeInsets.symmetric(vertical: size.height(2)),
                  itemBuilder: (BuildContext context, int index) {
                    final Stores store = stores[index];
                    return Card(
                      elevation: 2,
                      margin: EdgeInsets.symmetric(
                          vertical: size.height(.7), horizontal: size.width(3)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width(3)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: size.height(1.5)),
                            widgetTopCard(store, size),
                            SizedBox(height: size.height(.5)),
                            Text(store.name,
                                style: GFont().normalBlackText(16)),
                            SizedBox(height: size.height(1)),
                            widgetPhones(store),
                            SizedBox(height: size.height(1)),
                            widgetServices(store, size),
                            SizedBox(height: size.height(1.5)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}

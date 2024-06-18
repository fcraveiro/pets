import 'package:flutter/material.dart';
import 'package:flutter_view_controller/flutter_view_controller.dart';
import '../../../json/home_json.dart';
import '../scaffold_app.dart';
import 'destaque.dart';
import 'list_secondary_view.dart';

class HomeScreenController extends Controller {
  ScaffoldAppController scaffoldAppController = ScaffoldAppController();

  // final servicesRepository = ServicesRepository();
  // NotifierList<Services> services = NotifierList<Services>();
  // Map<int, List<Services>> groupedServices = {};
  Notifier<bool> loader = Notifier(true);

  @override
  onInit() {
    configScaffoldApp();
    loader.value = true;
    getServices();
  }

  configScaffoldApp() {
    scaffoldAppController.title.value = 'Home';
  }

  getServices() async {
    // services.value = await servicesRepository.getServicesByPriority();
    // getServicesByPriority(services.value);
    await Future.delayed(const Duration(seconds: 1), () {
      loader.value = false;
    });
  }

  // void getServicesByPriority(List<Services> services) {
  //   groupedServices = groupBy(services, (service) => service.priority);
  // }

  @override
  onClose() {}
}

class HomeScreenView extends ViewOf<HomeScreenController> {
  HomeScreenView({super.key, required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return ScaffoldAppView(
      controller: controller.scaffoldAppController,
      child: SingleChildScrollView(
          child: SingleChildScrollView(
        child: SizedBox(
          // color: Colors.red.shade800,
          width: size.height(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DestaqueView(controller: DestaqueController()),
              // controller.services.show(
              //   (services) => Container(
              //     width: size.width(100),
              //     height: size.height(3),
              //     color: Colors.blue.shade800,
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height(.7)),
                  ListSecondaryView(
                    lista: minhaLista,
                    titulo: 'Minha Lista',
                    controller: ListSecondaryController(),
                  ),
                  ListSecondaryView(
                    lista: popularesLista,
                    titulo: 'Populares',
                    controller: ListSecondaryController(),
                  ),
                  ListSecondaryView(
                    lista: emAltaLista,
                    titulo: 'Em alta',
                    controller: ListSecondaryController(),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

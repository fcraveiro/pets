import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'data/memory/home_repository_memory.dart';
import 'data/memory/services_repository_memory.dart';
import 'data/supabase/repository/service_repository.dart';
import 'data/supabase/repository/store_service_repository.dart';
import 'screens/_menus/menu.dart';

class SplashController extends Controller {
  ServicesRepositoryMemory servicesMemory = ServicesRepositoryMemory();
  ServicesRepository servicesRepository = ServicesRepository();
  StoresService storesService = StoresService();
  HomeRepositoryMemory homeRepositoryMemory = HomeRepositoryMemory();
  Notifier<bool> loadingStores = Notifier(true);

  Map<String, List<Map<String, dynamic>>> _groupedData = {};
  Map<String, List<Map<String, dynamic>>> get groupedData => _groupedData;

  @override
  onInit() {
    fetchClientsAndServices();
    getServices();
  }

  Future<void> fetchClientsAndServices() async {
    loadingStores.value = true;
    final data = await storesService.getClientsAndServices();
    _groupedData = _groupStoresByService(data);
    await homeRepositoryMemory.saveAll(_groupedData);
    // mainmenu();
    tempo();
  }

  Map<String, List<Map<String, dynamic>>> _groupStoresByService(
      List<Map<String, dynamic>> data) {
    var serviceList = <Map<String, dynamic>>[];
    for (var item in data) {
      String serviceName = item['services']['name'];
      int servicePriority = int.parse(item['services']['priority'].toString());
      String imageService = item['services']['imageService'];
      var combinedKey = '$serviceName - $servicePriority - $imageService';
      serviceList.add({
        'combinedKey': combinedKey,
        'priority': servicePriority,
        'imageService': item['services']['imageService'],
        'stores': item['stores']
      });
    }
    serviceList.sort((b, a) => a['priority'].compareTo(b['priority']));
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

  getServices() async {
    await servicesMemory
        .saveAll(await servicesRepository.getServicesByPriority());
  }

  tempo() async {
    await Future.delayed(const Duration(seconds: 5));
    // chamaEmpresaListPage();
    // mainmenu();
    mainmenu();
  }

  mainmenu() async {
    Navigator.pushReplacementNamed(context, (MenuPetView).toString());
  }

  // chamaEmpresaListPage() async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => CategorySearchByStoreScreen()),
  //   );
  // }

  @override
  onClose() {}
}

class SplashView extends ViewOf<SplashController> {
  SplashView({super.key, required super.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: size.width(100),
              height: size.height(100),
              color: Colors.blue,
              child: Image.asset(
                'assets/splash/capa.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
                width: size.width(17),
                height: size.height(17),
                margin: EdgeInsets.only(
                    top: size.height(24.5), left: size.width(40)),
                child: Lottie.asset('assets/json/loader.json', reverse: true)),
            Container(
                width: size.width(100),
                height: size.height(5),
                alignment: Alignment.center,
                // color: Colors.blue,
                margin: EdgeInsets.only(top: size.height(36)),
                child: Text('Aguarde Carregando...',
                    style: TextStyle(
                        fontSize: size.width(5),
                        color: const Color(0xFF3E6F8D)))),
          ],
        ),
      ),
    );
  }
}

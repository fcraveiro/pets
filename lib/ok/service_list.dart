import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import '../components/text_styles/text_styles.dart';
import '../data/memory/services_repository_memory.dart';
import '../domain/entities/services_model.dart';
import '../data/supabase/repository/service_repository.dart';
import '../data/memory/service_repository_memory.dart';
import '../domain/types/colors_app.dart';
import '../screens/scaffold/scaffold_app.dart';
import '../screens/src/stores_service.dart';

class ServicesListController extends Controller {
  ScaffoldAppController scaffoldAppController = ScaffoldAppController();
  ServicesRepositoryMemory servicesRepositoryMemory =
      ServicesRepositoryMemory();
  ServiceRepositoryMemory serviceMemory = ServiceRepositoryMemory();
  final servicesRepository = ServicesRepository();
  NotifierList<Services> services = NotifierList<Services>();
  Notifier<bool> loading = Notifier(true);

  @override
  onInit() {
    configScaffoldApp();
    getServices();
  }

  configScaffoldApp() {
    scaffoldAppController.title.value = 'Serviços';
  }

  getServices() async {
    loading.value = true;
    services.value = servicesRepositoryMemory.loadAll();
    loading.value = false;
  }

  goStoresService(service) async {
    serviceMemory = ServiceRepositoryMemory();
    serviceMemory.save(service);
    Navigator.pushNamed(context, (StoresServiceView).toString());
  }

  @override
  onClose() {}
}

class ServicesListView extends ViewOf<ServicesListController> {
  ServicesListView({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorApp().fundo02,
        body: controller.loading.show(
          (isLoading) => isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height(2)),
                    Text('Serviços', style: GFont().noticeSecondary(16)),
                    SizedBox(height: size.height(1)),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.services.value.length,
                        itemBuilder: (context, index) {
                          final service = controller.services.value[index];
                          return _buildServiceCard(service);
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(Services service) {
    return Padding(
      padding: EdgeInsets.only(
        left: size.width(3),
        top: size.height(.5),
        right: size.width(3),
      ),
      child: GestureDetector(
        onTap: () => controller.goStoresService(service.name),
        child: Card(
          color: ColorApp().fundo03,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width(3),
              vertical: size.height(1.5),
            ),
            child: _buildServiceDetails(service),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceDetails(Services service) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildServiceImage(service),
            _buildServiceInfo(service),
          ],
        ),
      ],
    );
  }

  Widget _buildServiceImage(Services service) {
    return Container(
      width: size.width(27),
      height: size.height(13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width(3)),
        image: DecorationImage(
          image: NetworkImage(service.imageService),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildServiceInfo(Services service) {
    return Container(
      width: size.width(55),
      height: size.height(13),
      margin: EdgeInsets.only(
        left: size.width(3),
      ),
      // color: ColorApp().fundo04,
      child: Column(
        children: [
          Text(service.name,
              textAlign: TextAlign.center, style: GFont().noticeWhiteText(12)),
          const SizedBox(height: 8),
          Text(service.description, style: GFont().normalSecondary(12)),
        ],
      ),
    );
  }
}

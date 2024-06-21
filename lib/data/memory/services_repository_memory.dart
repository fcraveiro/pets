import '../../data/_tools/memory_connector.dart';
import '../../domain/entities/services_model.dart';
import '../../domain/entities/store_model.dart';

class ServicesRepositoryMemory {
  final MemoryConnector _memoryConnector = MemoryConnector();

  saveAll(List<Services> services) {
    _memoryConnector.saveAllServices(services);
  }

  List<Services> loadAll() {
    return _memoryConnector.loadAllServices();
  }

  void clear() {
    _memoryConnector.clearStores();
  }
}

extension Stores on MemoryConnector {
  //
  saveAllServices(List<Services> service) => save('service', service);
  //
  List<Services> loadAllServices() =>
      (load('service') ?? <Store>[]) as List<Services>;
  //
  clearStores() {
    clear('service');
  }
}

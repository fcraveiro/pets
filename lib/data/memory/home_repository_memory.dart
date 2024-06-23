import '../../data/_tools/memory_connector.dart';
import '../../domain/entities/store_model.dart';

class HomeRepositoryMemory {
  final MemoryConnector _memoryConnector = MemoryConnector();

  saveAll(Map<String, List<Map<String, dynamic>>> home) {
    _memoryConnector.saveAllHome(home);
  }

  Map<String, List<Map<String, dynamic>>> loadAll() {
    return _memoryConnector.loadAllHome();
  }

  void clear() {
    _memoryConnector.clearStores();
  }
}

extension Stores on MemoryConnector {
  //
  saveAllHome(Map<String, List<Map<String, dynamic>>> home) =>
      save('home', home);
  //
  Map<String, List<Map<String, dynamic>>> loadAllHome() =>
      (load('home') ?? <Store>[]) as Map<String, List<Map<String, dynamic>>>;
  //
  clearStores() {
    clear('home');
  }
}

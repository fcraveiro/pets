import '../../data/_tools/memory_connector.dart';
import '../../domain/entities/store_model.dart';

class StoreRepositoryMemory {
  final MemoryConnector _memoryConnector = MemoryConnector();

  saveAll(Map<String, dynamic> stores) {
    _memoryConnector.saveAllStores(stores);
  }

  Map<String, dynamic> loadAll() {
    return _memoryConnector.loadAllstores();
  }

  // void select(Store stores) {
  //   final list = loadAll();
  //   _memoryConnector
  //       .saveSelected(list.indexWhere((l) => l.name == stores.name));
  // }

  // Store? loadSelected() {
  //   final list = loadAll();
  //   if (list.isEmpty) return null;
  //   return list.elementAt(_memoryConnector.loadSelected());
  // }

  void clear() {
    _memoryConnector.clearStores();
  }
}

extension Stores on MemoryConnector {
  saveAllStores(Map<String, dynamic> stores) => save('store', stores);
  saveSelected(int index) => save('store', index);
  Map<String, dynamic> loadAllstores() =>
      (load('store') ?? <Store>[]) as Map<String, dynamic>;
  int loadSelected() => (load('store') ?? 0) as int;
  clearStores() {
    clear('store');
  }
}

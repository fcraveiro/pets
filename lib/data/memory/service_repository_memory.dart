import '../_tools/memory_connector.dart';

class ServiceRepositoryMemory {
  MemoryConnector memoryConnector = MemoryConnector();

  void save(String serviceName) {
    memoryConnector.save('serviceName', serviceName);
  }

  String? load() {
    return memoryConnector.load('serviceName') as String;
  }

  clear() {
    memoryConnector.clear('serviceName');
  }
}

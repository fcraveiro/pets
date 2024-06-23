import '../_tools/memory_connector.dart';

class TestRepositoryMemory {
  MemoryConnector memoryConnector = MemoryConnector();

  void save(String testValue) {
    memoryConnector.save('test', testValue);
  }

  String? load() {
    return memoryConnector.load('test') as String;
  }

  clear() {
    memoryConnector.clear('test');
  }
}

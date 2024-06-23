import '../../domain/entities/test_storage_model.dart';
import '../_tools/storage_connector.dart';

class TestRepositoryStorage {
  StorageConnector storageConnector = StorageConnector();

  Future<void> save(test) async {
    await storageConnector.save(
      'showTest',
      data: test.toStorage(),
    );
  }

  Future<TestStorageModel?> load() async {
    Map<String, dynamic>? mapData = await storageConnector.load('showTest');
    if (mapData == null) return null;
    return TestStorageModel.fromStorage(mapData);
  }

  Future<void> clear() async {
    await storageConnector.clear('showTest');
  }
}

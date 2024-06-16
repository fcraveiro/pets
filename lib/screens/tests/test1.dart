import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';

import '../../data/memory/test_repository_memory.dart';
import '../../data/storage/test_repository_storage.dart';
import '../../domain/entities/test_storage_model.dart';
// import '../../data/memory/Test.dart';

class Test1Controller extends Controller {
  TestRepositoryMemory testRepositoryMemory = TestRepositoryMemory();
  TestRepositoryStorage testRepositoryStorage = TestRepositoryStorage();

  @override
  onInit() {
    testando();
  }

  testando() async {
    testRepositoryMemory.save('Roupa Nova');

    await testRepositoryStorage.save(TestStorageModel(true, 'Calça Velha', 32));
  }

  @override
  onClose() {}
}

class Test1View extends ViewOf<Test1Controller> {
  Test1View({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [
            Text('Test'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_view_controller/flutter_view_controller.dart';
import 'package:flutter/material.dart';
import '../../data/memory/test_repository_memory.dart';
import '../../data/storage/test_repository_storage.dart';
import '../../domain/entities/test_storage_model.dart';

class Test2Controller extends Controller {
  TestRepositoryMemory testRepositoryMemory = TestRepositoryMemory();
  TestRepositoryStorage testRepositoryStorage = TestRepositoryStorage();
  Notifier<String> memoryValue = Notifier('');
  Notifier<bool> loader = Notifier(true);
  Notifier<TestStorageModel?> storageValue = Notifier(null);

  @override
  onInit() {
    readStorages();
  }

  readStorages() async {
    loader.value = true;
    memoryValue.value = testRepositoryMemory.load()!;
    storageValue.value = await testRepositoryStorage.load();
    loader.value = false;
  }

  @override
  onClose() {}
}

class Test2View extends ViewOf<Test2Controller> {
  Test2View({required super.controller, super.size});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste 2'),
        centerTitle: true,
      ),
      body: Center(
        child: controller.loader.show(
          (loader) => loader
              ? const SizedBox()
              : Column(
                  children: [
                    SizedBox(height: size.height(14)),
                    Text(controller.memoryValue.value.toString()),
                    SizedBox(height: size.height(2)),
                    Text(controller.storageValue.value!.showTeste.toString()),
                    SizedBox(height: size.height(2)),
                    Text(controller.storageValue.value!.nameTeste.toString()),
                    SizedBox(height: size.height(2)),
                    Text(controller.storageValue.value!.numberTeste.toString()),
                  ],
                ),
        ),
      ),
    );
  }
}

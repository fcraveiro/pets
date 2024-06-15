class TestStorageModel {
  bool showTeste;
  String nameTeste;
  int numberTeste;

  TestStorageModel(this.showTeste, this.nameTeste, this.numberTeste);

  factory TestStorageModel.fromStorage(Map<String, dynamic> storageData) {
    return TestStorageModel(
      storageData['showTeste'],
      storageData['nameTeste'],
      storageData['numberTeste'],
    );
  }

  Map<String, dynamic> toStorage() {
    return {
      'showTeste': showTeste,
      'nameTeste': nameTeste,
      'numberTeste': numberTeste,
    };
  }
}

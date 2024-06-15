class MemoryConnector {
  static final Map<String, Object> _value = {};
  // Languages? _language;

  MemoryConnector();

  factory MemoryConnector.withLanguage() {
    MemoryConnector memory = MemoryConnector();
    // memory._language = language;
    return memory;
  }

  save(String resource, Object value) {
    _value[resource] = value;
  }

  Object? load(String resource) {
    return _value[resource];
  }

  clear(String resource) {
    _value.remove(resource);
  }

  clearAll() {
    _value.clear();
  }

  // String _addLanguage(String resource) {
  //   if (_language != null) {
  //     return '${_language!.id}_$resource';
  //   } else {
  //     return resource;
  //   }
  // }
}

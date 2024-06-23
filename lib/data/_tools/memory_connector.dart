class MemoryConnector {
  static final Map<String, Object> _value = {};

  MemoryConnector();

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
}

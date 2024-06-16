class Services {
  final String name;
  final String description;
  final int priority;

  Services(
      {required this.name, required this.description, required this.priority});

  factory Services.fromMap(Map<String, dynamic> map) {
    return Services(
      name: map['name'] as String,
      description: map['description'] as String,
      priority: map['priority'] as int,
    );
  }
}

class Services {
  final String name;
  final String description;
  final int priority;
  final String imageService;
  final String imageService;
  final bool activity;

  Services(
      {required this.name,
      required this.description,
      required this.priority,
      required this.imageService,
      required this.imageService,
      required this.activity});

  factory Services.fromMap(Map<String, dynamic> map) {
    return Services(
      name: map['name'] as String,
      description: map['description'] as String,
      priority: map['priority'] as int,
      imageService: map['imageService'] as String,
    );
  }
}

class Stores {
  final String id;
  final String name;
  final String email;
  final String activityName;
  final String bairro;
  final int likes;
  final String address;
  final int number;
  final String city;
  final String state;
  final String cep;
  final List<String> phones;
  final List<String> services;

  Stores({
    required this.id,
    required this.name,
    required this.email,
    required this.activityName,
    required this.bairro,
    required this.likes,
    required this.address,
    required this.number,
    required this.city,
    required this.state,
    required this.cep,
    required this.phones,
    required this.services,
  });

  factory Stores.fromMap(Map<String, dynamic> map) {
    return Stores(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      activityName: map['activity_name'] as String,
      bairro: map['bairro'] as String,
      likes: map['likes'] as int,
      address: map['address'] as String,
      number: map['number'] as int,
      city: map['city'] as String,
      state: map['state'] as String,
      cep: map['cep'] as String,
      phones: List<String>.from(map['phones']),
      services: List<String>.from(map['services']),
    );
  }
}

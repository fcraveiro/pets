import 'services_model.dart';

class Store {
  final String name;
  final String email;
  final String address;
  final String number;
  final String city;
  final String state;
  final String cep;
  final String bairro;
  final String activityName;
  final List<Services> services;
  final List<String> phones;

  Store({
    required this.name,
    required this.email,
    required this.address,
    required this.number,
    required this.city,
    required this.state,
    required this.cep,
    required this.bairro,
    required this.activityName,
    required this.services,
    required this.phones,
  });

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      number: map['number'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      cep: map['cep'] as String,
      bairro: map['bairro'] as String,
      activityName: map['activity']['name'] as String,
      services: (map['client_services'] as List)
          .map((serviceMap) => Services.fromMap(serviceMap['service']))
          .toList(),
      phones: (map['phones'] as List).map((phone) => phone.toString()).toList(),
    );
  }
}

// class Service {
//   final String name;
//   final String description;

//   Service({
//     required this.name,
//     required this.description,
//   });

//   factory Service.fromMap(Map<String, dynamic> map) {
//     return Service(
//       name: map['name'] as String,
//       description: map['description'] as String,
//     );
//   }
// }

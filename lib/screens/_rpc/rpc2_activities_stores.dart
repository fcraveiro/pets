import 'dart:developer';

import '../../data/supabase/supabase_client.dart';

final client = SupabaseConfig.getClient();

// class RpcActivitiesStoresRepository {
//   Future<List<ServiceWithStores>> getServicesWithStores() async {
//     final response = await client.rpc('get_services_with_stores');
//     return (response as List)
//         .map((serviceMap) =>
//             ServiceWithStores.fromMap(serviceMap as Map<String, dynamic>))
//         .toList();
//   }
// }

class ServiceRepository {
  Future<List<Service>> getServicesWithStores() async {
    final response = await client.rpc('get_services_with_stores');

    final services = <Service>[];
    for (final row in response) {
      final service = Service(
        name: row['service_name'],
        stores: (row['stores'] as List<dynamic>)
            .map((store) => Store(
                  name: store['name'],
                ))
            .toList(),
      );
      services.add(service);
    }
    log('services $services');
    return services;
  }
}

class Service {
  final String name;
  final List<Store> stores;

  Service({
    required this.name,
    required this.stores,
  });
}

class Store {
  final String name;

  Store({
    required this.name,
  });
}

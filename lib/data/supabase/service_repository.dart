import 'dart:developer';

import 'supabase_client.dart';
import '../../domain/entities/services_model.dart';

final client = SupabaseConfig.getBd1();

class ServicesRepository {
  Future<List<Services>> getAllServices() async {
    final query = client
        .from('services')
        .select('name, description, priority ')
        .order('name');
    final response = await query;
    log('Response: $response');
    return response
        .map((serviceData) => Services.fromMap(serviceData))
        .toList();
  }

  Future<List<Services>> getServicesByPriority() async {
    final query = client
        .from('services')
        .select('name, description, priority')
        .order('priority')
        .order('name', ascending: true);
    final response = await query;
    return response
        .map((serviceData) => Services.fromMap(serviceData))
        .toList();
  }

  Future<List<Services>> getServices(String search) async {
    if (search.isEmpty) {
      return [];
    }
    final response = await client
        .from('services')
        .select('name, description')
        .ilike('name', '%$search%');
    return response
        .map((serviceData) => Services.fromMap(serviceData))
        .toList();
  }
}

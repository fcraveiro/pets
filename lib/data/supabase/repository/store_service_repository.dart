import 'dart:developer';
import '../_supabase_client/supabase_client.dart';

final client = SupabaseConfig.getBd1();

class StoresService {
  Future<List<Map<String, dynamic>>> getClientsUsingService(
      String serviceName) async {
    final response = await client
        .from('stores_services')
        .select('store_id, stores(*), services!inner(name)')
        .eq('services.name', serviceName);
    final data = response as List;
    log('DATA $data');
    return data.map((e) => e as Map<String, dynamic>).toList();
  }
}

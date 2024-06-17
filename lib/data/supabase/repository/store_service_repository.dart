import '../_supabase_client/supabase_client.dart';

final client = SupabaseConfig.getBd1();

class StoresService {
  Future<List<Map<String, dynamic>>> getClientsUsingService(
      String serviceName) async {
    final response = await client
        .from('client_services')
        .select('client_id, clients(*), services!inner(name)')
        .eq('services.name', serviceName);
    final data = response as List;
    return data.map((e) => e as Map<String, dynamic>).toList();
  }
}

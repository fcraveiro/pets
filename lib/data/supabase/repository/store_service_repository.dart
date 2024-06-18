import '../_supabase_client/supabase_client.dart';

final client = SupabaseConfig.getBd1();

class StoresService {
  Future<List<Map<String, dynamic>>> getClientsUsingService(
      String serviceName) async {
    final response = await client
        .from('stores_services')
        .select('stores(*), services!inner(name)')
        .eq('services.name', serviceName);
    final data = response as List;
    var sortedData = data.map((e) => e as Map<String, dynamic>).toList();
    sortedData
        .sort((a, b) => a['stores']['bairro'].compareTo(b['stores']['bairro']));
    return sortedData;
  }
}

import 'dart:developer';
import '../_supabase_client/supabase_client.dart';

final client = SupabaseConfig.getBd1();

class StoresService {
//   Future<List<Map<String, dynamic>>> getClientsUsingService(
//       String serviceName) async {
//     final response = await client
//         .from('stores_services')
//         .select('store_id, stores(*), services!inner(name)')
// .order('bairro', {foreignTable: 'stores'});
//         .eq('services.name', serviceName);
//     final data = response as List;
//     log('DATA $data');
//     return data.map((e) => e as Map<String, dynamic>).toList();
//   }
// }

  Future<List<Map<String, dynamic>>> getClientsUsingService(
      String serviceName) async {
    final response = await client
        .from('stores_services')
        .select('store_id, stores(*), services!inner(name)')
        .eq('services.name', serviceName);
    final data = response
        as List; // Certifique-se de acessar .data para obter os dados reais
    log('DATA $data');

    // Ordena os dados por bairro após a recuperação
    var sortedData = data.map((e) => e as Map<String, dynamic>).toList();
    sortedData
        .sort((a, b) => a['stores']['bairro'].compareTo(b['stores']['bairro']));
    return sortedData;
  }
}

// class StoresService {
//   Future<List<Map<String, dynamic>>> getClientsUsingService(
//       String serviceName) async {
//     final response = await client
//         .from('stores_services')
//         .select('store_id, stores(*), services!inner(name)')
//         .eq('services.name', serviceName);
//     final data = response as List;
//     log('DATA $data');
//     return data.map((e) => e as Map<String, dynamic>).toList();
//   }
// }

import '../../domain/entities/stores_model.dart';
import 'supabase_client.dart';

final client = SupabaseConfig.getClient();

class RpcStoresDetalsRepository {
  Future<List<Stores>> getStoreDetails() async {
    final response = await client.rpc('get_store_details');
    final data = response as List<dynamic>;
    return data
        .map((store) => Stores.fromMap(store as Map<String, dynamic>))
        .toList();
  }
}

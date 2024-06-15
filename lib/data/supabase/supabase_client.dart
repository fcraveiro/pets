import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static SupabaseClient getClient() {
    return SupabaseClient(
      dotenv.env['petHmlUrl']!,
      dotenv.env['petHmlAnom']!,
      authOptions: const AuthClientOptions(
        authFlowType: AuthFlowType.implicit,
      ),
    );
  }

  static SupabaseClient getPet() {
    return SupabaseClient(
      dotenv.env['petPrdUrl']!,
      dotenv.env['petPrdAnom']!,
      authOptions: const AuthClientOptions(
        authFlowType: AuthFlowType.implicit,
      ),
    );
  }
}

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  static SupabaseClient getBd1() {
    return SupabaseClient(
      dotenv.env['petBD1Url']!,
      dotenv.env['petBD1Anom']!,
      authOptions: const AuthClientOptions(
        authFlowType: AuthFlowType.implicit,
      ),
    );
  }

  static SupabaseClient getBD2() {
    return SupabaseClient(
      dotenv.env['petBD2Url']!,
      dotenv.env['petBD2Anom']!,
      authOptions: const AuthClientOptions(
        authFlowType: AuthFlowType.implicit,
      ),
    );
  }
}

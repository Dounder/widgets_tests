import 'package:flutter_dotenv/flutter_dotenv.dart';

class Envs {
  static String arcgisApiKey =
      dotenv.env['ARCGIS_API_KEY'] ?? 'ARCGIS_API_KEY not found';
}

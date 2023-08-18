import "package:flutter_dotenv/flutter_dotenv.dart";

class Config {
  String get(String key, {String? fallback}) {
    return dotenv.get(key, fallback: fallback);
  }
}

Future<void> initConfig(String env) async =>
    await dotenv.load(fileName: "config/$env.env");

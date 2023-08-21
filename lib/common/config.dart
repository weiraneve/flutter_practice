import "package:flutter_dotenv/flutter_dotenv.dart";

// ignore: non_constant_identifier_names
final Env = dotenv.env;

Future<void> initConfig(String env) async {
  const env = String.fromEnvironment('ENV', defaultValue: 'dev');
  switch (env) {
    case 'dev':
      await dotenv.load(fileName: 'config/$env.env');
      break;
    case 'stage':
      await dotenv.load(fileName: 'config/$env.env');
      break;
    case 'prod':
      await dotenv.load(fileName: 'config/$env.env');
      break;
    default:
      throw Exception('Unknown environment: $env');
  }
}

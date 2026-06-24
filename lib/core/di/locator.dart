import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../data/datasourse/weather_datasourse.dart';
import '../../data/datasourse/weather_remote_datasourse.dart';
import '../../data/repositories/weather_repository_impl.dart';
import '../../domain/repositories/weather_domain_repository.dart';
import '../network/dio_client.dart';

var locator = GetIt.instance;

Future<void> setupLocator() async {
  // dio clients
  locator.registerSingleton<Dio>(DioClient.instance);

  // datasourse
  locator.registerFactory<WeatherDatasourse>(
    () => WeatherRemoteDatasourse(dioClient: locator.get()),
  );

  // reposiroey
  locator.registerFactory<WeatherRepository>(
    () => WeatherRepositoryImpl(locator.get()),
  );
}

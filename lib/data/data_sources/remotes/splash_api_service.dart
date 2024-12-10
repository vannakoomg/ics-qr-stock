import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'splash_api_service.g.dart';


@LazySingleton()
@RestApi()
abstract class SplashApiService{
  @FactoryMethod()
  factory SplashApiService(Dio dio) = _SplashApiService;

  // all `Splash` request abstract here
}
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'scan_stock_api_service.g.dart';


@LazySingleton()
@RestApi()
abstract class ScanStockApiService{
  @FactoryMethod()
  factory ScanStockApiService(Dio dio) = _ScanStockApiService;

  // all `ScanStock` request abstract here
}
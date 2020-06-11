import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'service_name.g.dart';

//TODO: Addd service name and add host (baseUrl)
@RestApi(baseUrl: "https://")
abstract class ServiceName {
  factory ServiceName(Dio dio) = _ServiceName;

  //TODO: create your requests here
}
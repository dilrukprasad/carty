import 'package:carty/models/product_model.dart';
import 'package:carty/utilities/app_constants.dart';
import 'package:dio/dio.dart';

class ProductRepository {
  final Dio dio = Dio();
  final String apiUrl = Const.API_URL;
  late List<Datum> products = [];

  Future<List<Datum>> getProducts() async {
    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        final ProductModel jsonData = ProductModel.fromJson(response.data);
        final List<Datum> jsonList = jsonData.data!;
        products = jsonList.map((e) => Datum.fromJson(e.toJson())).toList();
      } else {
        throw Exception('Failed to load products');
      }
      return products;
    } on DioError catch (e) {
      throw Exception('Failed to get products: ${e.message}');
    }
  }
}

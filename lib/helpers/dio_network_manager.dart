import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:get_storage/get_storage.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._internal();
  factory NetworkManager() => _instance;

  late Dio dio;
  final GetStorage _storage = GetStorage();

  NetworkManager._internal() {
    dio = Dio(BaseOptions(
      baseUrl: "http://192.168.11.126:8000/graphql/api",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    // إضافة Interceptor للتوكن
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        String? token = _storage.read('token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));

    // إضافة DioCacheInterceptor
    dio.interceptors.add(DioCacheInterceptor(
      options:  CacheOptions(
        store: MemCacheStore( ), // يمكن تخزين البيانات مؤقتًا في الذاكرة
        policy: CachePolicy.forceCache, // سيتم استخدام التخزين المؤقت دائمًا دون عمليات تحقق
        hitCacheOnErrorExcept: [401, 403], // سيتم استخدام التخزين المؤقت في حالة الأخطاء إلا في حالات محددة
      ),
    ));
  }

  Future<Response> executeGraphQLQuery(String query, {Map<String, dynamic>? variables}) async {
    try {
      final response = await dio.post(
        '',
        data: {
          'query': query,
          'variables': variables ?? {},
        },
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}
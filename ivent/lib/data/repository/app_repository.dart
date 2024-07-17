import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ivent/global/helper/utils.dart';

class Repository<T> {
  final T apiProvider;
  final box = GetStorage();

  Repository({required this.apiProvider}) : assert(apiProvider != null);
  // Auth get authUserBox {
  //   var auth = box.read(GlobalConstants.authBox);
  //   return (auth.runtimeType == Auth().runtimeType)
  //       ? auth
  //       : Auth.fromJson(auth);
  // }
}

class ApiLoader<T> {
  final Function handler;
  ApiLoader(this.handler, {T? initData}) : data = initData;
  RxBool loading = false.obs;
  T? data;
  Future<void> perform() async {
    loading.value = true;
    data = await handler();
    loading.value = false;
  }
}

class ApiLoaderWithPagination<T> extends ApiLoader<List<T>> {
  late int offset;
  late int limit;

  ApiLoaderWithPagination(
    Future<List<T>> Function(int offset, int limit) handler, {
    List<T>? initData,
    this.offset = 0,
    this.limit = 10,
  }) : super(handler, initData: []);

  @override
  Future<void> perform() async {
    if (loading.value) return;
    loading.value = true;
    try {
      var d = await handler(offset, limit);
      printWithTag("perform", d.length);
      if (d.isNotEmpty) {
        data?.addAll(d);
        offset = offset + limit;
      }
    } catch (e) {
      printWithTag("ApiLoaderWithPagination", e);
    } finally {
      loading.value = false;
    }
  }
}

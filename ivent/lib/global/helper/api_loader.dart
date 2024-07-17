import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GApiLoader<T> {
  RxBool loading = false.obs;
  RxBool updating = false.obs;
  late Future<T> Function()? api;
  late T data;
  GApiLoader({
    required T initData,
    // required this.api,
  }) {
    this.data = initData;
  }
  setApi(Future<T> Function() api) {
    this.api = api;
  }

  perform() async {
    loading.value = true;
    try {
      if (api != null) {
        data = await api!();
      }

      loading.value = false;
    } catch (e) {
      loading.value = false;
      throw Exception("Failed to load data");
    }
  }

  void setApiAndLoad(Future<T> Function() api) {
    setApi(api);
    perform();
  }

  // void update(Post p, int index) {
  //   updating.value = true;
  //   (data as List)[index] = p;
  //   updating.value = false;
  // }
}

class GApiLoaderAnimationList<E> {
  RxBool loading = false.obs;
  RxBool updating = false.obs;
  late Future<List<E>> Function() api;
  late List<E> items = [];
  late List<E> tmpItems = [];
  final GlobalKey<State> listKey;
  // final RemovedItemBuilder<E> removedItemBuilder;

  RxInt iic = 0.obs;
  GApiLoaderAnimationList({
    required this.listKey,
    // required this.removedItemBuilder,
    required this.api,
  });
  setApi(Future<List<E>> Function() api) {
    this.api = api;
  }

  Future<void> load() async {
    iic.value = 0;
    loading.value = true;
    items.clear();
    try {
      final data = await api();
      loading.value = false;
      tmpItems = data;
      for (var i = 0; i < data.length; i++) {
        insert(i, data.elementAt(i));
        iic.value++;
        await 0.04.delay();
      }
      iic.value++;
      iic.value = data.length;

      print(iic.value);
    } catch (e) {
      iic.value = 0;

      loading.value = false;
      throw Exception("Failed to load data");
    }
  }

  void setApiAndLoad(Future<List<E>> Function() api) {
    iic.value = 0;
    setApi(api);
    load();
  }

  get _animatedList => listKey.currentState!;
  void insert(int index, E item) async {
    items.insert(index, item);
    try {
      _animatedList.insertItem(index);
    } catch (e) {}
  }

  // E removeAt(int index) {
  //   final E removedItem = items.removeAt(index);
  //   if (removedItem != null) {
  //     _animatedList.removeItem(
  //       index,
  //       (BuildContext context, Animation<double> animation) =>
  //           removedItemBuilder(removedItem, context, animation),
  //     );
  //   }
  //   return removedItem;
  // }

  int get length => items.length;

  E operator [](int index) => items[index];

  int indexOf(E item) => items.indexOf(item);

  E elementAt(int index) {
    return items.elementAt(index);
  }

  void remove(E p) {
    final i = items.indexWhere((element) => element == p);
    // removeAt(i);
  }

  E? firstWhereOrNull(bool Function(E) test) {
    return items.firstWhereOrNull(test);
  }

  filter(bool Function(E)? test) {
    loading.value = true;
    iic.value = 0;
    if (test != null) {
      items = tmpItems.where(test).toList();
    } else {
      items = [...tmpItems];
    }
    iic.value = items.length;
    loading.value = false;
  }
}

class GApiLoaderWithPagination<T> extends GApiLoader<List<T>> {
  late int offset;
  late int limit;
  late int page;
  final Future<List<T>> Function(int offset, int limit, int page) handler;
  GApiLoaderWithPagination({
    required this.handler,
    this.page = 1,
    this.offset = 0,
    this.limit = 10,
  }) : super(initData: []);

  @override
  Future<void> perform({List<T> Function(List<T> data)? processData}) async {
    if (loading.value) return;
    loading.value = true;
    try {
      var d = await handler(offset, limit, page);
      if (processData != null) {
        d = processData(d);
      }
      if (d.isNotEmpty) {
        data.addAll(d);
        offset = offset + limit;
        page++;
      }
    } catch (_) {
    } finally {
      loading.value = false;
    }
  }

  void clear() {
    this.page = 1;
    this.offset = 0;
    this.limit = 10;
    data.clear();
  }
}

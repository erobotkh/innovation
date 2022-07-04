import 'package:innovation/core/storages/base_object_storages/map_storage.dart';
import 'package:innovation/core/storages/storage_adapters/base_storage_adapter.dart';
import 'package:innovation/core/storages/storage_adapters/default_storage_adapter.dart';
import 'package:innovation/core/storages/storage_adapters/secure_storage_adapter.dart';
import 'package:innovation/main.dart';

abstract class TokenStorage extends MapStorage {
  @override
  Future<BaseStorageAdapter<String>> get adapter async {
    if (Global.instance.unitTest) {
      return DefaultStorageAdapter<String>();
    } else {
      return SecureStorageAdapter<String>();
    }
  }
}

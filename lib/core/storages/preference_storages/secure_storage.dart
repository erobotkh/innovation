import 'package:innovation/core/storages/preference_storages/base_storage.dart';
import 'package:innovation/core/storages/storage_adapters/base_storage_adapter.dart';
import 'package:innovation/core/storages/storage_adapters/secure_storage_adapter.dart';

abstract class SecureStorage extends BaseStorage<String> {
  @override
  Future<BaseStorageAdapter<String>> get adapter async => SecureStorageAdapter();
}

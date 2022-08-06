import 'package:innovation/core/storages/base_object_storages/list_storage.dart';

class RecentSenderDataStorage extends ListStorage<String> {
  RecentSenderDataStorage._();
  static final RecentSenderDataStorage instance = RecentSenderDataStorage._();
}

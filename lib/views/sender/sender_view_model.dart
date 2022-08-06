import 'package:innovation/core/base/base_view_model.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:innovation/core/services/messenger_service.dart';
import 'package:innovation/core/storages/recent_storage.dart';
import 'package:innovation/views/sender/src/sender_message_model.dart';
import 'package:innovation/views/sender/src/sent_message_model.dart';

class SenderViewModel extends BaseViewModel {
  SwipeActionController swipeActionController = SwipeActionController();
  List<SentMessageModel> sentMessages = <SentMessageModel>[];

  // this variable is used to stop sending in progress with cancel button
  bool stopSendingMessage = true;

  Set<String> recentDatas = {};
  List<SenderMessageModel> messages = <SenderMessageModel>[
    SenderMessageModel(message: '', second: 15),
  ];

  SenderViewModel() {
    RecentSenderDataStorage.instance.readList().then((value) {
      recentDatas.addAll(value?.toSet() ?? {});
    });
  }

  void addMessage(SenderMessageModel message) {
    messages.add(message);
  }

  void removeMessage(int index) {
    if (messages.length <= 1) return;
    messages.removeAt(index);
    swipeActionController.closeAllOpenCell();
  }

  Future<void> removeARecent(String value) async {
    recentDatas.remove(value);
    return RecentSenderDataStorage.instance.writeList(recentDatas.toList());
  }

  Future<void> addToRecent(String value) async {
    recentDatas.add(value);
    await RecentSenderDataStorage.instance.writeList(recentDatas.toList());
  }

  void putValueToMessage(String value) {
    bool changed = false;
    for (int i = 0; i < messages.length; i++) {
      SenderMessageModel e = messages[i];
      if (e.message.trim().isEmpty) {
        messages[i] = messages[i].copyWith(message: value);
        changed = true;
        break;
      }
    }

    if (!changed) {
      addMessage(
        SenderMessageModel(
          message: value,
          second: 5,
        ),
      );
    }
  }

  bool get sending => sentMessages.isNotEmpty;

  // check if some value is empty
  bool shouldSend() {
    if (sending) return false;

    for (int i = 0; i < messages.length; i++) {
      SenderMessageModel message = messages[i];
      if (message.message.trim().isEmpty) {
        MessengerService.instance.showSnackBar(
          'Value at index $i is empty.',
          success: false,
        );
        return false;
      }
    }

    return true;
  }
}

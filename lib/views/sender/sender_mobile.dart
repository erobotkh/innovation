part of sender_view;

class _SenderMobile extends StatelessWidget {
  final SenderViewModel viewModel;
  const _SenderMobile(this.viewModel);

  Future<void> onSend() async {
    // if (!controller.shouldSend()) return;
    // controller.stopSendingMessage = false;

    // controller.sentMessages.clear();
    // for (int i = 0; i < controller.messages.length; i++) {
    //   if (controller.stopSendingMessage) break;
    //   await sendAMessage(i);
    // }

    // closeSnackbar();
    // controller.stopSendingMessage = true;
    // controller.sentMessages.clear();
  }

  void cancelSend() {
    // controller.stopSendingMessage = true;
    // controller.sentMessages.clear();
    // closeSnackbar();
  }

  Future<void> sendAMessage(int index) async {
    // SenderMessageModel e = controller.messages[index];
    // await iot.write(e.message).then((e) {
    //   showSnackbar(
    //     title: e.message ?? "",
    //     message: e.message ?? "",
    //     showProgressIndicator: true,
    //   );
    // });

    // controller.sentMessages.add(SentMessageModel(
    //   index: index,
    //   startFrom: DateTime.now(),
    // ));

    // await Future.delayed(Duration(seconds: e.second));
    // controller.addToRecent(e.message);
    // closeSnackbar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        padding: ConfigConstant.layoutPadding,
        children: [
          buildSenderField(context),
          TextButton(
            child: Text(viewModel.sending ? "Cancel" : "Send"),
            onPressed: () => !viewModel.sending ? onSend() : cancelSend(),
          ),
          const SizedBox(height: ConfigConstant.margin2 * 2),
          buildSectionLabel(context),
          const SizedBox(height: ConfigConstant.margin1),
          buildRecentDatas(context)
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: ErTapEffect(
        child: const Text('SenderView'),
        onTap: () {
          // showOkAlertDialog(
          //   context: context,
          //   title: iot.service?.connectedDevice?.name,
          //   message: iot.service?.connectedDevice?.address.toString(),
          // );
        },
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () async {
            // Get.toNamed(Routes.IOT_CONNECTION_SETTING)?.then((value) async {
            //   if (value is BaseIotService) {
            //     iot.setService(value);
            //   }
            // });
          },
        ),
      ],
    );
  }

  Widget buildRecentDatas(BuildContext context) {
    var recentDatas = viewModel.recentDatas.toList();
    return Wrap(
      spacing: ConfigConstant.margin0,
      runSpacing: ConfigConstant.margin1,
      children: List.generate(
        recentDatas.length,
        (index) {
          String value = recentDatas[index];
          return ErTapEffect(
            onTap: () {
              viewModel.putValueToMessage(value);
            },
            child: Chip(
              backgroundColor: M3Color.dayColorsOf(context)[(index + 1) % 7],
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              label: Text(
                value,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.only(left: ConfigConstant.margin2),
              deleteIcon: Icon(
                Icons.cancel,
                size: ConfigConstant.iconSize1,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onDeleted: () {
                viewModel.removeARecent(value);
              },
            ),
          );
        },
      ),
    );
  }

  Widget buildSectionLabel(BuildContext context) {
    return Text(
      viewModel.recentDatas.toList().isNotEmpty ? "Recent data" : "No recent data",
      style: Theme.of(context).textTheme.bodyText1,
    );
  }

  Widget buildSenderField(BuildContext context) {
    return Column(
      children: List.generate(
        viewModel.messages.length,
        (index) {
          return SwipeActionCell(
            key: ValueKey(index),
            index: index,
            controller: viewModel.swipeActionController,
            isDraggable: viewModel.messages.length > 1,
            trailingActions: <SwipeAction>[
              SwipeAction(
                performsFirstActionWithFullSwipe: false,
                closeOnTap: true,
                title: "Delete",
                style: TextStyle(color: M3Color.of(context).onPrimary),
                onTap: (CompletionHandler handler) async {
                  viewModel.removeMessage(index);
                },
                color: Theme.of(context).colorScheme.error,
              ),
            ],
            child: buildMessageField(
              message: viewModel.messages[index],
              context: context,
              addable: index == viewModel.messages.length - 1,
              index: index,
            ),
          );
        },
      ),
    );
  }

  Widget buildMessageField({
    required SenderMessageModel message,
    required BuildContext context,
    required bool addable,
    required int index,
  }) {
    return Row(
      children: [
        Expanded(
          child: ErTapEffect(
            onTap: () async {
              List<String>? result = await showTextInputDialog(
                context: context,
                textFields: [
                  DialogTextField(
                    hintText: 'Message',
                    keyboardType: TextInputType.text,
                    initialText: message.message,
                  ),
                  DialogTextField(
                    hintText: 'How long in second?',
                    keyboardType: TextInputType.number,
                    initialText: message.second.toString(),
                  ),
                ],
              );

              if (result?.length == 2 && result?[0] != null && result?[1] != null) {
                viewModel.messages[index] = viewModel.messages[index].copyWith(
                  message: result?[0],
                  second: int.tryParse(result?[1] ?? "5") ?? 5,
                );
              }
            },
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: Text(message.message.trim().isEmpty ? "Empty message" : message.message),
              subtitle: buildSecondCounter(index, message),
            ),
          ),
        ),
        if (addable)
          IconButton(
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.error,
            ),
            onPressed: () {
              viewModel.addMessage(
                SenderMessageModel(
                  message: '',
                  second: 5,
                ),
              );
            },
          ),
      ],
    );
  }

  Widget buildSecondCounter(int index, SenderMessageModel message) {
    Widget endWidget = Text("For ${message.second}s");
    if (viewModel.sentMessages.isNotEmpty) {
      if (viewModel.sentMessages.last.index == index) {
        return CountdownTimer(
          endTime: viewModel.sentMessages.last.startFrom.millisecondsSinceEpoch + message.second * 1000,
          widgetBuilder: (context, countdown) {
            return Text("Sent for ${countdown?.sec ?? 0}s");
          },
          endWidget: endWidget,
        );
      }
    }
    return endWidget;
  }
}

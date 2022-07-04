import 'package:innovation/core/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatelessWidget {
  const ViewModelProvider({
    Key? key,
    required this.builder,
    required this.create,
    this.onModelReady,
    this.child,
  }) : super(key: key);

  final Create<T> create;
  final Widget? child;
  final void Function(BuildContext context, T viewModel)? onModelReady;
  final Widget Function(BuildContext context, T viewModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => create(context),
      child: child,
      builder: (context, child) {
        T viewModel = Provider.of<T>(context);
        if (onModelReady != null) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            onModelReady!(context, viewModel);
          });
        }
        return builder(context, viewModel, child);
      },
    );
  }
}

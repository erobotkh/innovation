part of iot_connection_view;

class _IotConnectionMobile extends StatelessWidget {
  final IotConnectionViewModel viewModel;
  const _IotConnectionMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('IotConnectionMobile'),
      ),
    );
  }
}

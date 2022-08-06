part of joystick_view;

class _JoystickTablet extends StatelessWidget {
  final JoystickViewModel viewModel;

  const _JoystickTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('JoystickTablet')),
    );
  }
}
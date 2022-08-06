part of joystick_view;

class _JoystickDesktop extends StatelessWidget {
  final JoystickViewModel viewModel;

  _JoystickDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('JoystickDesktop')),
    );
  }
}
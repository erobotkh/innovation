part of joystick_view;

class _JoystickMobile extends StatefulWidget {
  final JoystickViewModel viewModel;

  _JoystickMobile(this.viewModel);

  @override
  State<_JoystickMobile> createState() => _JoystickMobileState();
}

class _JoystickMobileState extends State<_JoystickMobile> {
  double servoSpeed = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(
          Icons.settings,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        onPressed: () {},
      ),
      appBar: CustomAppBar(
        title: "Joystick",
        action: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bluetooth,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(ConfigConstant.margin2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ErJoystick(
                    size: 168,
                  ),
                  FourButtons(
                    onLeft: () => print('onLeft'),
                    onRight: () => print('onRight'),
                    onUp: () => print('onUp'),
                    onDown: () => print('onDown'),
                  ),
                ],
              ),
            ),
            Container(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Servo:'),
                  Expanded(
                    child: Slider(
                      value: servoSpeed,
                      max: 5,
                      divisions: 5,
                      label: servoSpeed.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          servoSpeed = value;
                        });
                      },
                    ),
                  ),
                  Text(servoSpeed.round().toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

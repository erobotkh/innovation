part of joystick_view;

class _ThumbstickMobile extends StatefulWidget {
  final ThumbstickViewModel viewModel;
  const _ThumbstickMobile(this.viewModel);

  @override
  State<_ThumbstickMobile> createState() => _ThumbstickMobileState();
}

class _ThumbstickMobileState extends State<_ThumbstickMobile> {
  double servoSpeed = 1;

  Future<void> send(String text) async {
    if (kDebugMode) {
      print(text);
    }
  }

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
      appBar: ErCustomAppBar(
        color: M3Color.dayColorsOf(context)[DateTime.friday],
        title: "Thumbstick",
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
                  ErFourButtons(
                    buttonColor: M3Color.dayColorsOf(context)[DateTime.friday],
                    onLeft: () => send('onLeft'),
                    onRight: () => send('onRight'),
                    onUp: () => send('onUp'),
                    onDown: () => send('onDown'),
                  ),
                  ErFourButtons(
                    buttonColor: M3Color.dayColorsOf(context)[DateTime.friday],
                    onLeft: () => send('onLeft'),
                    onRight: () => send('onRight'),
                    onUp: () => send('onUp'),
                    onDown: () => send('onDown'),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Servo:'),
                  Expanded(
                    child: Slider(
                      activeColor: M3Color.dayColorsOf(context)[DateTime.friday],
                      inactiveColor: M3Color.dayColorsOf(context)[DateTime.friday]?.withOpacity(0.54),
                      thumbColor: M3Color.dayColorsOf(context)[DateTime.friday],
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

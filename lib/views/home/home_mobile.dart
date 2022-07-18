part of home;

class _HomeMobile extends StatelessWidget {
  const _HomeMobile({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            surfaceTintColor: Theme.of(context).colorScheme.background,
            backgroundColor: Theme.of(context).colorScheme.background,
            pinned: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.dark_mode),
                  onPressed: () {
                    context.read<ThemeProvider>().toggleThemeMode();
                  },
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.symmetric(
                vertical: ConfigConstant.margin1 + 6,
                horizontal: ConfigConstant.margin2,
              ),
              centerTitle: false,
              title: Row(
                children: [
                  Text(
                    "Top stories",
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: ConfigConstant.margin2),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  ConfigConstant.sizedBoxH0,
                  const Text("Tuesday, November 23"),
                  const SizedBox(height: 2000),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

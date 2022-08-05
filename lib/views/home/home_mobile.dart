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
          buildAppBar(context),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: ConfigConstant.margin2),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                buildBodyItems(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildBodyItems() {
    return [
      ConfigConstant.sizedBoxH0,
      const Text("Tuesday, November 23"),
      const SizedBox(height: 24),
      LayoutBuilder(builder: (context, constraint) {
        return ResponsiveBuilder(
          builder: (context, info) {
            int crossAxisCount = 4;

            if (info.isWatch) crossAxisCount = 1;
            if (info.isMobile) crossAxisCount = 2;
            if (info.isTablet) crossAxisCount = 3;
            if (info.isDesktop) crossAxisCount = 4;

            return MasonryGridView.count(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: HomeCardObject.items.length,
              itemBuilder: (context, index) {
                return buildCard(index, info);
              },
            );
          },
        );
      }),
      ConfigConstant.sizedBoxH2,
    ];
  }

  Widget buildCard(int index, SizingInformation info) {
    HomeCardObject object = HomeCardObject.items[index];
    return ValueListenableBuilder<double?>(
      valueListenable: viewModel.minimumHeightNotifier,
      builder: (context, cardHeight, child) {
        double extentHeight = 0;

        if (info.isWatch) {
          // no logic
        }

        if (info.isMobile) {
          if (index == 0 || index == 4) {
            extentHeight = 48.0;
          }
        }

        if (info.isTablet) {
          if ((index == 2 || index == 3) && cardHeight != null) {
            extentHeight = cardHeight + 8;
          }
        }

        if (info.isDesktop) {
          if ((index == 0 || index == 1) && cardHeight != null) {
            extentHeight = cardHeight + 8;
          }
        }

        return MeasureSize(
          onChange: (size) => viewModel.setCardSize(size.height),
          child: HomeCard(
            object: object,
            backgroundColor: M3Color.dayColorsOf(context)[(index + 1) % 7],
            foregroundColor: M3Color.of(context).onPrimary,
            extentHeight: extentHeight,
          ),
        );
      },
    );
  }

  Widget buildAppBar(BuildContext context) {
    return SliverAppBar(
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
        title: Text(
          "ERobot Cambodia",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
    );
  }
}

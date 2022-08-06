part of ir_remoter_view;

class _IrRemoterMobile extends StatelessWidget {
  final IrRemoterViewModel viewModel;

  const _IrRemoterMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    List<RemotterButtonModel> remoteButtonList =
        RemotterButtonModel.getButtonList(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: const ErBackButton(),
        automaticallyImplyLeading: true,
        title: const Text(
          'IR Remoter',
        ),
        actions: [
          SizedBox(
            height: ConfigConstant.objectHeight2,
            width: ConfigConstant.objectHeight2,
            child: ErTapEffect(
              child: const Icon(Icons.bluetooth),
              onTap: () {},
            ),
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constrant) {
        bool isVertical = constrant.maxHeight > constrant.maxWidth;
        return Center(
          child: Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
              maxWidth: isVertical ? 450 : constrant.maxWidth,
              maxHeight: !isVertical ? 450 : constrant.maxHeight,
            ),
            child: GridView.count(
              padding: const EdgeInsets.symmetric(
                horizontal: 72.0,
                vertical: 16,
              ),
              scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
              crossAxisCount: 3,
              // itemCount: remoteButtonList.length,
              mainAxisSpacing: 0,
              shrinkWrap: true,
              childAspectRatio: 0.9,
              children: List.generate(remoteButtonList.length, (index) {
                RemotterButtonModel remoteButton = remoteButtonList[index];
                return Column(
                  children: [
                    Text(
                      remoteButton.showLabel ? remoteButton.label : '',
                      style: Theme.of(context).textTheme.overline,
                    ),
                    ErTapEffect(
                      onTap: remoteButton.onTap,
                      child: Container(
                        width: ConfigConstant.objectHeight3,
                        height: ConfigConstant.objectHeight3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: remoteButton.color,
                        ),
                        child: remoteButton.child,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Icon(
          Icons.settings,
          color: Theme.of(context).colorScheme.onSurface,
          size: ConfigConstant.iconSize2,
        ),
        onPressed: () {},
      ),
    );
  }
}

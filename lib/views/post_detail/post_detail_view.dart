import 'package:flutter/material.dart';
import 'package:innovation/core/routes/app_router.dart';
import 'package:innovation/widgets/inno_app_bar_title.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class PostDetailView extends StatelessWidget {
  const PostDetailView({
    Key? key,
    @PathParam('id') required this.postId,
  }) : super(key: key);

  final String postId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MorphingAppBar(
        title: const InnoAppBarTitle(overridedTitle: "Detail"),
      ),
      body: Center(
        child: Text(postId),
      ),
    );
  }
}

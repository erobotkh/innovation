import 'package:flutter/material.dart';
import 'package:innovation/core/routes/app_router.dart';
import 'package:innovation/widgets/inno_app_bar_title.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MorphingAppBar(
        title: const InnoAppBarTitle(overridedTitle: "Posts"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          String id = (index + 1).toString();
          return ListTile(
            title: Text("Post $index"),
            subtitle: Text(id),
            onTap: () {
              final router = AutoRouter.of(context).root.innerRouterOf(MainViewRoute.name);
              router?.navigate(PostDetailViewRoute(postId: id));
            },
          );
        },
      ),
    );
  }
}

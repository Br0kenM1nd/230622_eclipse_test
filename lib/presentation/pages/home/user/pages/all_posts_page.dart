import 'package:flutter/material.dart';

import '../../../../../data/models/post/post.dart';
import '../../../../../data/models/user/user.dart';
import '../../../../shared_widgets/post_card.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';
import 'post/post_detail_page.dart';

class AllPostsPage extends StatelessWidget {
  final User user;
  final List<Post> posts;

  const AllPostsPage(
    this.posts,{
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.gray,
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        title: Text(user.username),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: posts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final post = posts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailPage(post: post),
                ),
              );
            },
            child: PostCard(post: post),
          );
        },
      ),
    );
  }
}

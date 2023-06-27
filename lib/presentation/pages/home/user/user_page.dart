import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/show.dart';
import '../../../../data/models/album/album.dart';
import '../../../../data/models/post/post.dart';
import '../../../../data/models/user/user.dart';
import '../../../shared_widgets/album_card.dart';
import '../../../shared_widgets/loader.dart';
import '../../../shared_widgets/post_card.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import 'bloc/user_bloc.dart';
import 'pages/album_detail_page.dart';
import 'pages/all_albums_page.dart';
import 'pages/all_posts_page.dart';
import 'pages/post/post_detail_page.dart';

class UserPage extends StatefulWidget {
  final User user;

  const UserPage({Key? key, required this.user}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late final UserBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<UserBloc>()..add(UserGet(widget.user.id));
  }

  @override
  void dispose() {
    bloc.add(const UserReset());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.gray,
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        title: Text(widget.user.username),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            return const Loader();
          } else if (state is UserLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._userInfo(widget.user),
                  const SizedBox(height: 16),
                  _PostsHeader(state.posts, user: widget.user),
                  _PostsPreview(state.posts),
                  const SizedBox(height: 16),
                  _UserAlbumsHeader(state.albums, user: widget.user),
                  _AlbumsPreview(state.albums),
                ],
              ),
            );
          } else if (state is UserError) {
            Show.error(context, state.error);
            return const SizedBox();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

List<Widget> _userInfo(User user) => [
      Text(
        'Name: ${user.name}',
        style: AppTextStyles.bodyTextStyle,
      ),
      const SizedBox(height: 16),
      Text(
        'Email: ${user.email}',
        style: AppTextStyles.bodyTextStyle,
      ),
      const SizedBox(height: 16),
      Text(
        'Phone: ${user.phone}',
        style: AppTextStyles.bodyTextStyle,
      ),
      const SizedBox(height: 16),
      Text(
        'Website: ${user.website}',
        style: AppTextStyles.bodyTextStyle,
      ),
      const SizedBox(height: 16),
      Text(
        'Working Company',
        style: AppTextStyles.bodyTextStyle,
      ),
      const SizedBox(height: 7),
      Text(
        'Name: ${user.company.name}',
        style: AppTextStyles.bodyTextStyle,
      ),
      const SizedBox(height: 7),
      Text(
        'BS: ${user.company.bs}',
        style: AppTextStyles.bodyTextStyle,
      ),
      const SizedBox(height: 7),
      Text(
        "Catch phase: '${user.company.catchPhrase}'",
        style: AppTextStyles.bodyTextStyle,
      ),
      const SizedBox(height: 16),
      Text(
        'Address',
        style: AppTextStyles.bodyTextStyle,
      ),
      const SizedBox(height: 7),
      Text(
        'City: ${user.address.city}',
        style: AppTextStyles.bodyTextStyle,
      ),
      const SizedBox(height: 7),
      Text(
        'Street: ${user.address.street}',
        style: AppTextStyles.bodyTextStyle,
      ),
    ];

class _PostsPreview extends StatelessWidget {
  final List<Post> posts;

  const _PostsPreview(this.posts);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final post = posts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute(builder: (_) => PostDetailPage(post: post)),
            );
          },
          child: PostCard(post: post),
        );
      },
    );
  }
}

class _PostsHeader extends StatelessWidget {
  final User user;
  final List<Post> posts;

  const _PostsHeader(this.posts, {required this.user, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'User Posts',
            style: AppTextStyles.bodyTextStyle,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (_) => AllPostsPage(posts, user: user),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_right_alt_outlined,
            size: 30,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

class _UserAlbumsHeader extends StatelessWidget {
  final List<AlbumWithPhotos> albums;
  final User user;

  const _UserAlbumsHeader(
    this.albums, {
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'User Albums',
            style: AppTextStyles.bodyTextStyle,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (context) => AllAlbumsPage(albums, user: user),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_right_alt_outlined,
            size: 30,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}

class _AlbumsPreview extends StatelessWidget {
  final List<AlbumWithPhotos> albums;

  const _AlbumsPreview(this.albums);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(
        height: 16,
      ),
      itemBuilder: (context, index) {
        final album = albums[index];
        return GestureDetector(
          onTap: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (_) => AlbumDetailPage(album: album),
              ),
            );
          },
          child: AlbumCard(album: album),
        );
      },
    );
  }
}

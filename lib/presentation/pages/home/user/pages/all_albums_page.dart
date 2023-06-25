import 'package:flutter/material.dart';

import '../../../../../data/models/album/album.dart';
import '../../../../../data/models/user/user.dart';
import '../../../../shared_widgets/album_card.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';
import 'album_detail_page.dart';

class AllAlbumsPage extends StatelessWidget {
  final User user;
  final List<AlbumWithPhotos> albums;

  const AllAlbumsPage(
    this.albums, {
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
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return GestureDetector(
            child: AlbumCard(album: album),
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumDetailPage(album: album),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

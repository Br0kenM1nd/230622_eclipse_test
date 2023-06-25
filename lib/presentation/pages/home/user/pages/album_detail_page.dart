import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/album/album.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_styles.dart';

class AlbumDetailPage extends StatelessWidget {
  final AlbumWithPhotos album;

  const AlbumDetailPage({required this.album, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.gray,
        titleTextStyle: AppTextStyles.title,
        title: Text(album.title),
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: album.photos.length,
          itemBuilder: (context, index, _) {
            final photo = album.photos[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Image(image: NetworkImage(photo.url)),
                  const SizedBox(height: 8),
                  Text(photo.title)
                ],
              ),
            );
          },
          options: CarouselOptions(height: 400),
        ),
      ),
    );
  }
}

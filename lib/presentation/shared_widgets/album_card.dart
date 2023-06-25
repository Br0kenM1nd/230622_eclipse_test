import 'package:flutter/material.dart';

import '../../data/models/album/album.dart';

class AlbumCard extends StatelessWidget {
  final AlbumWithPhotos album;

  const AlbumCard({required this.album, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final thumbSize = (width - (16 * 2)) / 3;
    return Row(
      children: [
        Container(
          width: thumbSize,
          height: thumbSize,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(album.photos.first.thumbnailUrl),
            ),
          ),
        ),
        Expanded(child: Text(album.title)),
      ],
    );
  }
}

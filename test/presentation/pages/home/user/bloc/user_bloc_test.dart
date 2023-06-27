import 'package:bloc_test/bloc_test.dart';
import 'package:eds_test/data/models/album/album.dart';
import 'package:eds_test/data/models/post/post.dart';
import 'package:eds_test/presentation/pages/home/user/bloc/user_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../data/services/mock_data.dart';
import '../../bloc/user_list_bloc_test.mocks.dart';

void main() {
  group('UserBloc', () {
    final api = MockApiService();
    const userId = 1;

    blocTest<UserBloc, UserState>(
      'emits [UserLoaded] when UserGet is added',
      build: () => UserBloc(api),
      setUp: () {
        when(api.getPostsByUserId(userId)).thenAnswer(
          (_) async => ApiServiceMockData.posts.map(Post.fromJson).toList(),
        );
        when(api.getAlbumsByUserIdWithPhotos(userId)).thenAnswer(
          (_) async => ApiServiceMockData.albumWithPhotos
              .map(AlbumWithPhotos.fromJson)
              .toList(),
        );
      },
      act: (bloc) {
        return bloc.add(const UserGet(userId));
      },
      expect: () => [isA<UserLoaded>()],
    );

    blocTest<UserBloc, UserState>(
      'emits [UserError] when ApiService throws an exception',
      build: () => UserBloc(api),
      setUp: () => when(api.getPostsByUserId(userId)).thenThrow(Exception('e')),
      act: (bloc) => bloc.add(const UserGet(userId)),
      expect: () => [isA<UserError>()],
    );
  });
}

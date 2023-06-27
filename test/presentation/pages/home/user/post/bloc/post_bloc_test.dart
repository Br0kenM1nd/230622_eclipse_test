import 'package:bloc_test/bloc_test.dart';
import 'package:eds_test/data/models/comment/comment.dart';
import 'package:eds_test/presentation/pages/home/user/pages/post/bloc/post_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../data/services/mock_data.dart';
import '../../../bloc/user_list_bloc_test.mocks.dart';

void main() {
  group('UserBloc', () {
    final api = MockApiService();
    const userId = 1;

    blocTest<PostBloc, PostState>(
      'emits [UserLoaded] when UserGet is added',
      build: () => PostBloc(api),
      setUp: () {
        when(api.getCommentsByPostId(userId)).thenAnswer(
          (_) async =>
              ApiServiceMockData.comments.map(Comment.fromJson).toList(),
        );
      },
      act: (bloc) => bloc.add(const PostGetComments(userId)),
      expect: () => [isA<PostCommentsLoaded>()],
    );

    blocTest<PostBloc, PostState>(
      'emits [UserError] when ApiService throws an exception',
      build: () => PostBloc(api),
      setUp: () => when(api.getCommentsByPostId(userId)).thenThrow(Exception('e')),
      act: (bloc) => bloc.add(const PostGetComments(userId)),
      expect: () => [isA<PostError>()],
    );
  });
}

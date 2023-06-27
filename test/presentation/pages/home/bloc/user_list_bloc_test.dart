import 'package:bloc_test/bloc_test.dart';
import 'package:eds_test/data/models/user/user.dart';
import 'package:eds_test/data/services/api_service.dart';
import 'package:eds_test/presentation/pages/home/bloc/user_list_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../data/services/mock_data.dart';

@GenerateNiceMocks([MockSpec<ApiService>()])
import 'user_list_bloc_test.mocks.dart';

void main() {
  group('UserListBloc', () {
    final api = MockApiService();

    blocTest<UserListBloc, UserListState>(
      'emits [UserListLoaded] when UserListGet is added',
      build: () => UserListBloc(api),
      setUp: () {
        when(api.getAllUsers()).thenAnswer(
          (_) async => ApiServiceMockData.allUsers.map(User.fromJson).toList(),
        );
      },
      act: (bloc) => bloc.add(const UserListGet()),
      expect: () => [isA<UserListLoaded>()],
    );

    blocTest<UserListBloc, UserListState>(
      'emits [UserListError] when ApiService throws an exception',
      build: () => UserListBloc(api),
      setUp: () => when(api.getAllUsers()).thenThrow(Exception('error')),
      act: (bloc) => bloc.add(const UserListGet()),
      expect: () => [isA<UserListError>()],
    );
  });
}

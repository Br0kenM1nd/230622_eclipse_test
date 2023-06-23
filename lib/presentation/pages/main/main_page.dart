import 'package:eds_test/presentation/pages/user_page.dart';
import 'package:eds_test/presentation/theme/app_colors.dart';
import 'package:eds_test/presentation/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared_widgets/loader.dart';
import 'bloc/user_list_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('All Users'),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state is UserListInitial) {
            return const Loader();
          } else if (state is UserListLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.users.length,
              separatorBuilder: (_, __) => const SizedBox(
                height: 12,
              ),
              itemBuilder: (context, index) {
                final user = state.users[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPage(
                          userModel: user,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: AppColors.gray,
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      horizontalTitleGap: 8,
                      title: Text(
                        user.username,
                        style: AppTextStyles.title,
                      ),
                      subtitle: Text(
                        user.name,
                        style: AppTextStyles.subtitle,
                      ),
                      leading: const Icon(
                        Icons.person,
                        size: 32,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is UserListError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
            return const SizedBox();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

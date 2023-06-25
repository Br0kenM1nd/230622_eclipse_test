import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/show.dart';
import '../../shared_widgets/loader.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'user/user_page.dart';
import 'bloc/user_list_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final UserListBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<UserListBloc>()..add(const UserListGet());
  }

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
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final user = state.users[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserPage(user: user),
                      ),
                    );
                  },
                  child: Container(
                    color: AppColors.gray,
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      horizontalTitleGap: 8,
                      leading: const Icon(
                        Icons.person,
                        size: 32,
                        color: AppColors.white,
                      ),
                      title: Text(user.username, style: AppTextStyles.title),
                      subtitle: Text(user.name, style: AppTextStyles.subtitle),
                    ),
                  ),
                );
              },
            );
          } else if (state is UserListError) {
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

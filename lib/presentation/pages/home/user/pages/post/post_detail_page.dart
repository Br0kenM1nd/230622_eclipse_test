import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/show.dart';
import '../../../../../../data/models/post/post.dart';
import '../../../../../shared_widgets/comment_card.dart';
import '../../../../../shared_widgets/custom_text_field.dart';
import '../../../../../shared_widgets/loader.dart';
import '../../../../../theme/app_colors.dart';
import '../../../../../theme/app_text_styles.dart';
import 'bloc/post_bloc.dart';

class PostDetailPage extends StatefulWidget {
  final Post post;

  const PostDetailPage({required this.post, Key? key}) : super(key: key);

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late final PostBloc bloc;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc = context.read<PostBloc>()..add(PostGetComments(widget.post.id));
  }

  void _postComment() {
    bloc.add(PostAddComment(
      name: nameController.text,
      email: emailController.text,
      comment: commentController.text,
    ));
    Navigator.of(context).pop();
    _clearText();
  }

  void _clearText() {
    nameController.clear();
    emailController.clear();
    commentController.clear();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    commentController.dispose();
    bloc.add(const PostReset());
    super.dispose();
  }

  Future<void> _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          scrollable: true,
          title: const Text('Add new comment'),
          content: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CustomTextField(
                    controller: nameController,
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Name',
                    validatorMessage: 'Name cannot be empty',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: emailController,
                    prefixIcon: const Icon(Icons.email),
                    hintText: 'E-mail',
                    validatorMessage: 'Email cannot be empty',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: commentController,
                    prefixIcon: const Icon(Icons.message),
                    hintText: 'Comment',
                    validatorMessage: 'Comment cannot be empty',
                  )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(child: const Text('Submit'), onPressed: _postComment),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post.title),
        centerTitle: true,
        titleTextStyle: AppTextStyles.title,
        backgroundColor: AppColors.gray,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            return const Loader();
          } else if (state is PostCommentsLoaded) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  widget.post.title,
                  style: AppTextStyles.title.copyWith(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 7),
                Text(
                  widget.post.body,
                  style: AppTextStyles.bodyTextStyle.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Comments:'),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final comment = state.comments[index];
                    return CommentCard(
                      username: comment.name,
                      comment: comment.body,
                      email: comment.email,
                    );
                  },
                  itemCount: state.comments.length,
                ),
              ],
            );
          } else if (state is PostError) {
            Show.error(context, state.error);
            return const SizedBox();
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(context),
        child: const Icon(Icons.add, size: 20),
      ),
    );
  }
}

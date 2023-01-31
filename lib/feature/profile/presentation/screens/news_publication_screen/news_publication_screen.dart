import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megalab_news_app/commons/textStyle_helper.dart';
import 'package:megalab_news_app/commons/theme_helper.dart';
import 'package:megalab_news_app/commons/validates_helper.dart';
import 'package:megalab_news_app/core/global_widgets/custom_button_widget.dart';
import 'package:megalab_news_app/core/global_widgets/custom_snackbar.dart';
import 'package:megalab_news_app/core/global_widgets/loading_indicator_widget.dart';
import 'package:megalab_news_app/core/global_widgets/textfield_with_text_widget.dart';
import 'package:megalab_news_app/core/router/app_router.gr.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/news_publication_screen/local_widgets/category_dropdown_widget.dart';
import 'package:megalab_news_app/feature/profile/presentation/screens/news_publication_screen/local_widgets/load_newscover_widget.dart';

import '../../blocs/create_post_bloc/create_post_bloc.dart';

class NewsPublicationScreen extends StatefulWidget {
  const NewsPublicationScreen({super.key});

  @override
  State<NewsPublicationScreen> createState() => _NewsPublicationScreenState();
}

class _NewsPublicationScreenState extends State<NewsPublicationScreen> {
  File? _imagePost;
  String? _tag;
  late TextEditingController _titleController;
  late TextEditingController _textController;
  late TextEditingController _shortDescController;

  late CreatePostBloc _createPostBloc;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  ValidatesHelper validatesHelper = ValidatesHelper();

  @override
  void initState() {
    _createPostBloc = BlocProvider.of(context);
    _titleController = TextEditingController();
    _textController = TextEditingController();
    _shortDescController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHelper.white,
      appBar: AppBar(
        backgroundColor: ThemeHelper.white,
        elevation: 0,
        actions: [
          IconButton(
            padding: EdgeInsets.only(
              top: 21.5.h,
              right: 21.5.w,
            ),
            onPressed: () => context.router.navigateBack(),
            constraints: const BoxConstraints(),
            icon: const Icon(
              Icons.close_outlined,
              color: ThemeHelper.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 34.w,
              right: 23.w,
              bottom: 100.h,
            ),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LoadNewsCoverWidget(
                    callback: ((profileImage) => setState(
                          () => _imagePost = profileImage,
                        )),
                  ),
                  SizedBox(height: 16.h),
                  TextFieldWithTextWidget(
                    title: 'Заголовок',
                    constraints: BoxConstraints(
                      maxHeight: 35.h,
                      maxWidth: 263.w,
                    ),
                    controller: _titleController,
                    radius: 5,
                    validate: (value) =>
                        validatesHelper.titleValidate(value!, 'загаловок'),
                  ),
                  SizedBox(height: 16.h),
                  TextFieldWithTextWidget(
                    title: 'Краткое описание',
                    constraints: BoxConstraints(
                      maxHeight: 35.h,
                      maxWidth: 263.w,
                      minHeight: 35.h,
                      minWidth: 263.w,
                    ),
                    controller: _shortDescController,
                    radius: 5,
                    validate: (value) =>
                        validatesHelper.titleValidate(value!, 'описание'),
                  ),
                  SizedBox(height: 16.h),
                  TextFieldWithTextWidget(
                    title: 'Текст новости',
                    constraints:
                        BoxConstraints(maxHeight: 95.h, maxWidth: 263.w),
                    controller: _textController,
                    maxLines: 100,
                    radius: 5,
                    validate: (value) =>
                        validatesHelper.titleValidate(value!, 'текст'),
                  ),
                  SizedBox(height: 16.h),
                  CategoryDropDownWidget(
                    title: 'Выбрать категорию',
                    width: 263.w,
                    height: 35.h,
                    textStyle: TextStyleHelper.f16w400.copyWith(
                      color: ThemeHelper.black,
                    ),
                    callback: ((tag) => setState(
                          () => _tag = tag,
                        )),
                  ),
                  SizedBox(height: 38.h),
                  BlocConsumer<CreatePostBloc, CreatePostState>(
                    listener: (context, state) {
                      if (state is ErrorCreatePostState) {
                        showCustomSnackBar(context, state.message);
                      }
                      if (state is LoadedCreatePostState) {
                        context.router.replace(const ProfileScreenRoute());
                        _titleController.dispose();
                        _textController.dispose();
                        _shortDescController.dispose();
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingCreatePostState) {
                        return const Center(
                          child: LoadingIndicatorWidget(size: 30),
                        );
                      }
                      return Align(
                        alignment: Alignment.topCenter,
                        child: CustomButtonWidget(
                          txtButton: 'Создать',
                          width: 191.w,
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _createPostBloc.add(
                                CreateNewsPostEvent(
                                  title: _titleController.text,
                                  text: _textController.text,
                                  image: _imagePost,
                                  tag: _tag!,
                                  shortDesc: _shortDescController.text,
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

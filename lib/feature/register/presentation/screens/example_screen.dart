import 'package:flutter/material.dart';
import 'package:megalab_news_app/feature/register/domain/entities/user_entities.dart';

class ExampleScreen extends StatefulWidget {
  final UserEntity userEntity;
  const ExampleScreen({super.key, required this.userEntity});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: RefreshIndicator(
              onRefresh: () async {
                setState(() {});
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.userEntity.id.toString()),
                  Text(widget.userEntity.nickname),
                  Text(widget.userEntity.name),
                  Text(widget.userEntity.lastName),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

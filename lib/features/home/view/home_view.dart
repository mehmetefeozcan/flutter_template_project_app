import 'package:flutter_template_project_app/features/home/store/home_store.dart';
import 'package:flutter_template_project_app/core/base/base_store.dart';
import 'package:flutter_template_project_app/core/base/base_view.dart';
import 'package:flutter_template_project_app/core/di/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseViewMixin<HomeView> {
  HomeStore? _store;

  @override
  BaseStore? get store => _store;

  @override
  Future<void> onInit() async {
    _store = getIt<HomeStore>();
    await _store!.initApp();
  }

  @override
  Widget build(BuildContext context) {
    if (_store == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Observer(
        builder: (context) {
          if (_store!.isLoading) {
            return buildLoading();
          } else {
            if (_store!.userList != null) {
              return buildNameList();
            } else {
              return buildErrorMessage();
            }
          }
        },
      ),
    );
  }

  Widget buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget buildNameList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _store!.userList?.length ?? 0,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Text(
          "Merhaba ${_store!.userList?[index].firstName}",
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    );
  }

  Widget buildErrorMessage() {
    return Center(
      child: Text(
        "Hata: ${_store!.errorMessage}",
        style: TextStyle(fontSize: 16.sp),
      ),
    );
  }
}

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_template_project_app/features/home/store/home_store.dart';
import 'package:flutter_template_project_app/core/base/base_view.dart';
import 'package:flutter_template_project_app/core/di/locator.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseViewMixin<HomeView> {
  @override
  late final HomeStore store;

  @override
  Future<void> onInit() async {
    store = getIt<HomeStore>();

    await store.initApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          if (store.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (store.userList != null) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: store.userList?.length ?? 0,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  child: Text(
                    "Merhaba ${store.userList?[index].firstName}",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ),
              );
            } else {
              return Center(
                child: Text(
                  "Hata: ${store.errorMessage}",
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_task/constants/colors.dart';
import 'package:my_task/controllers/repo_controller.dart';

class RepoScreen extends StatelessWidget {
  const RepoScreen({super.key});

  static RepoController repoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 16.w),
          child: GetBuilder<RepoController>(
              id: 'updateRepos',
              builder: (controller) {
                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    for (int i = 0; i < controller.repoList.length; i++)
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            title: Text(
                              controller.repoList[i].name ?? '',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            subtitle: Text(
                                controller.repoList[i].description ?? '',
                                style: TextStyle(color: Colors.black87)),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    '${controller.repoList[i].stargazersCount}star',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14)),
                                SizedBox(
                                  width: 78.w,
                                  child: Text(
                                    controller.repoList[i].updatedAt
                                            .toString() ??
                                        '',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            tileColor: grey),
                      ),
                  ],
                );
              })),
    );
  }
}

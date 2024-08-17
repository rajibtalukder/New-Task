import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_task/controllers/repo_controller.dart';
import 'package:my_task/controllers/theme_controller.dart';
import 'package:my_task/views/repo_screen.dart';
import 'package:my_task/widgets/custom_button.dart';
import 'package:my_task/widgets/custom_text_field.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});

   ThemeController themeController = Get.put(ThemeController());
   RepoController repoController = Get.put(RepoController());

  TextEditingController _userNameCntlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task'),
        actions: [
          Obx(()=> Switch(
            activeColor: Colors.white,
                value: themeController.isDarkTheme.value, onChanged: (i){
                  themeController.changeTheme();
            }),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField(
              _userNameCntlr,
              hintText: 'Enter Github Username :',
            ),
            SizedBox(height: 30.h),
            customButton('Search', textSize: 20, height: 46, onPressed: () {
              repoController.getUserRepos(_userNameCntlr.text);
              //Get.to(const RepoScreen());
            })
          ],
        ),
      ),
    );
  }
}

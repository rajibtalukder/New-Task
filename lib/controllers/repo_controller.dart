
import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_task/models/repo_model.dart';
import 'package:my_task/utils/utils.dart';
import 'package:my_task/views/repo_screen.dart';

import '../api_service/api_client.dart';

class RepoController extends GetxController {
  List<RepoModel> repoList = [];

  Future<void> getUserRepos(String userName) async {
    try {
      Utils.showLoading();
      var response = await ApiClient().get('$userName/repos');
      var jsonResponse = jsonDecode(response) as List;
      repoList = jsonResponse.map((repo) => RepoModel.fromJson(repo)).toList();
      Get.to(RepoScreen());
      //Utils.hidePopup();
    } catch (e) {
      print("Error fetching user repos: $e");
    }
  }
}
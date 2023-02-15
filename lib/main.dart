import 'package:flutter/material.dart';
import 'package:test_near/src/core/injections/app_injections.dart';

import 'package:test_near/src/github_search_user.dart';

void main() {
  AppInjections.injectionsInit();
  runApp(const GithubSearchUser());
}

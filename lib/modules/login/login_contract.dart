import 'package:open_screener/base/mvp.dart';

abstract class LoginPresenter implements BasePresenter {
  login(String email, String password);
}

abstract class LoginView implements BaseView<LoginPresenter> {
  void navigateToSchoolList();
  void showException(String exception);
}
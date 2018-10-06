import 'package:open_screener/modules/login/login_contract.dart';
import 'package:open_screener/util/auth_util.dart';

class LoginPresenterImpl implements LoginPresenter {
  LoginView _loginView;

  LoginPresenterImpl(this._loginView) {
    _loginView.setPresenter(this);
  }

  @override
  init() {}

  @override
  login(String email, String password) {
    AuthUtil.handleSignInEmail(email, password).then((firebaseUser) {
      if (firebaseUser != null) {
        print("The user id is: " + firebaseUser.uid);
        _loginView.navigateToSchoolList();
      } else {
        _loginView.showException("Login unsuccesful.");
      }
    });
  }
}

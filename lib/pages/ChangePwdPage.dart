import 'package:LFS/helpers/api.dart';
import 'package:LFS/helpers/validators.dart';
import 'package:LFS/pages/SigninPage.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/ChangePassword.dart';
import 'package:LFS/widget/atoms/VerifyCode.dart';
import 'package:LFS/widget/atoms/VerifyIdentity.dart';
import 'package:flutter/material.dart';

class CPassword extends StatefulWidget {
  @override
  _CPasswordState createState() => _CPasswordState();
}

class _CPasswordState extends State<CPassword> {
  String password, passwordErr;
  String passwordAgain, passwordAgainErr;
  String mail, mailErr;
  String code, codeErr;
  bool codeSent = false;
  bool verified = false;
  bool isButtonActive = false;
  String title = "Verify Identity";

  handlePassword(value) {
    setState(() {
      password = value;
    });
    if (pwdValidator(value))
      setState(() {
        passwordErr = null;
      });
    else
      passwordErr =
          "Password not valid! Use AlphaNumeric with special symbols!";
  }

  handlePasswordAgain(value) {
    setState(() {
      passwordAgain = value;
    });
    if (pwdValidator(value) && value == password) {
      setState(() {
        passwordAgainErr = null;
      });
    } else
      setState(() {
        passwordAgainErr = "Password do not match!";
      });
  }

  handleMail(value) {
    setState(() {
      mail = value;
    });
    if (emailValidator(value))
      setState(() {
        mailErr = null;
      });
    else
      setState(() {
        mailErr = "Email is not valid!";
      });
  }

  handleCode(value) {
    setState(() {
      code = value;
    });
    if (value.length > 0)
      setState(() {
        codeErr = null;
      });
    else
      setState(() {
        codeErr = "Code is not valid!";
      });
  }

  handleSendActivationCode() {
    setState(() {
      isButtonActive = true;
    });
    sendActivationCode(mail).then((data) {
      if (data['error'] == null) {
        setState(() {
          codeSent = true;
          isButtonActive = false;
          title = "Enter Activation Code";
        });
      } else {
        setState(() {
          isButtonActive = false;
        });
      }
    });
  }

  handleVerifyCode() {
    setState(() {
      isButtonActive = true;
    });
    verifyActivationCode(code, mail).then((data) {
      print(data);
      if (data['result']) {
        setState(() {
          verified = true;
          isButtonActive = false;
          title = "Change Password";
        });
      } else {
        setState(() {
          isButtonActive = false;
        });
      }
    });
  }

  handleChangePassword() {
    if (pwdValidator(password) && password == passwordAgain) {
      setState(() {
        isButtonActive = true;
      });
      changePassword(code, mail, password).then((data) {
        print(data);
        if (data['error'] == null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInPage()));
        }
        setState(() {
          isButtonActive = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: FAppbar(
              leadingChoice: false,
              search: false,
              title: title,
            )),
        body: codeSent
            ? verified
                ? ChangePassword(
                    handleChangePassword: handleChangePassword,
                    handlePassword: handlePassword,
                    isButtonActive: isButtonActive,
                    passwordErr: passwordErr,
                    passwordAgainErr: passwordAgainErr,
                    handlePasswordAgain: handlePasswordAgain,
                  )
                : VerifyCode(
                    handleCode: handleCode,
                    handleVerifyCode: handleVerifyCode,
                    codeErr: codeErr,
                    isButtonActive: isButtonActive,
                  )
            : VerifyIdentity(
                handleMail: handleMail,
                handleSendActivationCode: handleSendActivationCode,
                mailErr: mailErr,
                isButtonActive: isButtonActive,
              ),
      ),
    );
  }
}

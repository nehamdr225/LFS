import 'package:LFS/helpers/api.dart';
import 'package:LFS/helpers/validators.dart';
import 'package:LFS/pages/SigninPage.dart';
import 'package:LFS/widget/atoms/Appbar.dart';
import 'package:LFS/widget/atoms/FForm.dart';
import 'package:LFS/widget/atoms/PasswordForm.dart';
import 'package:flutter/material.dart';
import 'package:LFS/widget/atoms/FLogo.dart';

class CPassword extends StatefulWidget {
  @override
  _CPasswordState createState() => _CPasswordState();
}

class _CPasswordState extends State<CPassword> {
  String password, passwordErr;
  String mail, mailErr;
  String code, codeErr;
  bool codeSent = false;
  bool verified = false;
  bool isButtonActive = false;

  handlePassword(value) {
    print(value);
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

  handleMail(value) {
    print(value);
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
      print(data);
      if (data['error'] == null) {
        setState(() {
          codeSent = true;
          isButtonActive = false;
        });
      } else
        setState(() {
          isButtonActive = false;
        });
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
        });
      } else
        setState(() {
          isButtonActive = false;
        });
    });
  }

  handleChangePassword() {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: FAppbar(
              leadingChoice: false,
              search: false,
              title: "Reset Password",
            )),
        body: ListView(
          children: codeSent
              ? verified
                  ? <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        child: FLogo(text: ''),
                      ),
                      PasswordForm(
                        text: 'Password',
                        onChanged: handlePassword,
                        error: passwordErr,
                        // icon: Icons.lock,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                      ),
                      PasswordForm(
                        text: 'Password Again',
                        onChanged: handlePassword,
                        error: passwordErr,
                        // icon: Icons.lock,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: isButtonActive
                            ? CircularProgressIndicator()
                            : RaisedButton(
                                onPressed: handleChangePassword,
                                child: Text(
                                  "Change Password",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                      )
                    ]
                  : [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.0),
                        child: FLogo(text: ''),
                      ),
                      FForm(
                        text: 'Activation Code',
                        onChanged: handleCode,
                        error: codeErr,
                        autofocus: true,
                        // icon: Icons.lock,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: isButtonActive
                            ? CircularProgressIndicator()
                            : RaisedButton(
                                onPressed: handleVerifyCode,
                                child: Text(
                                  "Verify Activation Code",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16.0),
                                ),
                              ),
                      )
                    ]
              : <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.0),
                    child: FLogo(text: ''),
                  ),
                  FForm(
                    text: 'Email',
                    onChanged: handleMail,
                    error: mailErr,
                    autofocus: true,
                    // icon: Icons.lock,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: isButtonActive
                        ? CircularProgressIndicator()
                        : RaisedButton(
                            onPressed: handleSendActivationCode,
                            child: Text(
                              "Send Activation Code",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                  )
                ],
        ),
      ),
    );
  }
}

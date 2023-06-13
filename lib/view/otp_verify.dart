import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/otp_verify_model.dart';

class OTPVerify extends StatefulWidget {
  final phoneNo;
  const OTPVerify(this.phoneNo);

  @override
  State<OTPVerify> createState() => _OTPVerifyState();
}

class _OTPVerifyState extends State<OTPVerify> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _OTPController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _OTPController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<OTPVerifyModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      //  backgroundColor: Color(0xff50B8E7),
      // appBar: AppBar(title: Text("Login")),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Text(
              "ENTER OTP",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Enter the OTP we just send to your phone \n then start reset your new password",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0,
                  color: Color(0xffA29EB5),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40.0,
            ),
            // TextFormField(
            //   controller: _OTPController,
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(
            //     hintText: 'Mobile',
            //     //  label: Text('Email'),
            //     prefixIcon: Icon(Icons.phone_outlined),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //           width: 1, color: Color(0xff3D3989)), //<-- SEE HERE
            //       borderRadius: BorderRadius.circular(50.0),
            //     ),
            //     disabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //           width: 1, color: Color(0xff3D3989)), //<-- SEE HERE
            //       borderRadius: BorderRadius.circular(50.0),
            //     ),
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: BorderSide(
            //           width: 1, color: Color(0xff3D3989)), //<-- SEE HERE
            //       borderRadius: BorderRadius.circular(50.0),
            //     ),
            //   ),
            //   onFieldSubmitted: (val) {
            //     Utils.fieldFocusChange(
            //         context, emailFocusNode, passwordFocusNode);
            //   },
            // ),
            OtpTextField(
              numberOfFields: 4,
              margin: EdgeInsets.all(10),
              fieldWidth: 50.0,
              borderColor: Color(0xff50B8E7),

              borderWidth: 2.0,

              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                _OTPController.text = verificationCode.toString();
                // showDialog(
                //     context: context,
                //     builder: (context){
                //       return AlertDialog(
                //         title: Text("Verification Code"),
                //         content: Text('Code entered is $verificationCode'),
                //       );
                //     }
                // );
              }, // end onSubmit
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundButton(
                title: 'Continue',
                loading: authViewMode.loading,
                onPress: () {
                  if (_OTPController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter OTP', context);
                  } else if (_OTPController.text.length < 4) {
                    Utils.flushBarErrorMessage(
                        'Please enter 4 digit OTP', context);
                  } else {
                    // Map data = {
                    //   'email': _emailController.text.toString(),
                    //   'password': _passwordController.text.toString()
                    // };
                    Map data = {
                      'mobile': widget.phoneNo['mobile'].toString(),
                      'otp': _OTPController.text.toString(),
                    };
                    authViewMode.loginApi(data, context);

                    print('api hit');
                  }
                }),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Resend OTP ",
                    style: TextStyle(
                        color: Color(0xff1C1244),
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
                Text("in 00:30s",
                    style: TextStyle(
                        color: Color(0xffA29EB5),
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      )),

      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     TextFormField(
      //       controller: _emailController,
      //       keyboardType: TextInputType.emailAddress,
      //       decoration: InputDecoration(
      //           hintText: 'Email',
      //           label: Text('Email'),
      //           prefixIcon: Icon(Icons.alternate_email)),
      //       onFieldSubmitted: (val) {
      //         Utils.fieldFocusChange(
      //             context, emailFocusNode, passwordFocusNode);
      //       },
      //     ),
      //     ValueListenableBuilder(
      //         valueListenable: _obsecurePassword,
      //         builder: (context, value, child) {
      //           return TextFormField(
      //             controller: _passwordController,
      //             obscureText: _obsecurePassword.value,
      //             focusNode: passwordFocusNode,
      //             obscuringCharacter: "*",
      //             decoration: InputDecoration(
      //               hintText: 'Password',
      //               label: Text('Password'),
      //               prefixIcon: Icon(Icons.lock_open_outlined),
      //               suffixIcon: InkWell(
      //                   onTap: () {
      //                     _obsecurePassword.value =
      //                         !_obsecurePassword.value;
      //                   },
      //                   child: _obsecurePassword.value
      //                       ? Icon(Icons.visibility_off_outlined)
      //                       : Icon(Icons.visibility)),
      //             ),
      //           );
      //         }),
      //     SizedBox(
      //       height: height * .085,
      //     ),
      //     RoundButton(
      //         title: 'Login',
      //         loading: authViewMode.loading,
      //         onPress: () {
      //           if (_emailController.text.isEmpty) {
      //             Utils.flushBarErrorMessage('Please enter email', context);
      //           } else if (_passwordController.text.isEmpty) {
      //             Utils.flushBarErrorMessage(
      //                 'Please enter password', context);
      //           } else if (_passwordController.text.length < 6) {
      //             Utils.flushBarErrorMessage(
      //                 'Please enter 6 digit password', context);
      //           } else {
      //             // Map data = {
      //             //   'email': _emailController.text.toString(),
      //             //   'password': _passwordController.text.toString()
      //             // };
      //             Map data = {
      //               'email': 'eve.holt@reqres.in',
      //               'password': 'cityslicka'
      //             };
      //             authViewMode.loginApi(data, context);
      //
      //             print('api hit');
      //           }
      //         }),
      //     SizedBox(
      //       height: height * .02,
      //     ),
      //     InkWell(
      //         onTap: () {
      //           Navigator.pushNamed(context, RoutesName.signUp);
      //         },
      //         child: Text("Don't hace an account? Sign Up"))
      //   ],
      // ),
    );
  }
}

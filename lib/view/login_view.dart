import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/auth_view_model.dart';
import '../res/components/round_button.dart';
import '../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        backgroundColor: Color(0xff50B8E7),
        // appBar: AppBar(title: Text("Login")),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 110.0,
              ),
              Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  )),
              SizedBox(
                height: 6.0,
              ),
              Text(
                "Daily Profit",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12.0,
              ),
              Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView(
                        //    crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Hi, there! Nice to see you again.",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "Mobile Number",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: 'Mobile',
                              //  label: Text('Email'),
                              prefixIcon: Icon(Icons.phone_outlined),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff3D3989)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff3D3989)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff3D3989)), //<-- SEE HERE
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                            // onFieldSubmitted: (val) {
                            //   Utils.fieldFocusChange(
                            //       context, emailFocusNode, );
                            // },
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          RoundButton(
                              title: 'Sign In',
                              loading: authViewMode.loading,
                              onPress: () {
                                if (_emailController.text.isEmpty) {
                                  Utils.flushBarErrorMessage(
                                      'Please enter Phone No', context);
                                } else if (_emailController.text.length < 10 ||
                                    _emailController.text.length > 10) {
                                  Utils.flushBarErrorMessage(
                                      'Please enter 10 digit mobile number',
                                      context);
                                } else {
                                  Map data = {
                                    'mobile': _emailController.text.toString(),
                                  };
                                  authViewMode.loginApi(data, context);

                                  print('api hit');
                                }
                              }),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}

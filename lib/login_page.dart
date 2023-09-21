import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lightning_food_mobile/constants/app_colors.dart';
import 'package:lightning_food_mobile/constants/app_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xfffff9ea),
            borderRadius: BorderRadius.circular(32),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 27),
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              // 'Poppins',
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              height: 3.0,
                              color: const Color(0xff1e1b1c),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 107),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 84),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 22),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 16),
                                                child: Text(
                                                  'Welcome back!',
                                                  style: GoogleFonts.poppins(
                                                    // 'Poppins',
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.5,
                                                    color:
                                                        const Color(0xff000000),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Happy to see you again, Please log in below',
                                                style: GoogleFonts.poppins(
                                                  // 'Poppins',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.5,
                                                  color:
                                                      const Color(0xff4c4c4c),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 24),
                                                width: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      margin: const EdgeInsets
                                                          .fromLTRB(
                                                          0, 0, 0, 12),
                                                      width: double.infinity,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                const EdgeInsets
                                                                    .fromLTRB(
                                                                    0, 0, 0, 4),
                                                            child: Text(
                                                              'Email Address',
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                // 'Poppins',
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: 1.5,
                                                                color: const Color(
                                                                    0xff1e1b1c),
                                                              ),
                                                            ),
                                                          ),
                                                          TextField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                            decoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                      .fromLTRB(
                                                                      16,
                                                                      19,
                                                                      16,
                                                                      19),
                                                              hintText:
                                                                  'e.g. kayjay@gmail.com',
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Color(
                                                                        0xff000000)),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Color(
                                                                        0xff000000)),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide: const BorderSide(
                                                                    color: Color(
                                                                        0xff000000)),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                double.infinity,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  margin: const EdgeInsets
                                                                      .fromLTRB(
                                                                      0,
                                                                      15,
                                                                      0,
                                                                      4),
                                                                  child: Text(
                                                                    'Password',
                                                                    style: GoogleFonts
                                                                        .poppins(
                                                                      // 'Poppins',
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height:
                                                                          1.5,
                                                                      color: const Color(
                                                                          0xff1e1b1c),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .fromLTRB(
                                                                          12,
                                                                          12,
                                                                          16,
                                                                          8),
                                                                  width: double
                                                                      .infinity,
                                                                  height: 56,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    border: Border.all(
                                                                        color: const Color(
                                                                            0xff000000)),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            TextField(
                                                                          obscureText:
                                                                              !_isPasswordVisible,
                                                                          decoration:
                                                                              const InputDecoration(
                                                                            hintText:
                                                                                'Enter your password',
                                                                            border:
                                                                                InputBorder.none,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      IconButton(
                                                                        icon: Icon(_isPasswordVisible
                                                                            ? Icons.visibility_off
                                                                            : Icons.visibility),
                                                                        onPressed:
                                                                            () {
                                                                          setState(
                                                                              () {
                                                                            _isPasswordVisible =
                                                                                !_isPasswordVisible;
                                                                          });
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  // Add the function you want to execute when the text is pressed
                                                  // For example, you can navigate to another screen or perform some action.
                                                },
                                                style: TextButton.styleFrom(
                                                  foregroundColor:
                                                      const Color(0xff000000),
                                                  textStyle:
                                                      GoogleFonts.poppins(
                                                    // 'Poppins',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.5,
                                                  ),
                                                ),
                                                child: const Text(
                                                    'Forgot Password?'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  AppButton(
                                    height: 48, // Specify the desired height
                                    width: double
                                        .infinity, // Adjust the width as needed
                                    buttonText: 'Login',
                                    onTap: () {
                                      // Add the function you want to execute when the button is pressed
                                    },
                                    buttonColor: const Color(0xff28289f),
                                  ), // ElevatedButton(
                                  //   onPressed: () {
                                  //     // Add the function you want to execute when the button is pressed
                                  //   },
                                  //   style: ElevatedButton.styleFrom(
                                  //     backgroundColor: const Color(0xff28289f),
                                  //     shape: RoundedRectangleBorder(
                                  //       borderRadius: BorderRadius.circular(8),
                                  //     ),
                                  //     shadowColor: const Color(0xff000000),
                                  //     elevation:
                                  //         4, // Adjust the elevation value for the shadow
                                  //   ),
                                  //   child: SizedBox(
                                  //     width: double.infinity,
                                  //     height: 48,
                                  //     child: Center(
                                  //       child: Text(
                                  //         'Login',
                                  //         style: SafeGoogleFont(
                                  //           'Poppins',
                                  //           fontSize: 16,
                                  //           fontWeight: FontWeight.w600,
                                  //           height: 1.5,
                                  //           color: const Color(0xffffffff),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                style: GoogleFonts.poppins(
                                  // 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5,
                                  color: const Color(0xff1b1c1e),
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Don’t Have an Account? ',
                                  ),
                                  TextSpan(
                                    text: 'Create account',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Add the function you want to execute when "Create account" is pressed
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hydroponics/features/Dashboard/DashBoard.dart';

// class LoginRegister extends StatefulWidget {
//   @override
//   LoginRegisterState createState() {
//     return LoginRegisterState();
//   }
// }

// class LoginRegisterState extends State<LoginRegister>
//     with SingleTickerProviderStateMixin {
//   bool isLogin = true;
//   bool isVisible = true;
//   Animation<double> loginSize;
//   AnimationController loginController;
//   AnimatedOpacity opacityAnimation;
//   Duration animationDuration = Duration(milliseconds: 270);

//   void _toggleVisibility() {
//     setState(() {
//       isVisible = !isVisible;
//     });
//   }

//   @override
//   void initState() {
//     // isVisible = true;
//     super.initState();

//     SystemChrome.setEnabledSystemUIOverlays([]);

//     loginController =
//         AnimationController(vsync: this, duration: animationDuration);

//     opacityAnimation =
//         AnimatedOpacity(opacity: 0.0, duration: animationDuration);
//   }

//   @override
//   void dispose() {
//     loginController.dispose();
//     super.dispose();
//   }

//   Widget _buildLoginWidgets() {
//     return Container(
//       padding: EdgeInsets.only(bottom: 62, top: 32),
//       width: MediaQuery.of(context).size.width,
//       height: loginSize.value,
//       decoration: BoxDecoration(
//           color: Colors.lightGreen,
//           borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(190),
//               bottomRight: Radius.circular(190))),
//       child: Align(
//         alignment: Alignment.bottomCenter,
//         child: AnimatedOpacity(
//           opacity: loginController.value,
//           duration: animationDuration,
//           child: GestureDetector(
//             onTap: isLogin
//                 ? null
//                 : () {
//                     loginController.reverse();

//                     setState(() {
//                       isLogin = !isLogin;
//                     });
//                   },
//             child: Container(
//               child: Text(
//                 'log in'.toUpperCase(),
//                 style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLoginComponents() {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Visibility(
//           visible: isLogin,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 42, right: 42),
//             child: Column(
//               children: <Widget>[
//                 TextField(
//                   style: TextStyle(color: Colors.white, height: 1.0),
//                   decoration: InputDecoration(
//                       prefixIcon: Icon(Icons.email),
//                       hintText: 'Email',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(32)))),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 16, top: 16),
//                   child: TextField(
//                     obscureText: isVisible,
//                     style: TextStyle(color: Colors.black, height: 1.5),
//                     decoration: InputDecoration(
//                       hintText: 'Password',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(32))),
//                       prefixIcon: Icon(Icons.vpn_key),
//                       suffixIcon: GestureDetector(
//                         onTap: () {
//                           _toggleVisibility();
//                         },
//                         child: Icon(isVisible
//                             ? Icons.visibility_off
//                             : Icons.visibility),
//                       ),
//                       isDense: true,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 200.0,
//                   height: 40,
//                   margin: EdgeInsets.only(top: 32),
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.all(Radius.circular(50))),
//                   child: InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) {
//                         return MainMenu();
//                       }));
//                     },
//                     child: Center(
//                       child: Text(
//                         'LOG IN',
//                         style: TextStyle(
//                             color: Colors.lightGreen,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(top: 30.0),
//                 //    child: _buildSignInWithText(),
//                 // ),
//                 // _buildSocialBtnRow()
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // Widget _buildSignInWithText() {
//   //   return Column(
//   //     children: <Widget>[
//   //       Text(
//   //         '- OR -',
//   //         style: TextStyle(
//   //           color: Colors.white,
//   //           fontWeight: FontWeight.w400,
//   //           fontFamily: 'OpenSans',
//   //         ),
//   //       ),
//   //       SizedBox(height: 20.0),
//   //       Text('Sign in with',
//   //           style: TextStyle(
//   //             color: Colors.white,
//   //             fontWeight: FontWeight.bold,
//   //             fontFamily: 'OpenSans',
//   //           )),
//   //     ],
//   //   );
//   // }

//   // Widget _buildSocialBtn(Function onTap, AssetImage logo) {
//   //   return GestureDetector(
//   //     onTap: onTap,
//   //     child: Container(
//   //       height: 60.0,
//   //       width: 60.0,
//   //       decoration: BoxDecoration(
//   //         shape: BoxShape.circle,
//   //         color: Colors.white,
//   //         boxShadow: [
//   //           BoxShadow(
//   //             color: Colors.black26,
//   //             offset: Offset(0, 2),
//   //             blurRadius: 6.0,
//   //           ),
//   //         ],
//   //         image: DecorationImage(image: logo, fit: BoxFit.fill),
//   //       ),
//   //     ),
//   //   );
//   // }

//   // Widget _buildSocialBtnRow() {
//   //   return Padding(
//   //     padding: EdgeInsets.symmetric(vertical: 10.0),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //     ),
//   //   );
//   // }

//   Widget _buildRegistercomponents() {
//     return Padding(
//       padding: EdgeInsets.only(left: 42, right: 42, top: 42, bottom: 20),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           // Padding(
//           //   padding: const EdgeInsets.only(bottom: 32),
//           //   child: Text(
//           //     'Sign Up'.toUpperCase(),
//           //     style: TextStyle(
//           //         fontSize: 32,
//           //         fontWeight: FontWeight.bold,
//           //         color: Colors.lightGreen),
//           //   ),
//           // ),
//           TextField(
//             style: TextStyle(color: Colors.black, height: 1.0),
//             decoration: InputDecoration(
//                 prefixIcon: Icon(
//                   Icons.email,
//                 ),
//                 hintText: 'Email',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(32)))),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 16, top: 16),
//             child: TextField(
//               style: TextStyle(color: Colors.black, height: 1.0),
//               decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.local_phone),
//                   hintText: 'Phone Number',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(32)))),
//             ),
//           ),
//           TextField(
//             style: TextStyle(color: Colors.black, height: 1.0),
//             decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.location_on),
//                 hintText: 'Address',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(32)))),
//           ),

//           Padding(
//             padding: const EdgeInsets.only(bottom: 16, top: 16),
//             child: TextField(
//               obscureText: isVisible,
//               style: TextStyle(color: Colors.black, height: 1.5),
//               decoration: InputDecoration(
//                 hintText: 'Password',
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(32))),
//                 prefixIcon: Icon(Icons.vpn_key),
//                 suffixIcon: GestureDetector(
//                   onTap: () {
//                     _toggleVisibility();
//                   },
//                   child:
//                       Icon(isVisible ? Icons.visibility_off : Icons.visibility),
//                 ),
//                 isDense: true,
//               ),
//             ),
//           ),
//           TextField(
//             obscureText: isVisible,
//             style: TextStyle(color: Colors.black, height: 1.5),
//             decoration: InputDecoration(
//               hintText: 'Confirm Password',
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(32))),
//               prefixIcon: Icon(Icons.vpn_key),
//               suffixIcon: GestureDetector(
//                 onTap: () {
//                   _toggleVisibility();
//                 },
//                 child:
//                     Icon(isVisible ? Icons.visibility_off : Icons.visibility),
//               ),
//               isDense: true,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 24),
//             child: Container(
//               width: 200,
//               height: 40,
//               margin: EdgeInsets.only(top: 32),
//               decoration: BoxDecoration(
//                   color: Colors.lightGreen,
//                   borderRadius: BorderRadius.all(Radius.circular(50))),
//               child: Center(
//                 child: Text(
//                   'SIGN UP',
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double _defaultLoginSize = MediaQuery.of(context).size.height / 1.6;

//     loginSize = Tween<double>(begin: _defaultLoginSize, end: 200).animate(
//         CurvedAnimation(parent: loginController, curve: Curves.linear));

//     return Scaffold(
//       resizeToAvoidBottomPadding: false,
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: <Widget>[
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: AnimatedOpacity(
//               opacity: isLogin ? 0.0 : 1.0,
//               duration: animationDuration,
//               child: Container(child: _buildRegistercomponents()),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               color: isLogin && !loginController.isAnimating
//                   ? Colors.white
//                   : Colors.transparent,
//               width: MediaQuery.of(context).size.width,
//               height: _defaultLoginSize / 1.5,
//               child: Visibility(
//                 visible: isLogin,
//                 child: GestureDetector(
//                   onTap: () {
//                     loginController.forward();
//                     setState(() {
//                       isLogin = !isLogin;
//                     });
//                   },
//                   child: Center(
//                     child: Text(
//                       'Sign Up'.toUpperCase(),
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.lightGreen,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           AnimatedBuilder(
//             animation: loginController,
//             builder: (context, child) {
//               return _buildLoginWidgets();
//             },
//           ),
//           Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height / 2,
//                 child: Center(child: _buildLoginComponents()),
//               ))
//         ],
//       ),
//     );
//   }
// }

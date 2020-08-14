// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hydroponics/features/LoginRegister/Login.dart';
// import 'package:intl/date_symbol_data_local.dart';
// import 'package:provider/provider.dart';
// import 'package:hydroponics/core/constants/Screen_Resolution.dart';
// // import 'package:quickstart_2/core/constants/screen_resolution.dart';
// // import 'package:quickstart_2/features/camera/viewmodel/camera_viewmodel.dart';
// // import 'package:quickstart_2/features/login/view/login_selection_view.dart';

// class ScreenUtilsInit extends StatelessWidget {
//   _init(context) async {
//     // List<CameraDescription> cameras = await availableCameras();
//     // print('cameras: $cameras');
//     // if (cameras.length > 0) {
//     //   var firstCamera = cameras.first;

//     //   print('firstcamera: $firstCamera');

//     //   Provider.of<CameraViewModel>(context, listen: false)
//     //       .setCamera(firstCamera);
//     // }
//     // initializeDateFormatting('id_ID', null);
//   }

//   @override
//   Widget build(BuildContext context) {
//     ScreenUtil.init(context,
//         width: screenWidth, height: screenHeight, allowFontScaling: true);
//     _init(context);
//     return WillPopScope(
//       child: LoginScreen(),
//       onWillPop: () => showDialog<bool>(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Exit'),
//           content: Text('Apa anda yakin ingin keluar?'),
//           actions: <Widget>[
//             FlatButton(
//               child: Text('Tidak'),
//               onPressed: () => Navigator.pop(context),
//             ),
//             FlatButton(
//               child: Text('Ya'),
//               onPressed: () {
//                 SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/screens/splash_screen.dart';


// void main() =>
//     runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(360, 690),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_, child) {
//         return BlocProvider(
//           create: (context) => CubitCubit(),
//           child: MaterialApp(
//             // useInheritedMediaQuery: true,
//             locale: DevicePreview.locale(context),
//             builder: DevicePreview.appBuilder,
//             theme: ThemeData.light(),
//             darkTheme: ThemeData.dark(),
//             debugShowCheckedModeBanner: false,
//             // home: BlocScreen(),
//             // routes: {
//             //   'one': (context) => Home(),
//             //   'two': (context) => Detials(),
//             // },
//           ),
//         );
//       },
//     );
//   }
// }


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

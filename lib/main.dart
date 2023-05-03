import 'package:chromalize/providers/sendAndreceive.dart';
import 'package:chromalize/screens/onboding/onboding_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: sendAndreceive()),
        ],
        child: ChangeNotifierProvider(
            create: (BuildContext context) {},
            child: Consumer<sendAndreceive>(
              builder: (ctx, auth, _) => MaterialApp(
                debugShowCheckedModeBanner: false,
                debugShowMaterialGrid: false,
                title: 'Chromalize',
                theme: ThemeData(
                  scaffoldBackgroundColor: Color(0xFFEEF1F8),
                  primarySwatch: Colors.blue,
                  fontFamily: "Intel",
                  inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: Colors.white,
                    errorStyle: TextStyle(height: 0),
                    border: defaultInputBorder,
                    enabledBorder: defaultInputBorder,
                    focusedBorder: defaultInputBorder,
                    errorBorder: defaultInputBorder,
                  ),
                ),
                home: const OnbodingScreen(),
              ),
            )));
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(16)),
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2),
    width: 1,
  ),
);

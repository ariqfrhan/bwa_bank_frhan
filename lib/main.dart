import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: lightBg,
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                  color: blackColor
                ),
                centerTitle: true,
                backgroundColor: lightBg,
                elevation: 0,
                titleTextStyle:
                    blackText.copyWith(fontSize: 18, fontWeight: semibold))),
        initialRoute: Routes.splash,
        getPages: Routes.routes,
      ),
    );
  }
}

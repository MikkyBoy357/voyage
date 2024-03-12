import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voyage/screens/wrapper_screen.dart';
import 'package:voyage/view-model/providers/auth_provider.dart';
import 'package:voyage/view-model/providers/destination_provider.dart';

import 'constants/local_database/token_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TokenManager.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final String token;
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // print('>>>>$token');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DestinationProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        // home: token.isNotEmpty && JwtDecoder.isExpired(token) == false
        //     ? NavBar(
        //         token: token,
        //       )
        //     : SignInScreen(),
        home: const WrapperScreen(),
        // home: token.isNotEmpty && !JwtDecoder.isExpired(token)
        //     ? NavBar(token: token)
        //     : JwtDecoder.isExpired(token)
        //         ? SignInScreen()
        //         : () {
        //             TokenManager.removeToken('auth_token');
        //             return Container(); // Return a placeholder widget if necessary
        //           }(),
      ),
    );
  }
}

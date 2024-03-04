import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorscheme =ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 98, 65, 188),
  );

  var kDarkColorscheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125),
  );

void main() {
   runApp(
      MaterialApp(
        darkTheme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: kDarkColorscheme,
           cardTheme:const  CardTheme().copyWith(
            color: kDarkColorscheme.secondaryContainer,
            margin:const  EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
              ),
          ),
           elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kDarkColorscheme.primaryContainer,
              foregroundColor: kDarkColorscheme.onPrimary,
            ),
          ),

        ),

        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorscheme,
          appBarTheme:  const AppBarTheme().copyWith(
            backgroundColor: kColorscheme.onPrimaryContainer,
            foregroundColor: kColorscheme.primaryContainer,
          ),
          cardTheme:const  CardTheme().copyWith(
            color: kColorscheme.secondaryContainer,
            margin:const  EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
              ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorscheme.primaryContainer,
            ),
          ),
          
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorscheme.onSecondaryContainer,
              fontSize: 16,
            ),
          ),
        ),
       // themeMode: ThemeMode.system,  //default
      home: const Expenses(),
    ),
   );
}



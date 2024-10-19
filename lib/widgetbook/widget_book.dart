import 'package:aladia/pages/home.dart';
import 'package:aladia/pages/login.dart';
import 'package:aladia/provider/authProvider.dart';
import 'package:aladia/provider/theme_provider.dart';
import 'package:aladia/splash_screen.dart';
import 'package:aladia/widgets/email_input.dart';
import 'package:aladia/widgets/login_content.dart';
import 'package:aladia/widgets/or_divider.dart';
import 'package:aladia/widgets/social_buttons.dart';
import 'package:aladia/widgets/term_&_condition.dart';
import 'package:aladia/widgets/top_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
// import 'package:aladia/widgetbook/widget_book.directories.g.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const WidgetbookApp(
        directories: [],
      )));
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp(
      {super.key, required List<WidgetbookComponent> directories});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        WidgetbookComponent(
          name: 'SplashScreen',
          useCases: [
            WidgetbookUseCase(
              name: 'SplashScreen - Light Mode',
              builder: (_) => ChangeNotifierProvider(
                create: (_) => ThemeProvider(),
                child: MaterialApp(
                  theme: ThemeData(brightness: Brightness.light),
                  home: const SplashScreen(isDarkMode: false),
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'SplashScreen - Dark Mode',
              builder: (_) => ChangeNotifierProvider(
                create: (_) => ThemeProvider(),
                child: MaterialApp(
                  theme: ThemeData(brightness: Brightness.dark),
                  home: const SplashScreen(isDarkMode: true),
                ),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Button',
          useCases: [
            WidgetbookUseCase(
              name: 'Elevated Button',
              builder: (_) => Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Enter"),
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'Text Button',
              builder: (_) => Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Enter"),
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'Outlined Button',
              builder: (_) => Center(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Enter"),
                ),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Top Content',
          useCases: [
            WidgetbookUseCase(
              name: 'Top Content - Light Mode',
              builder: (_) => Center(
                child: TopContent(isDarkMode: false), // Light mode
              ),
            ),
            WidgetbookUseCase(
              name: 'Top Content - Dark Mode',
              builder: (_) => Center(
                child: TopContent(isDarkMode: true), // Dark mode
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Email Input',
          useCases: [
            WidgetbookUseCase(
              name: 'Email Input - Light Mode',
              builder: (_) => const Center(
                child: EmailInput(isDarkMode: false),
              ),
            ),
            WidgetbookUseCase(
              name: 'Email Input - Dark Mode',
              builder: (_) => const Center(
                child: EmailInput(isDarkMode: true),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Login Content',
          useCases: [
            WidgetbookUseCase(
              name: 'Login Content - Light Mode',
              builder: (_) => Center(
                child: ChangeNotifierProvider(
                    create: (context) => AuthProvider(),
                    child: const LoginContent(isDarkMode: false)),
              ),
            ),
            WidgetbookUseCase(
              name: 'Login Content - Dark Mode',
              builder: (_) => Center(
                child: ChangeNotifierProvider(
                    create: (context) => AuthProvider(),
                    child: const LoginContent(isDarkMode: true)),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Or Divider',
          useCases: [
            WidgetbookUseCase(
              name: 'Or Divider - Light Mode',
              builder: (_) => const Center(
                child: OrDivider(isDarkMode: false),
              ),
            ),
            WidgetbookUseCase(
              name: 'Or Divider - Dark Mode',
              builder: (_) => const Center(
                child: OrDivider(isDarkMode: true),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Social Buttons',
          useCases: [
            WidgetbookUseCase(
              name: 'Social Buttons - Light Mode',
              builder: (_) => Center(
                child: SocialButtons(isDarkMode: false),
              ),
            ),
            WidgetbookUseCase(
              name: 'Social Buttons - Dark Mode',
              builder: (_) => Center(
                child: SocialButtons(isDarkMode: true),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Terms and Conditions',
          useCases: [
            WidgetbookUseCase(
              name: 'Terms & Conditions - Light Mode',
              builder: (_) => Center(
                child: TermsAndConditions(isDarkMode: false), // Light mode
              ),
            ),
            WidgetbookUseCase(
              name: 'Terms & Conditions - Dark Mode',
              builder: (_) => Center(
                child: TermsAndConditions(isDarkMode: true), // Dark mode
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Login Page',
          useCases: [
            WidgetbookUseCase(
              name: 'Login Page - Light Mode',
              builder: (_) => ChangeNotifierProvider(
                create: (_) => ThemeProvider(),
                child: ChangeNotifierProvider(
                  create: (_) => AuthProvider(),
                  child: Builder(
                    builder: (context) => MaterialApp(
                      theme: ThemeData(brightness: Brightness.light),
                      home: const MyLogin(),
                    ),
                  ),
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'Login Page - Dark Mode',
              builder: (_) => ChangeNotifierProvider(
                create: (_) => ThemeProvider(),
                child: ChangeNotifierProvider(
                  create: (_) => AuthProvider(),
                  child: Builder(
                    builder: (context) => MaterialApp(
                      theme: ThemeData(brightness: Brightness.dark),
                      home: const MyLogin(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Home Page',
          useCases: [
            WidgetbookUseCase(
              name: 'Home Page - Light Mode',
              builder: (_) => ChangeNotifierProvider(
                create: (_) => ThemeProvider(),
                child: Builder(
                  builder: (context) => MaterialApp(
                    theme: ThemeData(brightness: Brightness.light),
                    home: const Home(),
                  ),
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'Home Page - Dark Mode',
              builder: (_) => ChangeNotifierProvider(
                create: (_) => ThemeProvider(),
                child: Builder(
                  builder: (context) => MaterialApp(
                    theme: ThemeData(brightness: Brightness.dark),
                    home: const Home(),
                  ),
                ),
              ),
            ),
          ],
        ),
        WidgetbookComponent(
          name: 'Button',
          useCases: [
            WidgetbookUseCase(
              name: 'Eleveted Enter',
              builder: (_) => Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Enter"),
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'Text Enter',
              builder: (_) => Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Enter"),
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'Outlined Enter',
              builder: (_) => Center(
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Enter"),
                ),
              ),
            ),
          ],
        ),
      ],
      addons: [
        DeviceFrameAddon(devices: [
          Devices.ios.iPhone13ProMax,
          Devices.android.samsungGalaxyA50,
          Devices.android.largeTablet
        ])
      ],
      // Generated directories
    );
  }
}

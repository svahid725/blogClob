import 'package:blog_club/gen/fonts.gen.dart';
import 'package:blog_club/onboarding.dart';
import 'package:blog_club/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blog_club/Home.dart';
import 'package:blog_club/Splash.dart';
import 'articles.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //static const defaultFontFamily = 'Avenir';

  static const secondaryTextColor = Color(0xff2D4379);
  static const primaryTextColor = Color(0xff0D253C);
  static const blueTextColor = Color(0XFF376AED);
  static const blueCaptionColor = Color(0XFF0047CC);
  static const defaultCaptionColor = Color(0XFF7B8BB2);

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //const primaryTextColor = Color(0xff0D253C);
    //const secondaryTextColor = Color(0xff2D4379);
    //const blueTextColor = Color(0XFF376AED);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                foregroundColor: primaryTextColor,
                elevation: 0,
                titleSpacing: 40),
            colorScheme: const ColorScheme.light(
                primary: blueTextColor,
                onPrimary: Colors.white,
                background: Color(0XFFE6EAF1),
                surface: Colors.white,
                onSurface: primaryTextColor,
                onBackground: primaryTextColor),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  const TextStyle(fontSize: 14, fontFamily: FontFamily.avenir)),
            )),
            snackBarTheme:
                const SnackBarThemeData(backgroundColor: primaryTextColor),
            textTheme: const TextTheme(
              subtitle1: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: secondaryTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w200),
              headline1: TextStyle(
                fontFamily: FontFamily.avenir,
                color: secondaryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              subtitle2: TextStyle(
                  fontFamily: FontFamily.avenir,
                  color: blueTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              headline4: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w700,
                  color: primaryTextColor,
                  fontSize: 24),
              headline5: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w700,
                  color: primaryTextColor,
                  fontSize: 20),
              headline6: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
              caption: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w700,
                  color: defaultCaptionColor,
                  fontSize: 10),
              bodyText1: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamily.avenir,
                  color: primaryTextColor),
              bodyText2: TextStyle(
                  fontSize: 12,
                  fontFamily: FontFamily.avenir,
                  color: secondaryTextColor),
            )),
        home: const SpalshScreen()
        //home: const ProfileScreen(),
        );
  }
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
int selectedScreenIndex = homeIndex;

class MainSreenState extends StatefulWidget {
  const MainSreenState({Key? key}) : super(key: key);

  @override
  State<MainSreenState> createState() => _MainSreenState();
}

class _MainSreenState extends State<MainSreenState> {
  final List<int> _history = [];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _menuKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    searchIndex: _searchKey,
    articleIndex: _articleKey,
    menuIndex: _menuKey
  };

  Future<bool> onWillPop() async {
    final NavigatorState currentSelectedNavigatorStateTab =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedNavigatorStateTab.canPop()) {
      currentSelectedNavigatorStateTab.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Stack(children: [
          IndexedStack(index: selectedScreenIndex, children: [
            _navigator(_homeKey, homeIndex, const HomeScreen()),
            _navigator(_articleKey, articleIndex, const ArticlesScreen()),
            _navigator(_searchKey, searchIndex, const SimpleScreen()),
            _navigator(_menuKey, menuIndex, const ProfileScreen()),
          ]),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _BottomNavigation(
                selectedIndex: selectedScreenIndex,
                onTab: ((index) {
                  setState(() {
                    _history.remove(selectedScreenIndex);
                    selectedScreenIndex = index;
                    _history.add(selectedScreenIndex);
                  });
                }),
              ))
        ]),
      ),
    );
  }

  Widget _navigator(GlobalKey key, index, Widget child) {
    return key.currentState == null && selectedScreenIndex != index
        ? Container()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => Offstage(
                    offstage: selectedScreenIndex != index, child: child)),
          );
  }
}

int screenNumber = 1;

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Screen $screenNumber',
              style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  screenNumber++;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SimpleScreen()));
                },
                child: const Icon(Icons.add, size: 40)),
          )
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  const _BottomNavigation(
      {Key? key, required this.onTab, required this.selectedIndex})
      : super(key: key);
  final Function(int index) onTab;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: Stack(children: [
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 65,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: const Color(0XFF2D2D2D).withOpacity(0.15),
              ),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BottomNavigationItem(
                    iconFileName: 'Home.png',
                    title: 'Home',
                    activeIconFileName: 'ActiveHome.png',
                    onTab: () {
                      onTab(homeIndex);
                    },
                    isActive: selectedIndex == homeIndex),
                _BottomNavigationItem(
                    iconFileName: 'Articles.png',
                    title: 'Article',
                    activeIconFileName: 'ActiveArticle.png',
                    onTab: () {
                      onTab(articleIndex);
                    },
                    isActive: selectedIndex == articleIndex),
                const SizedBox(width: 20),
                _BottomNavigationItem(
                  iconFileName: 'Search.png',
                  title: 'Search',
                  activeIconFileName: 'ActiveSearch.png',
                  onTab: () {
                    onTab(searchIndex);
                  },
                  isActive: selectedIndex == searchIndex,
                ),
                _BottomNavigationItem(
                  iconFileName: 'Menu.png',
                  title: 'Menu',
                  activeIconFileName: 'ActiveMenu.png',
                  onTab: () => onTab(menuIndex),
                  isActive: selectedIndex == menuIndex,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            height: 82,
            width: 65,
            alignment: Alignment.topCenter,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: MyApp.blueTextColor,
                  border: Border.all(color: Colors.white, width: 4)),
              child: Image.asset(
                'assets/img/icons/plus.png',
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String title;
  final String activeIconFileName;
  final bool isActive;
  final Function() onTab;

  const _BottomNavigationItem(
      {Key? key,
      required this.iconFileName,
      required this.title,
      required this.activeIconFileName,
      required this.onTab,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return InkWell(
      onTap: onTab,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.,
        children: [
          Image.asset(
            'assets/img/icons/${isActive ? activeIconFileName : iconFileName}',
            width: 24,
            height: 24,
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: themeData.textTheme.caption!.apply(
                color: isActive
                    ? themeData.primaryColor
                    : themeData.textTheme.caption!.color),
          )
        ],
      ),
    );
  }
}

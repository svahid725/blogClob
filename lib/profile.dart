import 'package:blog_club/data.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'gen/assets.gen.dart';
import 'package:blog_club/Home.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(bottom: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBar(
                    backgroundColor: themeData.colorScheme.background,
                    title: const Text('Profile'),
                    actions: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
                      const SizedBox(width: 28)
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 284,
                        margin: const EdgeInsets.fromLTRB(40, 16, 40, 45),
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                            color: themeData.colorScheme.surface,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 20,
                                  color: const Color(0XFF5282FF).withOpacity(0.2)),
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Assets.img.stories.story5
                                      .image(height: 84, width: 84),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 24),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('@joviedan',
                                            style: themeData.textTheme.headline1!
                                                .copyWith(
                                                fontWeight: FontWeight.w400)),
                                        const SizedBox(height: 4),
                                        Text('Jovi Daniel',
                                            style: themeData.textTheme.headline6),
                                        const SizedBox(height: 8),
                                        Text(
                                          'UX Designer',
                                          style: themeData.textTheme.subtitle2!
                                              .copyWith(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 24),
                            Text('About me',
                                style: themeData.textTheme.headline5!
                                    .copyWith(fontSize: 16)),
                            const SizedBox(height: 8),
                            Text(
                              'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                              style: themeData.textTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: MyApp.secondaryTextColor),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 96,
                        right: 96,
                          bottom: 0,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                            //color: Colors.blueAccent,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 30,
                                    color: themeData.colorScheme.onBackground
                                        .withOpacity(0.4))
                              ]),
                        ),
                      ),
                      Positioned(
                        top: 260,
                        left: 72,
                        right: 72,
                        child: Container(
                          height: 68,
                          decoration: BoxDecoration(
                              color: themeData.colorScheme.primary,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0XFF2151CD),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '52',
                                        style: TextStyle(
                                          color: themeData.colorScheme.onPrimary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text('Post',
                                          style: TextStyle(
                                            color: themeData.colorScheme.onPrimary,
                                            fontSize: 12,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '250',
                                      style: TextStyle(
                                        color: themeData.colorScheme.onPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text('Following',
                                        style: TextStyle(
                                          color: themeData.colorScheme.onPrimary,
                                          fontSize: 12,
                                        )),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '4.5K',
                                      style: TextStyle(
                                        color: themeData.colorScheme.onPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text('Followers',
                                        style: TextStyle(
                                          color: themeData.colorScheme.onPrimary,
                                          fontSize: 12,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.fromLTRB(40, 32, 40, 32),
                    decoration: BoxDecoration(
                        color: themeData.colorScheme.surface,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(28),
                            topRight: Radius.circular(28))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                                  'My Posts',
                                  style: themeData.textTheme.headline6!
                                      .copyWith(fontSize: 20),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: Assets.img.icons.grid.svg()),
                            IconButton(
                                onPressed: () {},
                                icon: Assets.img.icons.table.svg()),
                          ],
                        ),
                        for (int i = 0; i < posts.length; i++) Post(post: posts[i])
                      ],
                    ),
                  ),
                ],
              ),
            )
        ));
  }
}

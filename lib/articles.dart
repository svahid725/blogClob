import 'package:blog_club/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:blog_club/gen/assets.gen.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: 65),
      child: Scaffold(
        backgroundColor: themeData.colorScheme.surface,
        floatingActionButton: Container(
            width: 111,
            height: 48,
            decoration: BoxDecoration(
                color: themeData.colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 18,
                      color: themeData.colorScheme.primary.withOpacity(0.5))
                ]),
            child: InkWell(
              onTap: () => showSnackBar(context, 'liked !'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Assets.img.icons.thumbs.svg(),
                  const SizedBox(width: 8),
                  Text(
                    '2.1k',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: themeData.colorScheme.onPrimary),
                  )
                ],
              ),
            )),
        body: Stack(children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.more_horiz_rounded)),
                    const SizedBox(width: 28)
                  ],
                  title: Text(
                    'Articles',
                    style: themeData.textTheme.headline4,
                  )),
              SliverList(
                  delegate: SliverChildListDelegate.fixed([
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Column(
                    children: [
                      Text(
                        'Four Things Every Woman Needs To Know',
                        style: themeData.textTheme.headline4,
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.img.stories.story5.image(
                                  height: 48, width: 48, fit: BoxFit.cover)),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Richard Gervain',
                                  style: themeData.textTheme.headline1,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '2 min ago',
                                  style: themeData.textTheme.bodyText2,
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showSnackBar(
                                  context, 'Article+ is send to Haniyeh');
                            },
                            icon: Icon(Icons.send,
                                color: themeData.colorScheme.primary),
                          ),
                          //const SizedBox(width: 10),
                          IconButton(
                            onPressed: () {
                              showSnackBar(context, 'article is saved!');
                            },
                            icon: Icon(CupertinoIcons.bookmark,
                                color: themeData.colorScheme.primary),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SingleChildScrollView(
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                        child: Assets.img.background.singlePost.image())),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 28, 40, 16),
                  child: Column(
                    children: [
                      Text(
                        'A man’s sexuality is never your mind responsibility.',
                        style: themeData.textTheme.headline6!
                            .apply(color: MyApp.primaryTextColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          'This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
                          style: themeData.textTheme.headline1!
                              .copyWith(fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                )
              ])),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    themeData.colorScheme.surface,
                    themeData.colorScheme.surface.withOpacity(0.05)
                  ])),
            ),
          )
        ]),
      ),
    );
  }

  void showSnackBar(BuildContext context, String massege) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(massege)));
  }
}

import 'package:blog_club/articles.dart';
import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/gen/fonts.gen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40,0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi, Vahid!',
                        style: themeData.textTheme.subtitle1,
                      ),
                      Assets.img.icons.notification
                          .image(height: 32, width: 32),
                    ]),
              ), //hi vahid
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 0, 16),
                child: Text("Explore today's",
                    style: themeData.textTheme.headline4),
              ), //explore today's
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
                  child: _StoryList(stories: stories)), // categories
              const _CategoryList(),
              const _PostList(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (context, index, realIndex) {
        return _CategoryItem(
          left: realIndex == 0 ? 40 : 8,
          right: realIndex == categories.length - 1 ? 40 : 8,
          category: categories[realIndex],
        );
      },
      options: CarouselOptions(
          initialPage: 0,
          aspectRatio: 1.2,
          scrollDirection: Axis.horizontal,
          disableCenter: true,
          viewportFraction: 0.8,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          scrollPhysics: const BouncingScrollPhysics(),
          enlargeStrategy: CenterPageEnlargeStrategy.height),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;

  const _CategoryItem({
    Key? key,
    required this.category,
    required this.left,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(children: [
        Positioned.fill(
          left: 55,
          right: 55,
          top: 2,
          //bottom: 24,
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0XAA0D253C),
                  blurRadius: 20,
                )
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ClipRRect(
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: const LinearGradient(
                    colors: [Color(0xFF0D253C), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center),
              )),
        ),
        Positioned(
          bottom: 34,
          left: 34,
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .apply(color: Colors.white),
          ),
        )
      ]),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    Key? key,
    required this.stories,
  }) : super(key: key);

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: stories.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 2, 5, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? _profileImageAfterView()
                  : _profileImageBeforeView(),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/img/icons/${story.iconFileName}',
                    width: 20,
                    height: 20,
                  ))
            ],
          ),
          const SizedBox(height: 6),
          Text(story.name)
        ],
      ),
    );
  }

  Container _profileImageBeforeView() {
    return Container(
      height: 68,
      width: 68,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: const LinearGradient(begin: Alignment.topCenter, colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB)
          ])),
      child: Container(
        height: 54,
        width: 54,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(22)),
        padding: const EdgeInsets.all(4),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageAfterView() {
    return SizedBox(
      height: 68,
      width: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        color: const Color(0XFF7B8BB2),
        padding: const EdgeInsets.all(6),
        radius: const Radius.circular(24),
        dashPattern: const [8, 3],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        "assets/img/stories/${story.imageFileName}",
      ),
    );
  }
}

class _PostList extends StatelessWidget {
  const _PostList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 100),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest News',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More',
                  style: TextStyle(
                    color: Color(0XFF376AED),
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
              itemCount: posts.length,
              itemExtent: 141,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                final post = posts[index];
                return Post(post: post);
              })
        ],
      ),
    );
  }
}

class Post extends StatelessWidget {
  const Post({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostData post;

  @override
  Widget build(BuildContext context) {
    const Color buttomRowColor = MyApp.secondaryTextColor;
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder:(context) => const ArticlesScreen())),
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        height: 144,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(blurRadius: 15, color: Color(0X1A5282FF))
            ]),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:
                Image.asset('assets/img/posts/small/${post.imageFileName}')),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 15,left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                      child: Text(post.title,
                          style: Theme.of(context).textTheme.subtitle2),
                    ),
                    Text(
                      post.caption,
                      style: TextStyle(
                          color: Theme.of(context).textTheme.headline5!.color,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          CupertinoIcons.hand_thumbsup,
                          size: 16,
                          color: buttomRowColor,
                        ),
                        const SizedBox(width: 7),
                        Text(
                          post.likes,
                          style: const TextStyle(
                              color: buttomRowColor,
                              fontFamily: FontFamily.avenir,
                              fontSize: 12),
                        ),
                        const SizedBox(width: 16),
                        const Icon(CupertinoIcons.clock,
                            size: 16, color: buttomRowColor),
                        const SizedBox(width: 6),
                        Text(post.time,
                            style: const TextStyle(
                                color: buttomRowColor, fontSize: 12)),

                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Icon(
                            post.isBookmarked
                                ? CupertinoIcons.bookmark_fill
                                : CupertinoIcons.bookmark,
                            size: 16,
                            color: MyApp.blueTextColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

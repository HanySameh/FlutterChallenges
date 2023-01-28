import '../../../gen/assets.gen.dart';
import '../models/article_model.dart';
import '../models/category_model.dart';
import '../models/on_boarding_model.dart';
import '../models/post_model.dart';
import '../models/profile_model.dart';
import '../models/story_model.dart';

class AppDataSource {
  static final AppDataSource _instance = AppDataSource._();

  AppDataSource._();

  factory AppDataSource() => _instance;

  List<OnBoardingModel> get onBoardingItems => [
        for (var i = 0; i < 4; i++)
          OnBoardingModel(
            title: 'Read the article you want instantly',
            description:
                'You can read thousands of article on One Pice Club, save them in the application and there them with your loved ones.',
          ),
      ];

  List<PostModel> get posts {
    return [
      PostModel(
        id: 0,
        title: 'MacBook Pro with M1 Pro and M1 Max review',
        caption: 'THE VERGE',
        isBookmarked: false,
        likes: '3.1k',
        time: '1hr ago',
        imageFileName: Assets.img.posts.small.smallPost1.path,
      ),
      PostModel(
        id: 1,
        title: 'BMW M5 Competition Review 2021',
        caption: 'TOP GEAR',
        isBookmarked: false,
        likes: '1.2k',
        time: '2hr ago',
        imageFileName: Assets.img.posts.small.smallPost2.path,
      ),
      PostModel(
        id: 2,
        title: 'Step design sprint for UX beginner',
        caption: 'Ux Design',
        isBookmarked: true,
        likes: '2k',
        time: '41hr ago',
        imageFileName: Assets.img.posts.small.smallPost3.path,
      ),
    ];
  }

  List<StoryModel> get stories {
    return [
      StoryModel(
        id: 0,
        name: 'Emilia',
        imageFileName: Assets.img.stories.story9.path,
        iconFileName: Assets.img.icons.category1.path,
        isViewed: false,
      ),
      StoryModel(
        id: 1,
        name: 'Richard',
        imageFileName: Assets.img.stories.story10.path,
        iconFileName: Assets.img.icons.category2.path,
        isViewed: false,
      ),
      StoryModel(
        id: 2,
        name: 'Jasmine',
        imageFileName: Assets.img.stories.story1.path,
        iconFileName: Assets.img.icons.category3.path,
        isViewed: true,
      ),
      StoryModel(
        id: 3,
        name: 'Lucas',
        imageFileName: Assets.img.stories.story3.path,
        iconFileName: Assets.img.icons.category4.path,
        isViewed: false,
      ),
      StoryModel(
        id: 4,
        name: 'Isabella',
        imageFileName: Assets.img.stories.story4.path,
        iconFileName: Assets.img.icons.category2.path,
        isViewed: false,
      ),
      StoryModel(
        id: 5,
        name: 'Olivia',
        imageFileName: Assets.img.stories.story6.path,
        iconFileName: Assets.img.icons.category1.path,
        isViewed: false,
      ),
      StoryModel(
        id: 6,
        name: 'Amelia',
        imageFileName: Assets.img.stories.story7.path,
        iconFileName: Assets.img.icons.category4.path,
        isViewed: false,
      ),
      StoryModel(
        id: 7,
        name: 'Grace',
        imageFileName: Assets.img.stories.story2.path,
        iconFileName: Assets.img.icons.category3.path,
        isViewed: false,
      ),
    ];
  }

  ProfileModel get profile {
    return ProfileModel(
      id: '@HanySameh',
      fullName: 'Hany Sameh',
      field: 'Mobile App Dev',
      aboutMe:
          'I\'m creative Mobile App Developer based in Egypt With 2 years of experience as a mobile developer, I have acquired the skills and knowledge necessary to make your project a success. I enjoy every step while working.',
      posts: posts,
      following: '200',
      followers: '8.5k',
      profileImageFileName: Assets.img.stories.story8.path,
    );
  }

  List<CategoryModel> get categories {
    return [
      CategoryModel(
        id: 101,
        title: 'Technology',
        imageFileName: Assets.img.posts.large.largePost1.path,
      ),
      CategoryModel(
        id: 102,
        title: 'Cinema',
        imageFileName: Assets.img.posts.large.largePost2.path,
      ),
      CategoryModel(
        id: 103,
        title: 'Transportation',
        imageFileName: Assets.img.posts.large.largePost3.path,
      ),
      CategoryModel(
        id: 104,
        title: 'Adventure',
        imageFileName: Assets.img.posts.large.largePost4.path,
      ),
      CategoryModel(
        id: 105,
        title: 'Artificial Intelligence',
        imageFileName: Assets.img.posts.large.largePost5.path,
      ),
      CategoryModel(
        id: 106,
        title: 'Economy',
        imageFileName: Assets.img.posts.large.largePost6.path,
      ),
    ];
  }

  ArticleModel get article {
    return ArticleModel(
      author: 'Richard Gervain',
      title: 'Four Things Every Woman Needs To Know',
      caption: 'A man\'s sexuality is never your mind responsibility.',
      description:
          'This one got an incredible amount of backlash the last time I said it, so I\'m going to say it again: a man\'s sexuality is never, ever your responsibility, under any circumstances. Whether it\'s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn\'t whether you ought to “take care of him” or “put out” because it\'s been a while or he\'s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I\'m going to say it again: a man\'s sexuality is never, ever your responsibility, under any circumstances. Whether it\'s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn\'t whether you ought to “take care of him” or “put out” because it\'s been a while or he\'s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I\'m going to say it again: a man\'s sexuality is never, ever your responsibility, under any circumstances. Whether it\'s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn\'t whether you ought to “take care of him” or “put out” because it\'s been a while or he\'s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.',
      likes: '2.1k',
      time: '2m ago',
      isBookmarked: false,
      postImageFileName: Assets.img.posts.singlePost.path,
      authorImageFileName: Assets.img.stories.story9.path,
    );
  }
}

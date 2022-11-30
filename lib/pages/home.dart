import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagramexample/components/avatar_widget.dart';
import 'package:instagramexample/components/post_widget.dart';
import 'package:instagramexample/utils/models.dart';
import 'package:instagramexample/utils/ui_utils.dart';

class Home extends StatefulWidget {
  final ScrollController scrollController;

  Home({required this.scrollController});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _posts = <Post>[
    Post(
      user: grootlover,
      imageUrls: [
        'assets/images/groot1.jpg',
        'assets/images/groot4.jpg',
        'assets/images/groot5.jpg',
      ],
      likes: [
        Like(user: rocket),
        Like(user: starlord),
        Like(user: gamora),
        Like(user: nickwu241),
      ],
      comments: [
        Comment(
          text: 'So we’re saving the galaxy again? #gotg',
          user: rocket,
          commentedAt: DateTime(2019, 5, 23, 14, 35, 0),
          likes: [Like(user: nickwu241)],
        ),
      ],
      location: 'Earth',
      postedAt: DateTime(2019, 5, 23, 12, 35, 0),
    ),
    Post(
      user: nickwu241,
      imageUrls: ['assets/images/groot2.jpg'],
      likes: [],
      comments: [],
      location: 'Knowhere',
      postedAt: DateTime(2019, 5, 21, 6, 0, 0),
    ),
    Post(
      user: nebula,
      imageUrls: ['assets/images/groot6.jpg'],
      likes: [Like(user: nickwu241)],
      comments: [],
      location: 'Nine Realms',
      postedAt: DateTime(2019, 5, 2, 0, 0, 0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        if (i == 0) {
          return StoriesBarWidget();
        }
        return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Text('No records');
              }
              return PostWidget(snapshot.data?.docs[i - 1] as Post);
            });

        // PostWidget(_posts[i - 1]);
      },
    );
  }
}

class StoriesBarWidget extends StatelessWidget {
  final _users = <User>[
    currentUser,
    grootlover,
    rocket,
    nebula,
    starlord,
    gamora,
  ];

  void _onUserStoryTap(BuildContext context, int i) {
    final message =
        i == 0 ? 'Add to Your Story' : "View ${_users[i].name}'s Story";
    showSnackbar(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return AvatarWidget(
            user: _users[i],
            onTap: () => _onUserStoryTap(context, i),
            isLarge: true,
            isShowingUsernameLabel: true,
            isCurrentUserStory: i == 0,
          );
        },
        itemCount: _users.length,
      ),
    );
  }
}

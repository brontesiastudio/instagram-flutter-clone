import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone_flutter/screens/profile_screen.dart';
import 'package:instagram_clone_flutter/utils/colors.dart';
import 'package:instagram_clone_flutter/utils/mock_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Form(
          child: TextFormField(
            controller: searchController,
            decoration:
                const InputDecoration(labelText: 'Search for a user...'),
            onFieldSubmitted: (String _) {
              setState(() {
                isShowUsers = true;
              });
            },
          ),
        ),
      ),
      body: isShowUsers
          ? ListView.builder(
              itemCount: mockPosts.length,
              itemBuilder: (context, index) {
                final userMap = {
                  'uid': mockPosts[index]['uid'],
                  'photoUrl': mockPosts[index]['profImage'],
                  'username': mockPosts[index]['username'],
                };
                return InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfileScreen(
                        uid: userMap['uid'] as String,
                      ),
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        userMap['photoUrl'] as String,
                      ),
                      radius: 16,
                    ),
                    title: Text(userMap['username'] as String),
                  ),
                );
              },
            )
          : MasonryGridView.count(
              crossAxisCount: 3,
              itemCount: mockPosts.length,
              itemBuilder: (context, index) => Image.network(
                mockPosts[index]['postUrl'],
                fit: BoxFit.cover,
              ),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
    );
  }
}

import 'package:chting_app/api/apis.dart';
import 'package:chting_app/helper/dialogs.dart';
import 'package:chting_app/screens/auth/login_screen.dart';
import 'package:chting_app/screens/home_screen.dart';
import 'package:chting_app/screens/upload_file_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';



class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({Key? key}) : super(key: key);

  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<NewsItem> newsItems = [
    NewsItem(
      title: 'Flutter News',
      description:
          'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    NewsItem(
      title: 'Dart News',
      description:
          'Dart is a client-optimized programming language for apps on multiple platforms. It is developed by Google.',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    NewsItem(
      title: 'Material Design News',
      description:
          'Material Design is a design system created by Google to help teams build high-quality digital experiences for Android, iOS, Flutter, and the web.',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('News Feed'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Redex',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Upload PDF'),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) =>const UploadFilesPage()));
              },

            ),
            ListTile(
              title: const Text('Redex Balace'),
                onTap: () {
                //Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              title: const Text('Redex Chats'),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen()));
              },
            ),
            ListTile(
              title: const Text('FAQ'),
              onTap: () {
                //Navigator.push(context,MaterialPageRoute(builder: (context) => const UploadFilesPage()));
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () async {
                  //for showing progress dialog
                  Dialogs.showProgressBar(context);

                  await APIs.updateActiveStatus(false);

                  //sign out from app
                  await APIs.auth.signOut().then((value) async {
                    await GoogleSignIn().signOut().then((value) {
                      //for hiding progress dialog
                      Navigator.pop(context);

                      //for moving to home screen
                      Navigator.pop(context);

                      // APIs.auth = FirebaseAuth.instance;

                      //replacing home screen with login screen
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()));
                    });
                  });
                },
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Text(
                'Notifications',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Notification 1'),
              onTap: () {
                // Handle notification 1 tap
              },
            ),
            ListTile(
              title: const Text('Notification 2'),
              onTap: () {
                // Handle notification 2 tap
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                // Handle news item tap
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      newsItems[index].imageUrl,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          newsItems[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          newsItems[index].description,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NewsItem {
  final String title;
  final String description;
  final String imageUrl;

  NewsItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

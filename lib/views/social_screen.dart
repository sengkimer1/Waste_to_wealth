import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'create_post_screen.dart';

class SocialScreen extends StatefulWidget {
  const SocialScreen({super.key});

  @override
  _SocialScreenState createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> posts = [
    {
      'profilePic': 'assets/pic4.jpeg',
      'username': 'Kim Er',
      'timeAgo': '2h ago',
      'postText': 'Hey lovely people. Please suggest me',
      'postImage': 'assets/pic1.jpeg',
      'category': 'Land',
      'likes': 300,
      'comments': 20,
    },
    {
      'profilePic': 'assets/pic3.jpeg',
      'username': 'John Doe',
      'timeAgo': '5h ago',
      'postText': 'Recycling is a must!',
      'postImage': 'assets/pic2.jpeg',
      'category': 'Plastic',
      'likes': 150,
      'comments': 10,
    },
     {
      'profilePic': 'assets/pic4.jpeg',
      'username': 'John Doe',
      'timeAgo': '5h ago',
      'postText': 'Recycling is a must!',
      'postImage': 'assets/pic2.jpeg',
      'category': 'Plastic',
      'likes': 150,
      'comments': 10,
    },
  ];

  void filterPosts(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  // Navigate to create post screen
  void _navigateToCreatePost() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreatePostScreen()),
    );
    
    // Handle the result when user creates a post
    if (result != null) {
      // You can add the new post to your posts list here
      setState(() {
        posts.insert(0, {
          'profilePic': 'assets/pic4.jpeg', // Default profile pic
          'username': 'Current User', // Replace with actual username
          'timeAgo': 'Just now',
          'postText': result['description'],
          'postImage': 'assets/pic1.jpeg', // Replace with actual image
          'category': selectedCategory,
          'likes': 0,
          'comments': 0,
          'raiseFund': result['raiseFund'],
          'justPosting': result['justPosting'],
        });
      });
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Post created successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredPosts =
        selectedCategory == 'All'
            ? posts
            : posts
                .where((post) => post['category'] == selectedCategory)
                .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Green Social',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E553B),
          ),
        ),
        actions: [
          IconButton(
            onPressed: _navigateToCreatePost,
            icon: SvgPicture.asset(
              'assets/icons/add-plus-circle.svg',
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildTag('All'),
                  _buildTag('Land'),
                  _buildTag('Tree'),
                  _buildTag('Temperature'),
                  _buildTag('Plastic'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children:
                  filteredPosts.map((post) => _buildPost(post)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    bool isSelected = selectedCategory == text;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () => filterPosts(text),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green[300] : Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPost(Map<String, dynamic> post) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(post['profilePic']),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['username'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        post['timeAgo'],
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                if (post['category'] == 'Land' || post['category'] == 'Tree' || post['category']=='')
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Raise Fund',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Text(post['postText']),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(post['postImage']),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text('${post['likes']}'),
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.comment, color: Colors.blueGrey),
                    ),
                    const SizedBox(width: 5),
                    Text('${post['comments']} comment'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

